class LWCE_XGTacticalGameCore extends XGTacticalGameCore
    config(LWCEBaseTacticalGame)
    dependson(LWCETypes);

var config array<LWCE_TWeapon> arrCfgWeapons;

// ----------------------------------------
// Config for tactical game abilities
// ----------------------------------------

// Config that mostly impact the player's units, or aliens and XCOM equally
var config float fAbsorptionFieldsActivationThreshold;
var config float fAbsorptionFieldsIncomingDamageMultiplier;
var config float fAcidDRRemovalPercentage;
var config float fAcidMinimumDRRemoved;
var config float fBattleScannerVolumeRadius;
var config float fBullRushRadius;
var config float fCollateralDamageRadius;
var config float fCombatDrugsRadiusMultiplier;
var config float fCombatStimsIncomingDamageMultiplier;
var config float fCombinedArmsDRPenetration;
var config float fDamageControlDRBonus;
var config float fDeathBlossomRadius;
var config float fExecutionerHealthThreshold;
var config float fFireVolumeRadius;
var config float fGaussWeaponsDRPenetration;
var config float fGreenFogAimLossPerTurn;
var config float fGreenFogWillLossPerTurn;
var config float fLowCoverDRBonus;
var config float fHighCoverDRBonus;
var config float fOneForAllDRBonus;
var config float fOverloadRadius;
var config float fIncomingMeleeDamageMultiplierForChitinPlating;
var config float fIncomingMeleeDamageMultiplierForChryssalids;
var config float fMindMergeDRPerWill;
var config float fPistolAimPenaltyPerMeter;
var config float fPistolMaxEffectiveRange;
var config float fPsiInspirationRadius;
var config float fPsiShieldIncomingDamageMultiplier;
var config float fPsychokineticStrikeRadius;
var config float fQuenchgunsDRPenetration;
var config float fReactionFireAimDivisorLargeTarget;
var config float fReactionFireAimMultiplier;
var config float fReactionFireAimMultiplierDashing;
var config float fReactionFireAimMultiplierUnusedLightningReflexes;
var config float fReactionFireAimMultiplierUsedLightningReflexes;
var config float fReactionFireAimMultiplierWithChameleonSuit;
var config float fRiftRadius;
var config float fRocketScatterMultiplierAfterMove;
var config float fRocketScatterMultiplierAfterMoveWithSnapShot;
var config float fSapperEnvironmentalDamageMultiplier;
var config float fShockAbsorbentArmorIncomingDamageMultiplier;
var config float fShockAbsorbentArmorRadius;
var config float fShotgunDRPenalty;
var config float fShredderRocketDamageMultiplier;
var config float fShredderRocketRadiusMultiplier;
var config float fShredderRocketRadiusOverride;
var config float fSuppressionReactionFireCoverPenetration;
var config float fTelekineticFieldRadius;
var config float fWillToSurviveDRBonus;

