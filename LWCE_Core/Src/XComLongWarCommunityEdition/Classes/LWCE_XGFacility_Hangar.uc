class LWCE_XGFacility_Hangar extends XGFacility_Hangar
    config(LWCEQualityOfLife);

var const localized array<string> PilotNames;
var const localized array<string> PilotRanks;

var config bool bAutoNicknameNewPilots;

var int m_iCEBestWeaponEquipped;

function AddDropship()
{
    if (m_kSkyranger == none)
    {
        m_kSkyranger = Spawn(class'LWCE_XGShip_Dropship');
        m_kSkyranger.Init(ITEMTREE().GetShip(eShip_Skyranger));
        m_kSkyranger.m_strCallsign = m_strCallsignSkyranger;
    }
}

function AddFirestorm(int iContinent)
{
    local int iInterceptorIndex, I;
    local XGShip_Interceptor kFirestorm;

    iInterceptorIndex = INDEX_NONE;
    kFirestorm = none;

    // Find the interceptor pilot with the most kills
    for (I = 0; I < m_arrInts.Length; I++)
    {
        if (m_arrInts[I] != none && !m_arrInts[I].IsFirestorm())
        {
            if (iInterceptorIndex == INDEX_NONE || m_arrInts[I].m_iConfirmedKills > m_arrInts[iInterceptorIndex].m_iConfirmedKills)
            {
                iInterceptorIndex = I;
            }
        }
    }

    kFirestorm = Spawn(class'LWCE_XGShip_Interceptor');
    kFirestorm.m_iHomeContinent = HQ().GetContinent();
    kFirestorm.m_iHomeBay = GetAvailableBay();
    kFirestorm.Init(ITEMTREE().GetShip(eShip_Firestorm));
    m_iFirestormCounter += 1;

    if (iInterceptorIndex >= 0)
    {
        // Swap callsign and kill count with the chosen interceptor (aka swap pilots)
        kFirestorm.m_strCallsign = m_arrInts[iInterceptorIndex].m_strCallsign;
        kFirestorm.m_iConfirmedKills = m_arrInts[iInterceptorIndex].m_iConfirmedKills;
        m_iInterceptorCounter += 1;

        if (bAutoNicknameNewPilots)
        {
            AssignRandomCallsign(m_arrInts[iInterceptorIndex]);
        }
        else
        {
            m_arrInts[iInterceptorIndex].m_strCallsign = m_strCallsignInterceptor $ "-" $ string(m_iInterceptorCounter);
            m_arrInts[iInterceptorIndex].m_iConfirmedKills = 0;
        }
    }
    else
    {
        if (bAutoNicknameNewPilots)
        {
            AssignRandomCallsign(kFirestorm);
        }
        else
        {
            kFirestorm.m_strCallsign = m_strCallsignFireStorm $ "-" $ string(m_iFirestormCounter);
        }
    }

    m_arrInts.AddItem(kFirestorm);

    ReorderCraft();
    kFirestorm.UpdateHangarShip();
    UpdateHangarBays();
    GEOSCAPE().World().m_kFundingCouncil.OnShipAdded(eShip_Firestorm, HQ().GetContinent());
}

function AddInterceptor(int iContinent)
{
    local XGShip_Interceptor kInterceptor;

    if (iContinent == -1)
    {
        iContinent = HQ().GetContinent();
    }

    kInterceptor = Spawn(class'LWCE_XGShip_Interceptor');
    kInterceptor.m_iHomeContinent = iContinent;

    if (iContinent == HQ().GetContinent())
    {
        kInterceptor.m_iHomeBay = GetAvailableBay();
    }

    kInterceptor.Init(ITEMTREE().GetShip(eShip_Interceptor));

    m_iInterceptorCounter += 1;
    kInterceptor.m_strCallsign = m_strCallsignInterceptor $ "-" $ string(m_iInterceptorCounter);

    m_arrInts.AddItem(kInterceptor);

    if (bAutoNicknameNewPilots)
    {
        AssignRandomCallsign(kInterceptor);
    }

    ReorderCraft();
    kInterceptor.UpdateHangarShip();
    UpdateHangarBays();

    GEOSCAPE().World().m_kFundingCouncil.OnShipAdded(eShip_Interceptor, iContinent);
}

