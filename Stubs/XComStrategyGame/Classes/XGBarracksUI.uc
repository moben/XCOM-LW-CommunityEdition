class XGBarracksUI extends XGScreenMgr
    config(GameData)
    notplaceable
    hidecategories(Navigation);

enum EBaseView
{
    eBarracksView_MainMenu,
    eBarracksView_SoldierList,
    eBarracksView_SoldierListCovertOps,
    eBarracksView_SoldierView,
    eBarracksView_PsiLabs,
    eBarracksView_Morgue,
    eBarracksView_Hire,
    eBarracksView_OTS,
    eBarracksView_Medals,
    eBarracksView_MAX
};

struct TBarracksMainMenu
{
    var TMenu mnuOptions;
};

struct TSoldierTable
{
    var TTableMenu mnuSoldiers;
};

struct THiringWidget
{
    var TText txtTitle;
    var TLabeledText txtFacilityCap;
    var TLabeledText txtCost;
    var TText txtNumToHire;
    var TButtonText txtButtonHelp;
    var TImage imgStaff;
    var TLabeledText txtMoney;
};

var TBarracksMainMenu m_kMainMenu;
var TSoldierTable m_kSoldierTable;
var THiringWidget m_kHiring;
var int m_iNumHiring;
var int m_iNumSoldiers;
var int m_iNumSoldiersOnOrder;
var array<int> m_arrMenuOptions;
var const localized string m_strBaseViewNames[EBaseView];
var const localized string m_strBaseViewHelp[EBaseView];
var const localized string m_strNoSoldiersDied;
var const localized string m_strErrOTRRequired;
var const localized string m_strErrNoMoneyForSoldiers;
var const localized string m_strLabelBarracksCapacity;
var const localized string m_strLabelHiringCost;
var const localized string m_strLabelIncreaseOrder;

function UpdateView(){}
function OnChooseMainMenuOption(int iOption){}
function OnLeaveFacility(){}
function OnSoldierOption(int iOption){}
function OnLeaveSoldierList(){}
function OnCovertOperativeOption(int iOption){}
function UpdateMainMenu(){}
function bool AreAnyMedalsAvailable(){}
function UpdateSoldierList(bool bHideTanks){}
function TTableMenuOption BuildSoldierOption(XGStrategySoldier kSoldier, array<int> arrCategories, int iSoldierListIndex){}
function OnIncreaseHiringOrder(){}
function OnDecreaseHiringOrder(){}
function OnCancelHiringOrder(){}
function bool OnAcceptHiringOrder(){}
function UpdateHiring(){}
simulated function OnLoseFocus(){}
simulated function OnReceiveFocus(){}