var config int iAcidVolumeDuration;
var config int iAdrenalNeurosympathyAimBonus;
var config int iAdrenalNeurosympathyCritChanceBonus;
var config int iAdrenalineSurgeAimBonus;
var config int iAdrenalineSurgeCritChanceBonus;
var config int iAggressionCritChanceBonusPerVisibleEnemy;
var config int iAggressionMaximumBonus;
var config int iAlienGrenadesDamageBonusForAPGrenades;
var config int iAlienGrenadesDamageBonusForGrenadeLauncher;
var config int iAutomatedThreatAssessmentDefenseBonus;
var config int iBattleRifleSecondActionAimPenalty;
var config int iBattleScannerVolumeDuration;
var config int iBloodCallAimBonus;
var config int iBodyShieldAimPenalty;
var config int iCatchingBreathAimPenalty;
var config int iCombatDrugsCritChanceBonus;
var config int iCombatDrugsVolumeDuration;
var config int iCombatDrugsWillBonus;
var config int iCombatStimsWillBonus;
var config int iConcealmentCritChanceBonus;
var config int iDamnGoodGroundAimBonus;
var config int iDamnGoodGroundDefenseBonus;
var config int iDeadeyeAimBonus;
var config int iDenseSmokeDefenseBonus;
var config int iDepthPerceptionAimBonus;
var config int iDepthPerceptionCritChanceBonus;
var config int iDisablingShotAimPenalty;
var config int iDisorientedAimPenalty;
var config int iDistortionFieldDefenseBonus;
var config int iEnhancedPlasmaDamageBonus;
var config int iEspritDeCorpsDefenseBonus;
var config int iEspritDeCorpsWillBonus;
var config int iExecutionerAimBonus;
var config int iExecutionerCritChanceBonus;
var config int iFireInTheHoleAimBonusForRockets;
var config int iFireVolumeDuration;
var config int iFlushAimBonus;
var config int iFlyingDefenseBonus;
var config int iGreenFogMaximumAimLoss;
var config int iGreenFogMaximumWillLoss;
var config int iHeightAdvantageAimBonus;
var config int iHoloTargetingAimBonus;
var config int iHyperReactivePupilsAimBonus;
var config int iInTheZoneCritPenaltyPerShot;
var config int iImprovedMedikitHealBonus;
var config int iLoneWolfAimBonus;
var config int iLoneWolfCritChanceBonus;
var config int iMecCloseCombatDamageBonus;
var config int iMayhemDamageBonusForGrenades;
var config int iMayhemDamageBonusForMachineGuns;
var config int iMayhemDamageBonusForProximityMines;
var config int iMayhemDamageBonusForRocketLaunchers;
var config int iMayhemDamageBonusForSniperRifles;
var config int iMayhemDamageBonusForSuppression;
var config int iMindControlHitModifier;
var config int iMindfrayAimPenalty;
var config int iMindfrayHitModifier;
var config int iMindfrayDamage;
var config int iMedikitHealBase;
var config int iNeuralDampingWillBonus;
var config int iPlatformStabilityAimBonus;
var config int iPlatformStabilityAimBonusForRockets;
var config int iPlatformStabilityCritChanceBonus;
var config int iPrecisionShotDamageBonusForBallisticSniper;
var config int iPrecisionShotDamageBonusForGaussSniper;
var config int iPrecisionShotDamageBonusForLaserSniper;
var config int iPrecisionShotDamageBonusForPulseSniper;
var config int iPrecisionShotDamageBonusForPlasmaSniper;
var config int iPsiPanicHitModifier;
var config int iRangerDamageBonusPistol;
var config int iRangerDamageBonusPrimary;
var config int iRapidFireAimPenalty;
var config int iReflexPistolsDamageBonus;
var config int iRepairHealBaseAliens;
var config int iRepairHealBaseXCOM;
var config int iRiftVolumeDuration;
var config int iSapperDamageBonus;
var config int iSaviorHealBonus;
var config int iSemperVigilansDefenseBonus;
var config int iSmartMacrophagesHealBonus;
var config int iSmokeGrenadeDefenseBonus;
var config int iSmokeGrenadeVolumeDuration;
var config int iSnapShotAimPenalty;
var config int iSharpshooterAimBonus;
var config int iSharpshooterCritChanceBonus;
var config int iShredderDebuffDurationFromEnemyGrenade;
var config int iShredderDebuffDurationFromEnemyWeapon;
var config int iShredderDebuffDurationFromPerk;
var config int iShredderDebuffDurationFromRocket;
var config int iShredderDebuffDurationFromSmallItem;
var config int iSquadsightCritChancePenalty;
var config int iSuppressionAimPenalty;
var config int iTacticalSenseDefenseBonusPerVisibleEnemy;
var config int iTacticalSenseMaximumBonus;
var config int iTelekineticFieldDefenseBonus;
var config int iTelekineticFieldVolumeDuration;
var config int iVitalPointTargetingDamageBonusPistol;
var config int iVitalPointTargetingDamageBonusPrimary;

var config LinearColor AreaTargetingFriendliesInRadiusColor;
var config LinearColor AreaTargetingInvalidColor;
var config LinearColor AreaTargetingValidColor;