function EquipWeapon(EItemType eItem, XGShip_Interceptor kShip)
{
    `LWCE_LOG_DEPRECATED_CLS(EquipWeapon);
}

function LWCE_EquipWeapon(int iItemId, XGShip_Interceptor kShip)
{
    STORAGE().RemoveItem(iItemId, 1);
    Sound().PlaySFX(SNDLIB().SFX_Facility_ConstructItem);
    LWCE_XGShip_Interceptor(kShip).LWCE_EquipWeapon(iItemId);
    kShip.m_iStatus = eShipStatus_Rearming;

    if (iItemId == `LW_ITEM_ID(StingrayMissiles) || iItemId == `LW_ITEM_ID(AvalancheMissiles))
    {
        kShip.m_iHoursDown = 12;
    }
    else
    {
        kShip.m_iHoursDown = class'XGTacticalGameCore'.default.INTERCEPTOR_REARM_HOURS;
    }

    if (iItemId > m_iCEBestWeaponEquipped)
    {
        m_iCEBestWeaponEquipped = iItemId;
    }
}

function TContinentInfo GetContinentInfo(EContinent eCont)
{
    local LWCE_XGFacility_Engineering kEngineering;
    local TContinentInfo kInfo;
    local LWCE_TItemProject kProject;
    local int iOrder;

    kEngineering = `LWCE_ENGINEERING;

    kInfo.eCont = eCont;
    kInfo.strContinentName.StrValue = Continent(eCont).GetName();
    kInfo.arrCraft = GetInterceptorsByContinent(eCont);
    kInfo.iNumShips = kInfo.arrCraft.Length;

    for (iOrder = 0; iOrder < HQ().m_akInterceptorOrders.Length; iOrder++)
    {
        if (HQ().m_akInterceptorOrders[iOrder].iDestinationContinent == eCont)
        {
            kInfo.m_arrInterceptorOrderIndexes.AddItem(iOrder);
            kInfo.iNumShips += HQ().m_akInterceptorOrders[iOrder].iNumInterceptors;
        }
    }

    // For the home continent, check for any Firestorms being built
    if (eCont == `HQGAME.GetGameCore().GetHQ().GetContinent())
    {
        foreach kEngineering.m_arrCEItemProjects(kProject)
        {
            if (kProject.iItemId == `LW_ITEM_ID(Firestorm))
            {
                kInfo.iNumShips += kProject.iQuantity;
            }
        }
    }

    return kInfo;
}

function string GetRankForKills(int iKills)
{
    local int Index;

    Index = Clamp(iKills, 0, PilotRanks.Length - 1);

    while (Index >= 0)
    {
        if (PilotRanks[Index] != "")
        {
            return PilotRanks[Index];
        }

        Index--;
    }

    return "";
}

function array<TItem> GetUpgrades(XGShip_Interceptor kShip)
{
    local array<TItem> arrItems;
    arrItems.Add(0);

    `LWCE_LOG_DEPRECATED_CLS(GetUpgrades);

    return arrItems;
}

function array<LWCE_TItem> LWCE_GetUpgrades(XGShip_Interceptor kShip)
{
    local LWCE_XGItemTree kItemTree;
    local XGStorage kStorage;
    local array<LWCE_TItem> arrItems;
    local LWCE_TItem kItem;

    kItemTree = `LWCE_ITEMTREE;
    kStorage = STORAGE();

    foreach kItemTree.m_arrCEItems(kItem)
    {
        if (kItemTree.IsShipWeapon(kItem.iItemId) && kStorage.GetNumItemsAvailable(kItem.iItemId) > 0)
        {
            arrItems.AddItem(kItem);
        }
    }

    return arrItems;
}

static function EShipWeapon ItemTypeToShipWeapon(EItemType eItem)
{
    `LWCE_LOG_DEPRECATED(ItemTypeToShipWeapon);
    return 0;
}

static function int LWCE_ItemTypeToShipWeapon(int iItemId)
{
    // TODO: add mod hook
    switch (iItemId)
    {
        case `LW_ITEM_ID(StingrayMissiles):
            return eShipWeapon_Stingray;
        case `LW_ITEM_ID(PhoenixCannon):
            return eShipWeapon_Cannon;
        case `LW_ITEM_ID(AvalancheMissiles):
            return eShipWeapon_Avalanche;
        case `LW_ITEM_ID(LaserCannon):
            return eShipWeapon_Laser;
        case `LW_ITEM_ID(PlasmaCannon):
            return eShipWeapon_Plasma;
        case `LW_ITEM_ID(EMPCannon):
            return eShipWeapon_EMP;
        case `LW_ITEM_ID(FusionLance):
            return eShipWeapon_Fusion;
    }

    return 0;
}

