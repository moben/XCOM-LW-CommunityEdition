class LWCE_UIManufacturing extends UIManufacturing;

simulated function string GetImage()
{
    switch (m_iView)
    {
        case eManView_Foundry:
            return GetMgr().m_kWidget.imgItem.strPath;
        case eManView_Item:
            return GetMgr().m_kWidget.imgItem.strPath;
        case eManView_Facility:
            return class'UIUtilities'.static.GetStrategyImagePath(GetMgr().m_kWidget.imgItem.iImage);
    }

    return "";
}

simulated function XGManufacturingUI GetMgr()
{
    return XGManufacturingUI(XComHQPresentationLayer(controllerRef.m_Pres).GetMgr(class'LWCE_XGManufacturingUI', self, m_iView));
}

simulated function InitItem(XComPlayerController _controllerRef, UIFxsMovie _manager, EItemType iItemId, int iIndex)
{
    `LWCE_LOG_DEPRECATED_CLS(InitItem);
}

simulated function LWCE_InitItem(XComPlayerController _controllerRef, UIFxsMovie _manager, int iItemId, int iIndex)
{
    local LWCE_XGManufacturingUI kManufacturing;

    Init(_controllerRef, _manager, 0);

    kManufacturing = LWCE_XGManufacturingUI(GetMgr());
    kManufacturing.m_kCEItemProject.iItemId = iItemId;
    kManufacturing.m_kCEItemProject.iIndex = iIndex;
    kManufacturing.DirectInitialize();
}

simulated function Remove()
{
    XComHQPresentationLayer(controllerRef.m_Pres).RemoveMgr(class'LWCE_XGManufacturingUI');
    super(UI_FxsScreen).Remove();
}