// Config for enemies
var config LWCE_TRange BullRushAddedDamage;
var config LWCE_TRange DeathBlossomAddedDamage;

var array<LWCE_TWeapon> m_arrCEWeapons;

simulated event Init()
{
    `LWCE_LOG_CLS("Init");

    m_arrWeapons.Add(255);
    m_arrArmors.Add(255);
    m_arrCharacters.Add(32);

    if (Role == ROLE_Authority)
    {
        m_kAbilities = Spawn(class'LWCE_XGAbilityTree', self);
        m_kAbilities.Init();
    }

    BuildWeapons();
    BuildArmors();
    BuildCharacters();
    m_bInitialized = true;
}

simulated function BuildWeapons()
{
    local LWCE_TWeapon kWeapon;

    `LWCE_LOG_CLS("BuildWeapons");

    // TODO delete this
    super.BuildWeapons();

    m_arrCEWeapons.Remove(0, m_arrCEWeapons.Length);

    foreach default.arrCfgWeapons(kWeapon)
    {
        if (kWeapon.iItemId < 255)
        {
            kWeapon.strName = class'XLocalizedData'.default.m_aItemNames[kWeapon.iItemId];
        }

        m_arrCEWeapons.AddItem(kWeapon);
    }

    // TODO add mod hook
}