function LandDropship(XGShip_Dropship kSkyranger)
{
    local LWCE_XGFacility_Labs kLabs;
    local array<LWCE_TTechState> arrPreLandTechs, arrPostLandTechs;
    local TMissionReward kEmptyReward;

    kLabs = `LWCE_LABS;

    arrPreLandTechs = kLabs.LWCE_GetCurrentTechStates();
    UnloadArtifacts(kSkyranger);

    if (kSkyranger.CargoInfo.m_iBattleResult == eResult_Victory)
    {
        if (RewardIsValid(kSkyranger.CargoInfo.m_kReward))
        {
            GiveMissionReward(kSkyranger);
            HQ().m_kLastReward = kSkyranger.CargoInfo.m_kReward;
        }
    }

    arrPostLandTechs = kLabs.LWCE_GetCurrentTechStates();
    kLabs.LWCE_CompilePostMissionReport(arrPreLandTechs, arrPostLandTechs);

    BARRACKS().LandSoldiers(kSkyranger);
    kSkyranger.CargoInfo.m_kReward = kEmptyReward;
    GEOSCAPE().Resume();

    if (ISCONTROLLED() && Game().GetNumMissionsTaken() == 1)
    {
        kLabs.m_arrMissionResults.Remove(0, kLabs.m_arrMissionResults.Length);
    }
}

function UnloadArtifacts(XGShip_Dropship kSkyranger)
{
    local int Index, iItemId, iNumArtifacts;
    local LWCE_XGDropshipCargoInfo kCargo;
    local LWCE_XGHeadquarters kHQ;
    local LWCE_XGItemTree kItemTree;

    kCargo = LWCE_XGDropshipCargoInfo(kSkyranger.CargoInfo);
    kHQ = `LWCE_HQ;
    kItemTree = `LWCE_ITEMTREE;

    kHQ.m_kCELastCargoArtifacts = Spawn(class'LWCEItemContainer');
    kHQ.m_kCELastCargoArtifacts.CopyFrom(kCargo.m_kArtifactsContainer);
    `LWCE_LOG_CLS("Unloading artifacts from dropship: there are " $ kCargo.m_kArtifactsContainer.m_arrEntries.Length $ " entries to process");

    for (Index = 0; Index < kCargo.m_kArtifactsContainer.m_arrEntries.Length; Index++)
    {
        iItemId = kCargo.m_kArtifactsContainer.m_arrEntries[Index].iItemId;
        iNumArtifacts = kCargo.m_kArtifactsContainer.m_arrEntries[Index].iQuantity;

        if (iNumArtifacts > 0)
        {
            if (!kItemTree.LWCE_ItemIsValid(iItemId))
            {
                kHQ.m_kCELastCargoArtifacts.Delete(iItemId);
            }
            else if (kItemTree.LWCE_IsCaptive(iItemId))
            {
                if (!kHQ.HasFacility(eFacility_AlienContain))
                {
                    kHQ.m_kCELastCargoArtifacts.Delete(iItemId);
                    iItemId = kItemTree.LWCE_CaptiveToCorpse(iItemId);
                    LABS().m_bCaptiveDied = true;

                    // Add captive's corpse to cargo
                    kHQ.m_kCELastCargoArtifacts.AdjustQuantity(iItemId, iNumArtifacts);
                }
                else
                {
                    kHQ.m_arrCELastCaptives.AddItem(iItemId);

                    if (!STORAGE().EverHadItem(iItemId))
                    {
                        STAT_AddStat(eRecap_DifferentAliensCaptured, 1);
                    }

                    if (iItemId >= 0 && iItemId <= 255)
                    {
                        Base().BeginAlienContainment(EItemType(iItemId));
                    }
                }

                SITROOM().PushNarrativeHeadline(eTickerNarrative_AlienCaptured);
                STORAGE().AddItem(iItemId, iNumArtifacts);
            }
            else if (iItemId == `LW_ITEM_ID(Elerium))
            {
                if (ENGINEERING().IsFoundryTechResearched(`LW_FOUNDRY_ID(AlienNucleonics)))
                {
                    iNumArtifacts *= 1.20;
                }

                AddResource(eResource_Elerium, iNumArtifacts);
            }
            else if (iItemId == `LW_ITEM_ID(AlienAlloy))
            {
                if (ENGINEERING().IsFoundryTechResearched(`LW_FOUNDRY_ID(AlienMetallurgy)))
                {
                    iNumArtifacts *= 1.20;
                }

                AddResource(eResource_Alloys, iNumArtifacts);
            }
            else
            {
                if (iItemId == `LW_ITEM_ID(WeaponFragment))
                {
                    if (ENGINEERING().IsFoundryTechResearched(`LW_FOUNDRY_ID(ImprovedSalvage)))
                    {
                        iNumArtifacts *= 1.20;
                    }
                }

                STORAGE().AddItem(iItemId, iNumArtifacts);
            }
        }
    }

    kCargo.m_kArtifactsContainer.Clear();
}

function AssignRandomCallsign(XGShip_Interceptor kShip)
{
    LWCE_XGShip_Interceptor(kShip).SetCallsign(PilotNames[Rand(PilotNames.Length)]);
}