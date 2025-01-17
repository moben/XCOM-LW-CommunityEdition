class LWCEUtils extends Object
    dependson(LWCETypes);

static function AdjustItemQuantity(out array<LWCE_TItemQuantity> arrItemQuantities, int iItemId, int iQuantity, optional bool bDeleteIfAllRemoved = true)
{
    local int Index;
    local LWCE_TItemQuantity kItemQuantity;

    Index = arrItemQuantities.Find('iItemId', iItemId);

    if (Index == INDEX_NONE)
    {
        if (iQuantity > 0)
        {
            kItemQuantity.iItemId = iItemId;
            kItemQuantity.iQuantity = iQuantity;

            Index = arrItemQuantities.Length;
            arrItemQuantities.AddItem(kItemQuantity);
        }
    }
    else
    {
        arrItemQuantities[Index].iQuantity += iQuantity;
    }

    if (Index != INDEX_NONE && arrItemQuantities[Index].iQuantity <= 0 && bDeleteIfAllRemoved)
    {
        arrItemQuantities.Remove(Index, 1);
    }
}

static function LWCE_TItemQuantity GetItemQuantity(out array<LWCE_TItemQuantity> arrItemQuantities, int iItemId, optional out int Index)
{
    local LWCE_TItemQuantity kItemQuantity;

    Index = arrItemQuantities.Find('iItemId', iItemId);

    if (Index == INDEX_NONE)
    {
        kItemQuantity.iItemId = iItemId;
        kItemQuantity.iQuantity = 0;

        return kItemQuantity;
    }

    return arrItemQuantities[Index];
}

/// <summary>
/// Checks if the given Foundry tech is researched in a way that works for both the tactical and strategy game.
/// This function assumes the current game is fully set up, and may throw errors if called from the initialization
/// path of either the tactical or strategy layer.
/// </summary>
static function bool IsFoundryTechResearched(int iTechId)
{
    if (`LWCE_IS_TAC_GAME)
    {
        return `LWCE_TAC_CARGO.HasFoundryTech(iTechId);
    }

    return `LWCE_ENGINEERING.IsFoundryTechResearched(iTechId);
}

/// <summary>
/// Opens LWCE's mod settings menu, handling checks for whichever presentation layer we're currently in.
/// </summary>
static simulated function OpenModSettingsMenu()
{
    if (`LWCE_HQPRES != none)
    {
        `LWCE_HQPRES.LWCE_UIModSettings();
    }
    else if (`LWCE_TACPRES != none)
    {
        `LWCE_TACPRES.LWCE_UIModSettings();
    }/*
    else if (`LWCE_SHELLPRES != none)
    {
        `LWCE_SHELLPRES.LWCE_UIModSettings();
    } */
    else
    {
        `LWCE_LOG_CLS("ERROR: could not find appropriate presentation layer to open mod settings menu");
    }
}

/// <summary>
/// Selects a random value from the given range.
/// </summary>
static function int RandInRange(LWCE_TRange kRange)
{
    return kRange.MinInclusive + Rand(kRange.MaxInclusive - kRange.MinInclusive + 1);
}

static function SetItemQuantity(out array<LWCE_TItemQuantity> arrItemQuantities, int iItemId, int iQuantity)
{
    local int Index;
    local LWCE_TItemQuantity kItemQuantity;

    Index = arrItemQuantities.Find('iItemId', iItemId);

    if (Index == INDEX_NONE)
    {
        if (iQuantity > 0)
        {
            kItemQuantity.iItemId = iItemId;
            kItemQuantity.iQuantity = iQuantity;

            arrItemQuantities.AddItem(kItemQuantity);
        }
    }
    else
    {
        arrItemQuantities[Index].iQuantity = iQuantity;
    }
}

static function int SortItemsById(LWCE_TItem kItem1, LWCE_TItem kItem2)
{
    if (kItem1.iItemId <= kItem2.iItemId)
    {
        return 0;
    }

    return -1;
}