simulated function int CalcBaseHitChance(XGUnitNativeBase kShooter, XGUnitNativeBase kTarget, bool bReactionFire)
{
    local int iDefense, iHitChance;

    `LWCE_LOG_CLS("CalcBaseHitChance");

    if (kTarget.m_bVIP) // Probably right, needs confirmation
    {
        if (kTarget.m_kCharacter.m_kChar.iType == eChar_Civilian || kShooter.m_kCharacter.m_kChar.aProperties[eCP_MeleeOnly] != 0)
        {
            return 100;
        }
    }

    iDefense = kTarget.m_aCurrentStats[eStat_Defense];

    if (kTarget.IsInTelekineticField())
    {
        iDefense += iTelekineticFieldDefenseBonus;
    }

    if (kTarget.m_kSquad != none && kTarget.m_kSquad.SquadHasStarOfTerra(/* PowerA */ true))
    {
        iDefense += class'XGTacticalGameCoreNativeBase'.default.TERRA_DEFENSE;
    }

    if (kTarget.IsFlankedBy(kShooter))
    {
        // Remove cover bonuses from target's defense stat
        kTarget.UpdateCoverBonuses(kShooter);

        if (kTarget.IsAffectedByAbility(eAbility_TakeCover)) // Hunker Down
        {
            iDefense -= kTarget.m_iCurrentCoverValue * HUNKER_BONUS;
        }
        else
        {
            iDefense -= kTarget.m_iCurrentCoverValue;
        }
    }

    iHitChance = kShooter.m_aCurrentStats[eStat_Offense] - iDefense;

    if (kShooter.HasHeightAdvantageOver(XGUnit(kTarget)))
    {
        iHitChance += iHeightAdvantageAimBonus;
    }

    if (bReactionFire && kShooter.m_kCharacter.m_kChar.aUpgrades[`LW_PERK_ID(Opportunist)] == 0 && kShooter.m_kCharacter.m_kChar.aUpgrades[`LW_PERK_ID(AdvancedFireControl)] == 0)
    {
        if (kTarget.m_bDashing)
        {
            iHitChance *= DASHING_REACTION_MODIFIER;
        }
        else
        {
            iHitChance *= REACTION_PENALTY;
        }
    }

    if (kShooter.IsPoisoned())
    {
        iHitChance -= POISONED_AIM_PENALTY;
    }

    if (kShooter.IsMine())
    {
        // TODO very unclear what the hell is happening in here, or whether any of it matters
    }

    return iHitChance;
}

// This function is reverse-engineered from its native version in XGTacticalGameCoreNativeBase.
// It is unmodified and unused; this version is only kept around to see what the native
// version does. Modifications should go in CalcBaseHitChance.
private simulated function int CalcBaseHitChance_Original(XGUnitNativeBase kShooter, XGUnitNativeBase kTarget, bool bReactionFire)
{
    local int iDefense, iHitChance;

    if (kTarget.m_bVIP) // Probably right, needs confirmation
    {
        if (kTarget.m_kCharacter.m_kChar.iType == eChar_Civilian || kShooter.m_kCharacter.m_kChar.aProperties[eCP_MeleeOnly] != 0)
        {
            return 100;
        }
    }

    iDefense = kTarget.m_aCurrentStats[eStat_Defense];

    if (kTarget.IsInTelekineticField())
    {
        iDefense += 40;
    }

    if (kTarget.m_kSquad != none && kTarget.m_kSquad.SquadHasStarOfTerra(/* PowerA */ true))
    {
        iDefense += class'XGTacticalGameCoreNativeBase'.default.TERRA_DEFENSE;
    }

    if (kTarget.IsFlankedBy(kShooter))
    {
        // Remove cover bonuses from target's defense stat
        kTarget.UpdateCoverBonuses(kShooter);

        if (kTarget.IsAffectedByAbility(eAbility_TakeCover)) // Hunker Down
        {
            iDefense -= kTarget.m_iCurrentCoverValue * HUNKER_BONUS;
        }
        else
        {
            iDefense -= kTarget.m_iCurrentCoverValue;
        }
    }

    iHitChance = kShooter.m_aCurrentStats[eStat_Offense] - iDefense;

    if (kShooter.HasHeightAdvantageOver(XGUnit(kTarget)))
    {
        iHitChance += 20;
    }

    if (bReactionFire && kShooter.m_kCharacter.m_kChar.aUpgrades[`LW_PERK_ID(Opportunist)] == 0 && kShooter.m_kCharacter.m_kChar.aUpgrades[`LW_PERK_ID(AdvancedFireControl)] == 0)
    {
        if (kTarget.m_bDashing)
        {
            iHitChance *= DASHING_REACTION_MODIFIER;
        }
        else
        {
            iHitChance *= REACTION_PENALTY;
        }
    }

    if (kShooter.IsPoisoned())
    {
        iHitChance -= POISONED_AIM_PENALTY;
    }

    if (kShooter.IsMine())
    {
        // TODO very unclear what the hell is happening in here, or whether any of it matters
    }

    return iHitChance;
}

function int CalcOverallDamage(int iWeapon, int iCurrDamageStat, optional bool bCritical = false, optional bool bReflected = false)
{
    local int iDamage, iRandDamage;

    iDamage = LWCE_GetTWeapon(iWeapon).iDamage + iCurrDamageStat;

    if (bReflected)
    {
        return 0;
    }

    iRandDamage = `SYNC_RAND( (IsOptionEnabled(eGO_RandomDamage) ? 4 : 2) * iDamage + 2 );

    if (IsOptionEnabled(eGO_RandomDamage))
    {
        iDamage = ( (bCritical ? 6 : 2) * iDamage + 1 + iRandDamage ) / 4;
    }
    else
    {
        iDamage = ( (bCritical ? 5 : 3) * iDamage + 1 + iRandDamage) / 4;
    }

    if (bCritical)
    {
        iDamage = Max(iDamage, ( (IsOptionEnabled(eGO_RandomDamage) ? 6 : 5) * (m_arrWeapons[iWeapon].iDamage + iCurrDamageStat) + 2) / 4);
    }

    if (iDamage < 1)
    {
        iDamage = 1;
    }

    return iDamage;
}

