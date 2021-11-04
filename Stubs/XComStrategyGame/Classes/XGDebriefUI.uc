class XGDebriefUI extends XGScreenMgr
    config(GameData);
//complete stub
enum EDebriefView
{
    eDebriefView_Soldiers,
    eDebriefView_CovertOp,
    eDebriefView_Science,
    eDebriefView_Council,
    eDebriefView_Engineering,
    eDebriefView_MAX
};

struct TDebriefLootItem
{
    var TImage imgItem;
    var TText txtQuantity;
    var TText txtItem;

};

struct TScienceDebriefItem
{
    var TText txtTitle;
    var TText txtTech;
    var TText txtBody;
    var TImage imgTech;
    var TDebriefLootItem kDebriefLootItem;
};

struct TEngineeringDebriefItem
{
    var TText txtTitle;
    var TText txtItem;
    var TText txtBody;
    var TImage imgItem;
};

struct TSoldierPromotionItem
{
    var bool bPromoted;
    var TText txtPromotion;
    var TText txtClassPromotion;
    var TText txtNickname;
    var array<TText> arrPerkText;
};

struct TSoldierDebriefItem
{
    var TImage imgSoldier;
    var TImage imgFlag;
    var TText txtName;
    var TText txtStatus;
    var TLabeledText txtMissions;
    var TLabeledText txtKills;
    var EUIState eState;
    var TSoldierPromotionItem kPromotion;
    var ESoldierClass m_eSoldierClass;
    var ESoldierRanks m_eSoldierRanks;
    var bool m_bWasPromoted;
    var bool m_bPsiPromoted;
    var bool m_bIsPsiSoldier;
    var bool m_bHasGeneMod;
    var bool m_isDead;
    var bool m_bHasPerksToAssign;
    var bool m_bIsTank;
};

struct TCouncilDebrief
{
    var TText txtOpName;
    var TText txtTitle;
    var TText txtAdvisor;
    var TImage imgAdvisor;
    var TImage imgBG;
    var TText txtFeedback;
    var TText txtReward;
    var array<TText> txtPanicDecrease;
    var array<TText> txtPanicIncrease;
    var TText txtFundingTitle;
    var TLabeledText txtFunding;
    var int iHighlighted;
};

struct TScienceProject
{
    var TImage imgProject;
    var TText txtProject;
    var TLabeledText txtProgress;
    var TText txtTitle;
    var TButtonText txtVisit;
    var bool bVisitHighlighted;
};

struct TScienceDebrief
{
    var TText txtOpName;
    var TText txtTitle;
    var TText txtAdvisor;
    var TImage imgAdvisor;
    var TImage imgBG;
    var TText txtLootTitle;
    var TText txtResearchTitle;
    var array<TDebriefLootItem> arrLoot;
    var array<TScienceDebriefItem> arrItems;
    var TScienceProject kProject;
    var int iHighlighted;
};

struct TEngineeringDebrief
{
    var TText txtOpName;
    var TText txtTitle;
    var TText txtAdvisor;
    var TImage imgAdvisor;
    var TImage imgBG;
    var array<TEngineeringDebriefItem> arrItems;
    var int iHighlighted;
};

struct TCovertOpDebrief
{
    var TText txtTitle;
    var TText txtSubTitle;
    var TText txtFeedback;
    var TText txtClueTitle;
    var TText txtClueBody;
    var TSoldierDebriefItem covertSoldier;
    var bool bSuccessful;
};

struct TSoldierDebrief
{
    var TText txtOpName;
    var TText txtTitle;
    var TButtonText txtHireOption;
    var array<TSoldierDebriefItem> arrItems;
    var bool bHireHighlighted;
    var int iHighlighted;
};

