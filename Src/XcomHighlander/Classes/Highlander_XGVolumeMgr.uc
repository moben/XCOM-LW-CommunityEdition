class Highlander_XGVolumeMgr extends XGVolumeMgr;

function XGVolume CreateVolumeByType(EVolumeType kType, Vector vCenter, optional float fRadius = -1.0, optional float fHeight = -1.0, optional int iNumTurns = -1, optional XGUnit kOwner)
{
    local XGVolume kVolume;
    local TVolume kTVolume;

    LogInternal(string(Class) $ ":CreateVolumeByType: override successful");

    kTVolume = XComTacticalGRI(class'Engine'.static.GetCurrentWorldInfo().GRI).m_kBattle.m_kVolumeMgr.GetTVolume(kType);

    if (fRadius >= float(0))
    {
        kTVolume.fRadius = fRadius;
    }

    if (iNumTurns >= 0)
    {
        kTVolume.iDuration = iNumTurns;
    }

    if (fHeight >= float(0))
    {
        kTVolume.fHeight = fHeight;
    }

    if (kOwner != none)
    {
        kVolume = Spawn(class'Highlander_XGVolume', kOwner);
    }
    else
    {
        kVolume = Spawn(class'Highlander_XGVolume', self);
    }

    kVolume.Init(kTVolume, vCenter);

    if (kType == eVolume_Fire && class'XComWorldData'.static.GetWorldData().IsRebuildingTiles())
    {
        m_arrDelayAddVolumes.AddItem(kVolume);
        SetTickIsDisabled(false);
        SetTimer(1.0, false, 'CheckDelayAddVolumes');
    }
    else
    {
        AddVolume(kVolume);
    }

    return kVolume;
}

function XGVolume CreateVolume(TVolume kTVolume, XGUnit kInstigator, Vector vCenter, optional XGAbility_Targeted kAbility)
{
    local XGVolume kVolume;
    local bool bFloorTile;
    local int X, Y, Z;

    LogInternal(string(Class) $ ":CreateVolume: override successful");

    if (kTVolume.eType == eVolume_Smoke || kTVolume.eType == eVolume_CombatDrugs || kTVolume.eType == eVolume_Poison)
    {
        bFloorTile = class'XComWorldData'.static.GetWorldData().GetFloorTileForPosition(vCenter, X, Y, Z);

        if (!bFloorTile)
        {
            vCenter.Z += 64.0 * 1.50;
            bFloorTile = class'XComWorldData'.static.GetWorldData().GetFloorTileForPosition(vCenter, X, Y, Z);
        }

        if (bFloorTile)
        {
            vCenter = class'XComWorldData'.static.GetWorldData().GetPositionFromTileCoordinates(X, Y, Z);
            vCenter.Z += 64.0 * 1.10;
        }
    }

    kVolume = Spawn(class'Highlander_XGVolume', kInstigator);
    kVolume.Init(kTVolume, vCenter, kAbility);
    AddVolume(kVolume);
    return kVolume;
}