/// <summary>
/// Retrieves a TWeapon struct. THIS FUNCTION IS NOT FOR MODS TO USE.
/// It exists strictly for parts of the vanilla code base that can't be rewritten.
/// Mods should only use LWCE_GetTWeapon.
/// </summary>
simulated function TWeapon GetTWeapon(int iWeapon)
{
    local int iAbilityId, iPropertyId;
    local LWCE_TWeapon kCEWeapon;
    local TWeapon kWeapon;

    //return super.GetTWeapon(iWeapon);

    // Map as much as we can into the original struct
    kCEWeapon = LWCE_GetTWeapon(iWeapon);

    kWeapon.strName = kCEWeapon.strName;
    kWeapon.iType = kCEWeapon.iItemId;
    kWeapon.iSize = kCEWeapon.iSize;
    kWeapon.iDamage = kCEWeapon.iDamage;
    kWeapon.iEnvironmentDamage = kCEWeapon.iEnvironmentDamage;
    kWeapon.iRange = kCEWeapon.iRange;
    kWeapon.iReactionRange = kCEWeapon.iReactionRange;
    kWeapon.iRadius = kCEWeapon.iRadius;
    kWeapon.iCritical = kCEWeapon.kStatChanges.iCriticalChance;
    kWeapon.iOffenseBonus = kCEWeapon.kStatChanges.iAim;
    kWeapon.iHPBonus = kCEWeapon.kStatChanges.iHP;
    kWeapon.iWillBonus = kCEWeapon.kStatChanges.iWill;

    // iSuppression holds the ammo amount; the high digits are the amount with Ammo Conservation, which
    // always grants +1 ammo, and the low digits are the amount without.
    if (kCEWeapon.iBaseAmmo > 0)
    {
        kWeapon.iSuppression = 100 * (kCEWeapon.iBaseAmmo + 1) + kCEWeapon.iBaseAmmo;
    }

    foreach kCEWeapon.arrAbilities(iAbilityId)
    {
        if (iAbilityId < eAbility_MAX)
        {
            kWeapon.aAbilities[iAbilityId] = 1;
        }
    }

    foreach kCEWeapon.arrProperties(iPropertyId)
    {
        if (iPropertyId < eWP_MAX)
        {
            kWeapon.aProperties[iPropertyId] = 1;
        }
    }

    return kWeapon;
}

simulated function LWCE_TWeapon LWCE_GetTWeapon(int iWeapon)
{
    local int Index;
    local LWCE_TWeapon kBlankWeapon, kWeapon;

    Index = m_arrCEWeapons.Find('iItemId', iWeapon);

    if (Index == INDEX_NONE)
    {
        return kBlankWeapon;
    }

    kWeapon = m_arrCEWeapons[Index];

    `LWCE_MOD_LOADER.Override_GetTWeapon(kWeapon);

    return kWeapon;
}

// This was a rewritten function in Long War that should be deprecated, but it's called in too many
// places to bother rewriting and it already has the right signature, so we just delegate to a method
// that has a better name for mods to call.
simulated function int GetUpgradeAbilities(int iRank, int iPersonality)
{
    return int(GetEquipmentItemStat(iRank, iPersonality));
}

// TODO: document that this doesn't apply to primary weapons or pistols
simulated function float GetEquipmentItemStat(int iItemId, int iCharacterStat)
{
    local LWCE_TWeapon kWeapon;

    if (iItemId == 0)
    {
        return 0;
    }

    if (!WeaponHasProperty(iItemId, eWP_Secondary) && !WeaponHasProperty(iItemId, eWP_Backpack))
    {
        if (iCharacterStat != eStat_Defense && iCharacterStat != eStat_Mobility)
        {
            return 0;
        }
    }

    kWeapon = LWCE_GetTWeapon(iItemId);

    switch (iCharacterStat)
    {
        case eStat_HP:
            return kWeapon.kStatChanges.iHP;
        case eStat_CriticalShot:
            return kWeapon.kStatChanges.iCriticalChance;
        case eStat_Offense:
            return kWeapon.kStatChanges.iAim;
        case eStat_FlightFuel:
            return kWeapon.kStatChanges.iFlightFuel;
        case eStat_Defense:
            return kWeapon.kStatChanges.iDefense;
        case eStat_Mobility:
            return kWeapon.kStatChanges.iMobility;
        case eStat_DamageReduction:
            return kWeapon.kStatChanges.fDamageReduction;
        case eStat_Will:
            return kWeapon.kStatChanges.iWill;
        default:
            return 0;
    }
}

simulated function GetInventoryStatModifiers(out int aModifiers[ECharacterStat], out TCharacter kCharacter, EItemType iEquippedWeapon, array<int> arrBackPackItems)
{
    `LWCE_LOG_DEPRECATED_CLS(GetInventoryStatModifiers);
    //LWCE_GetInventoryStatModifiers(aModifiers, kCharacter, iEquippedWeapon, arrBackPackItems);
}

