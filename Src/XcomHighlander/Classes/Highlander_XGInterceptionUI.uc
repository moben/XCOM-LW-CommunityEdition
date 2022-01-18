class Highlander_XGInterceptionUI extends XGInterceptionUI;

function Init(int iView)
{
    m_imgBG.iImage = eImage_OldInterception;
    m_iCurrentJet = 0;

    m_kInterception = Spawn(class'Highlander_XGInterception');
    m_kInterception.Init(m_kUFO);

    BuildInterceptorList();

    super(XGScreenMgr).Init(iView);
}