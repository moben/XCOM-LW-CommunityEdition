class LWCE_UISoldierCustomize extends UISoldierCustomize;

simulated function Init(XGStrategySoldier kSoldier, XComPlayerController _controllerRef, UIFxsMovie _manager)
{
    local XGCustomizeUI kMgr;

    BaseInit(_controllerRef, _manager);

    m_iView = 0;
    m_hWidgetHelper = Spawn(class'UIWidgetHelper', self);
    m_kSoldier = kSoldier;

    kMgr = Spawn(class'LWCE_XGCustomizeUI', XComHQPresentationLayer(controllerRef.m_Pres));
    kMgr.m_kInterface = self;

    XComHQPresentationLayer(controllerRef.m_Pres).AddPreformedMgr(kMgr);
    kMgr.Init(m_iView);
    kMgr.SetActiveSoldier(m_kSoldier);

    m_kLocalMgr = kMgr;
    m_kSoldierHeader = Spawn(class'LWCE_UIStrategyComponent_SoldierInfo', self);
    m_kSoldierHeader.s_name = name("theStuff.soldierInfoMC");
    m_kSoldierHeader.Init(_controllerRef, _manager, self, m_kSoldier);

    foreach AllActors(class'SkeletalMeshActor', m_kCameraRig)
    {
        if (m_kCameraRig.Tag == 'UICameraRig_SoldierCustomize')
        {
            m_kCameraRigDefaultLocation = m_kCameraRig.Location;
            break;
        }
    }

    manager.LoadScreen(self);
}

simulated function XGCustomizeUI GetMgr()
{
    if (m_kLocalMgr == none)
    {
        m_kLocalMgr = XGCustomizeUI(XComHQPresentationLayer(controllerRef.m_Pres).GetMgr(class'LWCE_XGCustomizeUI', self, m_iView));
    }

    return m_kLocalMgr;
}

simulated function XGSoldierUI GetSoldierUIMgr()
{
    return XGSoldierUI(XComHQPresentationLayer(controllerRef.m_Pres).GetMgr(class'LWCE_XGSoldierUI', none));
}

event Destroyed()
{
    m_kLocalMgr = none;
    `HQPRES.RemoveMgr(class'LWCE_XGCustomizeUI');
    super.Destroyed();
}