simulated function LWCE_GetInventoryStatModifiers(out int aModifiers[ECharacterStat], out TCharacter kCharacter, int iEquippedWeaponItemId, array<int> arrBackpackItemIds)
{
    local int iStat;

    for (iStat = 0; iStat < eStat_MAX; iStat++)
    {
        aModifiers[iStat]  = GetWeaponStatBonus(iStat, iEquippedWeaponItemId, kCharacter);
        aModifiers[iStat] += GetArmorStatBonus(iStat, kCharacter.kInventory.iArmor, kCharacter);

        if (kCharacter.aUpgrades[27] > 0) // Extra Conditioning
        {
            aModifiers[iStat] += GetExtraArmorStatBonus(iStat, kCharacter.kInventory.iArmor);
        }

        if ( !WeaponHasProperty(iEquippedWeaponItemId, eWP_Pistol) || (iStat != eStat_Offense && iStat != eStat_CriticalShot) )
        {
            aModifiers[iStat] += GetBackpackStatBonus(iStat, arrBackPackItemIds, kCharacter);

            switch (iStat)
            {
                case eStat_HP:
                    if ((kCharacter.aUpgrades[123] & 1) > 0) // Shaped Armor
                    {
                        if (kCharacter.iType == eChar_Tank || kCharacter.eClass == eSC_Mec)
                        {
                            aModifiers[iStat] += 3;
                        }
                    }

                    break;
                case eStat_Mobility:
                    aModifiers[iStat] += TotalStatFromItem(kCharacter.kInventory.iArmor, ECharacterStat(iStat));

                    if (kCharacter.aUpgrades[31] > 0) // Sprinter
                    {
                        aModifiers[iStat] += 4;
                    }

                    break;
                case eStat_DamageReduction:
                    aModifiers[iStat] += TotalStatFromItem(kCharacter.kInventory.iArmor, ECharacterStat(iStat));

                    if (kCharacter.aUpgrades[132] > 0) // Automated Threat Assessment
                    {
                        aModifiers[iStat] += 5;
                    }

                    if (kCharacter.aUpgrades[148] > 0) // Iron Skin
                    {
                        aModifiers[iStat] += 10;
                    }

                    break;
                case eStat_Offense:
                    aModifiers[iStat] += TotalStatFromItem(kCharacter.kInventory.iArmor, ECharacterStat(iStat));
                    break;
                case eStat_FlightFuel:
                    if ((kCharacter.aUpgrades[123] & 8) > 0) // Advanced Flight
                    {
                        aModifiers[iStat] *= float(2);
                    }

                    break;
                default:
                    break;
            }
        }
    }
}

