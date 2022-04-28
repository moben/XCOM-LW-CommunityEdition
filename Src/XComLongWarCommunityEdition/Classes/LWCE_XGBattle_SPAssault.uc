class LWCE_XGBattle_SPAssault extends XGBattle_SPAssault;

`include(generators.uci)

`LWCE_GENERATOR_XGBATTLE

function CollectLoot()
{
    local int Index;
    local string strMapName;
    local array<LWCE_TItemQuantity> arrRewards;
    local LWCE_TItemQuantity kItemQuantity;
    local LWCE_XGBattleDesc kDesc;

    kDesc = LWCE_XGBattleDesc(m_kDesc);

    if (kDesc.m_eCouncilType == eFCM_ChryssalidHive)
    {
        // You don't get any loot from the Chryssalid Hive mission
        return;
    }

    strMapName = `WORLDINFO.GetMapName();
    class'XComCollectible'.static.CollectCollectibles(m_kDesc.m_arrArtifacts);

    for (Index = 0; Index < m_kDesc.m_arrArtifacts.Length; Index++)
    {
        if (m_kDesc.m_arrArtifacts[Index] > 0)
        {
            kDesc.m_kArtifactsContainer.AdjustQuantity(Index, m_kDesc.m_arrArtifacts[Index]);
        }
    }

    kDesc.m_kArtifactsContainer.Set(`LW_ITEM_ID(Meld), GetRecoveredMeldAmount());

    if (strMapName == "DLC1_3_Gangplank")
    {
        arrRewards = `LWCE_STRATCFG(GangplankRewards);
    }

    foreach arrRewards(kItemQuantity)
    {
        kDesc.m_kArtifactsContainer.AdjustQuantity(kItemQuantity.iItemId, kItemQuantity.iQuantity);
    }
}

function InitPlayers(optional bool bLoading = false)
{
    class'LWCE_XGBattle_Extensions'.static.InitPlayers(self, bLoading);
}