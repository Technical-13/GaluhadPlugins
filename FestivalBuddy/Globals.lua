
SETTINGS = {}; -- Table used when loading settings.
_CHARDATA = {}; -- Table used when loading saved character data.
_SAVEDIMAGES = {}; -- Table used when loading saved image ids.

blSAVED = false;

MYCHAR = Turbine.Gameplay.LocalPlayer.GetInstance();
MYWALLET = MYCHAR:GetWallet();
EFFECTS = MYCHAR:GetEffects();
MYBACKPACK = MYCHAR:GetBackpack();


MYWALLET.ItemAdded = function (sender,args)
	RefreshTokenView();
end

MYWALLET.ItemRemoved = function (sender,args)
	wMainWinParent:SetWantsUpdates(true);
end


EFFECTS.EffectAdded = function (sender,args)
	RefreshDebuffView();
end

EFFECTS.EffectRemoved = function (sender,args)
	RefreshDebuffView();
end

--[[

	_ITEMCONTROLS =
		{
		[ITEMNAME] = SENDER
		};

--]]


-- When items are added / removed - need to check database to see if the item is assigned a slot anywhere that needs updating.
MYBACKPACK.ItemAdded = function (sender,args)
	local NEWITEM = args.Item;
	local ITEMNAME = NEWITEM:GetName();

	-- Search database for item
	if _ITEMCONTROLS[ITEMNAME] ~= nil then
		_ITEMCONTROLS[ITEMNAME]:SetItem(NEWITEM);
	end

end

MYBACKPACK.ItemRemoved = function (sender,args)
	-- Not needed at the moment
end

_ITEMCONTROLS = {};

SELECTEDQUEST = "";
ISACTING = false; -- Flag used to determine if the character is acting in the yule festival.

SCREENWIDTH = Turbine.UI.Display.GetWidth();
SCREENHEIGHT = Turbine.UI.Display.GetHeight();

TRANSPARENT = Turbine.UI.Color(0,0,0,0); -- ARGB
WHITE = Turbine.UI.Color(1,1,1);
BLACK = Turbine.UI.Color(0,0,0);
DARKGREY = Turbine.UI.Color(0.1,0.1,0.1);
GREY = Turbine.UI.Color(0.5,0.5,0.5);
LIGHTGREY = Turbine.UI.Color(0.8,0.8,0.8);
GREEN = Turbine.UI.Color(0,1,0);
YELLOW = Turbine.UI.Color(1,1,0);
BEIGE = Turbine.UI.Color((229/255),(209/255),(136/255));
ORANGE = Turbine.UI.Color(247/255,148/255,29/255);

TrajanPro16 = Turbine.UI.Lotro.Font.TrajanPro16;
TrajanPro14 = Turbine.UI.Lotro.Font.TrajanPro14;
Verdana12 = Turbine.UI.Lotro.Font.Verdana12;


_QUALITYCOLORS = {
	[0] = Turbine.UI.Color.White;			-- Undefined
	[5] = Turbine.UI.Color.White;			-- Common
	[4] = Turbine.UI.Color.Yellow;		-- Uncommon
	[2] = Turbine.UI.Color.Magenta;		-- Rare
	[3] = Turbine.UI.Color.Aqua;			-- Incomparable
	[1] = Turbine.UI.Color.Orange;		-- Legendary
};


-- Random Variables
blDRAGGING = false;
relX = 0;
relY = 0;

-- Detect client lang.
CLIENTLANG = "ENGLISH";
if Turbine.Engine.GetLanguage() == Turbine.Language.French then
	CLIENTLANG = "FRENCH";
elseif Turbine.Engine.GetLanguage() == Turbine.Language.German then
	CLIENTLANG = "GERMAN";
elseif Turbine.Engine.GetLanguage() == Turbine.Language.Russian then
	CLIENTLANG = "RUSSIAN";
end

-- Default Settings
DEFAULT_SETTINGS = {
	["LANGUAGE"] = CLIENTLANG;
	["MSGCOLOR"] = "FFFFFF";
	["FESTIVAL"] = 1;
	["EMOTESASSIST"] = true;
	["QSASSIST"] = true;
	["SHOWSCREEN"] = true;
	[ "MAINWIN" ] = {
		[ "VISIBLE" ] = true;
		[ "X" ] = SCREENWIDTH / 2 - 225;
		[ "Y" ] = SCREENHEIGHT / 3;
	};
	[ "DANCEWIN" ] = {
		[ "VISIBLE" ] = false;
		[ "X" ] = SCREENWIDTH / 2 - 100;
		[ "Y" ] = SCREENHEIGHT / 3;
	};
	[ "BARTERWIN" ] = {
		[ "VISIBLE" ] = false;
		[ "X" ] = SCREENWIDTH / 2 - 100;
		[ "Y" ] = SCREENHEIGHT / 3;
	};
	[ "ALTWIN" ] = {
		[ "VISIBLE" ] = false;
		[ "X" ] = SCREENWIDTH / 2 - 100;
		[ "Y" ] = SCREENHEIGHT / 3;
	};
	[ "EMOTEWIN" ] = {
		[ "VISIBLE" ] = false;
		[ "X" ] = SCREENWIDTH / 2;
		[ "Y" ] = SCREENHEIGHT / 3;
	};
	[ "QSWIN" ] = {
		[ "VISIBLE" ] = false;
		[ "X" ] = SCREENWIDTH / 2;
		[ "Y" ] = SCREENHEIGHT / 3;
	};
};