simulated function int GetOverheatIncrement(XGUnit kUnit, int iWeapon, int iAbility, out TCharacter kCharacter, optional bool bReactionFire)
{
    local int iAmount;

    if (iWeapon == 0)
    {
        return 0;
    }

    if (WeaponHasProperty(iWeapon, eWP_UnlimitedAmmo))
    {
        return 0;
    }

    if (WeaponHasProperty(iWeapon, eWP_NoReload))
    {
        return 0;
    }

    if (WeaponHasProperty(iWeapon, eWP_Melee))
    {
        return 0;
    }

    iAmount = LWCE_GetTWeapon(iWeapon).iBaseAmmo;

    if ((kCharacter.aUpgrades[123] & 2) > 0) // Ammo Conservation
    {
        iAmount += 1;
    }

    if (!WeaponHasProperty(iWeapon, eWP_Pistol))
    {
        if (kCharacter.aUpgrades[58] > 0) // Lock and Load
        {
            iAmount += 1;
        }

        if (TInventoryHasItemType(kCharacter.kInventory, `LW_ITEM_ID(HiCapMags)))
        {
            iAmount += 1;
        }

        if (TInventoryHasItemType(kCharacter.kInventory, `LW_ITEM_ID(DrumMags)))
        {
            iAmount += 2;
        }
    }

    iAmount = Max(iAmount, 1);
    iAmount = 100 / iAmount;

    switch (iAbility)
    {
        case eAbility_ShotSuppress:
            iAmount = 2 * iAmount;
            break;
        case eAbility_ShotFlush:
            iAmount = 2 * iAmount;
            break;
        case eAbility_MEC_Barrage:
            iAmount = 2 * iAmount;
            break;
        case eAbility_ShotMayhem:
            iAmount = 2 * iAmount;
            break;
    }

    return iAmount;
}

simulated function int TotalStatFromItem(int iItemId, ECharacterStat eStat)
{
    local TCharacterBalance kCharacterBalance;
    local int iTotal;

    iTotal = 0;

    if (ItemIsWeapon(iItemId))
    {
        return GetEquipmentItemStat(iItemId, eStat);
    }

    // TODO: delete all of this once armor is ported to LWCE system
    foreach BalanceMods_Classic(kCharacterBalance)
    {
        if (kCharacterBalance.eType == iItemId)
        {
            // Stats are mapped strangely since the original balance struct has limited fields
            switch (eStat)
            {
                case eStat_Offense:
                    iTotal += kCharacterBalance.iAim;
                    break;
                case eStat_Defense:
                    iTotal += kCharacterBalance.iDefense;
                    break;
                case eStat_Mobility:
                    iTotal += kCharacterBalance.iMobility;
                    break;
                case eStat_DamageReduction:
                    iTotal += kCharacterBalance.iHP;
                    break;
                case eStat_CriticalShot:
                    iTotal += kCharacterBalance.iCritHit;
                    break;
                case eStat_FlightFuel:
                    iTotal += kCharacterBalance.iDamage;
                    break;
                default:
                    break;
            }
        }
    }

    return iTotal;
}

function eWeaponRangeCat GetWeaponCatRange(EItemType eWeapon)
{
    `LWCE_LOG_DEPRECATED_CLS(GetWeaponCatRange);

    return 0;
}

function eWeaponRangeCat LWCE_GetWeaponCatRange(int iWeaponItemId)
{
    if (LWCE_GetTWeapon(iWeaponItemId).iRange > 30)
    {
        return eWRC_Long;
    }

    if (LWCE_GetTWeapon(iWeaponItemId).iReactionRange < 30)
    {
        return eWRC_Short;
    }

    return eWRC_Medium;
}

// TODO: rewrite all of the ItemIs* functions, maybe move into XGItemTree
simulated function bool ItemIsAccessory(int iItem)
{
    return LWCE_GetTWeapon(iItem).iDamage <= 0;
}

simulated function bool ItemIsWeapon(int iItem)
{
    return LWCE_GetTWeapon(iItem).iDamage > 0;
}

simulated function bool ItemIsArmor(int iItem)
{
    return m_arrArmors[iItem].iHPBonus > 0;
}

simulated function bool ItemIsMecArmor(int iItem)
{
    switch (iItem)
    {
        case 145:
        case 148:
        case 191:
        case 192:
        case 193:
        case 194:
        case 195:
        case 210:
            return true;
        default:
            return false;
    }
}

simulated function bool ItemIsShipWeapon(int iItem)
{
    return iItem >= 116 && iItem < 123;
}

simulated function bool WeaponHasProperty(int iWeapon, int iWeaponProperty)
{
    local LWCE_TWeapon kWeapon;

    kWeapon = LWCE_GetTWeapon(iWeapon);

    return kWeapon.arrProperties.Find(iWeaponProperty) != INDEX_NONE;
}