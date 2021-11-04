class XGInfiltratorSitRoomUI extends XGScreenMgr
    config(GameData)
    notplaceable
    hidecategories(Navigation);
//completet stub

enum EInfiltratorView
{
    eInfiltratorView_Main,
    eInfiltratorView_ResultsFail,
    eInfiltratorView_ResultsSuccess,
    eInfiltratorView_MAX
};

struct TInfiltratorUI
{
    var TMenu mnuCells;
    var TButtonText btxtRotate;
    var TLabeledText ltxtCapacity;
    var TButtonText btxtExit;
    var int Current;
    var int Max;
};

struct TInfiltratorCursorUI
{
    var bool bEnabled;
    var TButtonText txtHelp;
    var TButtonText txtAccuse;
    var string strCellInfo;
};

struct TInfiltratorCountryUI
{
    var TText txtCountry;
    var int iPanicLevel;
    var bool bHasCell;
    var bool bIsRuledOut;
};

struct TInfiltratorContinentUI
{
    var TText txtContinent;
};

struct TInfiltratorNodeUI
{
    var TButtonText btxtHelp;
    var TText txtCountry;
    var TText txtFunding;
    var TText txtPanicLabel;
    var int iPanicLevel;
    var TText txtContinent;
    var array<TText> arrBonuses;
    var array<TText> arrBonusLabels;
    var TText txtWarning;
    var bool bEnabled;
    var bool bEmpty;
};

struct TInfiltratorResults
{
    var TText txtTitle;
    var TText txtSubTitle;
    var TText txtBody;
    var string txtCountryLabel;
    var TText txtDoom;
    var int iDoom;
};

struct TInfiltratorHelp
{
    var TText txtTitle;
    var TText txtBody;
    var TButtonText btxtOk;
    var TButtonText btxtCancel;
    var bool bCanSweep;
};

var TInfiltratorUI m_kUI;
var TInfiltratorNodeUI m_kSatNodeUI;
var TInfiltratorCursorUI m_kCursorUI;
var TInfiltratorCountryUI m_kCountryUI;
var TInfiltratorContinentUI m_kContinentUI;
var TInfiltratorHelp m_kSweepHelp;
var TInfiltratorHelp m_kHelp;
var TInfiltratorResults m_kResults;
var string m_strClues;
var array<string> m_arrHelpTicker;
var string m_strClueHeader;
var int m_iHighlighted;
var int m_iCountry;
var int m_iContinent;
var bool m_bAccusingACountryThatAlreadyLeft;
var const localized string m_strLabelIsRuledOut;
var const localized string m_strLabelAccuseCountry;
var const localized string m_strLabelLaunchMission;
var const localized string m_strLabelBeginRaid;
var const localized string m_strDoomLabel;
var const localized string m_strResultsFailSubtitle;
var const localized string m_strResultsSuccessSubtitle;
var const localized string m_strResultsFailBody;
var const localized string m_strResultsSuccessBody;
var const localized string m_strLabelSweepTitle;
var const localized string m_strLabelSweepBody;
var const localized string m_strLabelSweepBodyInsufficientFunds;
var const localized string m_strLabelSweepConfirm;
var const localized string m_strLabelSweepDecline;
var const localized string m_strLabelSweepButton;
var const localized string m_strTransitionDescription;
var const localized string m_strCluesTitle;
var const localized string m_strCluesNone;
var const localized string m_strCluesNoneHelp;
var const localized string m_strCluesOneOrTwo;
var const localized string m_strCluesThreeOrMore;
var const localized string m_strHelpWhileCovertOpInCountry;
var const localized string m_strHelpSuccessfullyAccused;
var const localized string m_strHelpWhileNotYetScanned;
var const localized string m_strHintOneOperative;
var const localized string m_strHintNoMECs;
var const localized string m_strStatusNoCell;
var const localized string m_strStatusUnknownStatus;
var const localized string m_strStatusExposedCell;
var const localized string m_strStatusOperativeInOtherCountry;
var const localized string m_strStatusNoEligibleOperative;
var const localized string m_strStatusOperativeAlreadyInCountry;
var const localized string m_strStatusExaltBase;
var const localized string m_strNoValidOperativeNotificationTitle;
var const localized string m_strNoValidOperativeNotificationDesc;
var const localized string m_strLabelCovertOpsTitle;
var const localized string m_strLabelCovertOpsBody;
var const localized string m_strLabelContinue;
var const localized string m_strResultsFailAlreadyLeftSubtitle;
var const localized string m_strResultsFailAlreadyLeftBody;
var const localized string m_strConfirmHQAssaultAlreadyLeftPopupDesc;
var const localized string m_strConfirmHQAssaultPopupTitle;
var const localized string m_strConfirmHQAssaultPopupDesc;

function Init(int iView){}
function UpdateView(){}
function UpdateClues(){}
function UpdateHelpTicker(){}
function UpdateSweepHelp(){}
function bool ShowBonus(){}
function UpdateCountryHelp(){}
function UpdateCountry(){}
function UpdateContinent(){}
function UpdateInfiltratorNodeUI(){}
function UpdateResultsFail(){}
function UpdateResultsSuccess(){}
function OnAcceptResults(){}
function OnCancelResults(){}
function OnCancelBaseRaid(){}
function OnLaunchBaseRaid(){}
function XGMission_ExaltRaid GetBaseRaidMission(){}
function bool OnInvestigate(){}
function bool OnChooseCovertOperative(){}
function bool OnAccuse(){}
function OnAcceptHelp(){}
function OnOption(int iOption){}
function SetTargetCountry(int targetCountry){}
function SuccessfulAccusationNM(){}