var TCouncilDebrief m_kCouncilDebrief;
var TScienceDebrief m_kScienceDebrief;
var TEngineeringDebrief m_kEngineeringDebrief;
var TSoldierDebrief m_kSoldierDebrief;
var TCovertOpDebrief m_kCovertOpDebrief;
var XGShip_Dropship m_kSkyranger;
var array<TSoldierDebriefItem> m_arrSoldierUI;
var bool m_bFirstTime;
var bool m_bPlayedMatinee;
var private bool m_bMedalUnlocked;
var private bool m_bMedalAwarded;
var const localized string m_strAbductionStopped;
var const localized string m_strLabelFundingCouncil;
var const localized string m_strScientists;
var const localized string m_strEngineers;
var const localized string m_strSalvageAnalysis;
var const localized string m_strChiefScientist;
var const localized string m_strUnlockResearchItem;
var const localized string m_strNewResourceProject;
var const localized string m_strLabelResourcesGained;
var const localized string m_strFoundResourceResearch;
var const localized string m_strLabelCurrentResearch;
var const localized string m_strLabelVisitLabs;
var const localized string m_strLabelArtifactsRecovered;
var const localized string m_strLabelAfterReport;
var const localized string m_strLabelMissions;
var const localized string m_strLabelKills;
var const localized string m_strLabelNone;
var const localized string m_strRankNamePromoteRank;
var const localized string m_strMessageGainedPsiRank;
var const localized string m_strClassAssigned;
var const localized string m_strEarnedNickName;
var const localized string m_strAbductionFeedback;
var const localized string m_strAbductionLoss;
var const localized string m_strTerrorFeedback;
var const localized string m_strTerrorLoss;
var const localized string m_strAlienBaseFeedback;
var const localized string m_strAlienBaseLoss;
var const localized string m_strReward;
var const localized string m_strPanicIncreaseContinent;
var const localized string m_strPanicDecreaseContinent;
var const localized string m_strPanicIncreaseCountry;
var const localized string m_strPanicDecreaseCountry;
var const localized string m_strPanicDecreaseWorld;
var const localized string m_strPanicIncreaseWorld;
var const localized string m_strCountryWithdraw;
var const localized string m_strCovertOpTitle;
var const localized string m_strCovertOpSubTitleSuccess;
var const localized string m_strCovertOpSubTitleFailure;
var const localized string m_strCovertOpFeedbackSuccess;
var const localized string m_strCovertOpFeedbackPanicReduction;
var const localized string m_strCovertOpFeedbackAllPointsCaptured;
var const localized string m_strCovertOpFeedbackFailure;
var const localized string m_strCovertOpClueTitle;
var const localized string m_sMedalUnlockTitle;
var const localized string m_sMedalUnlockBody;
var const localized string m_sMedalAwardTitle;
var const localized string m_sMedalAwardBody;

function Init(int iView){}
function bool CheckForMatinee(){}
function PostFirstTimeMatinee(){}
function PostShardMatinee(){}
function PostHyperwaveMatinee(){}
function PostPsiLinkMatinee(){}
function UpdateView(){}
function bool IsViewValid(int iView){}
function OnAccept(){}
function OnPromote(int iOption){}
function OnPromoteCovertOperative(){}
function OnSoldierAccept(){}
function OnScienceAccept(){}
function OnAdvance(){}
function OnCancel(){}
function OnExit(){}
function OnScrollUp(){}
function OnScrollDown(){}
function bool IsAdvanceHighlighted(){}
function UpdateCouncilDebrief(){}
function UpdateScienceDebrief(){}
function bool IsSpecialLootItem(int iItem){}
function int GetUnlockItem(out TTech kTech){}
function UpdateEngineeringDebrief();
function UpdateSoldierDebrief(){}
function TSoldierDebriefItem BuildSoldierOption(XGStrategySoldier kSoldier){}
function array<int> GetSoldierOptions(){}
function BuildSoldierUI(){}
function RefreshSoldierUIPerks(){}
function BuildSoldierPromotion(XGStrategySoldier kSoldier, out TSoldierPromotionItem kPromotionUI, out TSoldierDebriefItem kItem){}
simulated function UpdateSoldierUIData(XGStrategySoldier kSoldier, out TSoldierPromotionItem kPromotionUI, out TSoldierDebriefItem kItem){}
function UpdateCovertOpDebrief(){}
function CheckForMedals(){}
function ConfirmMedalAward(EUIAction eAction){}
function ConfirmMedalUnlock(EUIAction eAction){}
simulated function OnLoseFocus(){}
simulated function OnReceiveFocus(){}
