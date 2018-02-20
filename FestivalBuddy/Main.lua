-- Turbine Imports..
import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

-- Plugin Imports..
import "GaluhadPlugins.FestivalBuddy.VindarPatch";
import "GaluhadPlugins.FestivalBuddy.UTF";
import "GaluhadPlugins.FestivalBuddy.Strings";
import "GaluhadPlugins.FestivalBuddy.QuestStrings";
import "GaluhadPlugins.FestivalBuddy.GeneralFunctions";
import "GaluhadPlugins.FestivalBuddy.FestivalFunctions";
import "GaluhadPlugins.FestivalBuddy.Globals";
import "GaluhadPlugins.FestivalBuddy.Images";
import "GaluhadPlugins.FestivalBuddy.Onscreen";
import "GaluhadPlugins.FestivalBuddy.MessageBox";
import "GaluhadPlugins.FestivalBuddy.DropDown";
import "GaluhadPlugins.FestivalBuddy.Tooltip";
import "GaluhadPlugins.FestivalBuddy.ChatLogger";
import "GaluhadPlugins.FestivalBuddy.BarterItems";
import "GaluhadPlugins.FestivalBuddy.Alert";
import "GaluhadPlugins.FestivalBuddy.AddCallBack";

-- Windows --
import "GaluhadPlugins.FestivalBuddy.BarterWin";
import "GaluhadPlugins.FestivalBuddy.MainWin";
import "GaluhadPlugins.FestivalBuddy.AltWin";

import "GaluhadPlugins.FestivalBuddy.Dance";


-- Other imports --
import "GaluhadPlugins.FestivalBuddy.Commands";


-----------------------------------------------------------------------------------------------------------

function saveData()

	-- Store the settings table.
	PatchDataSave(Turbine.DataScope.Character, "FestivalBuddy_Settings", SETTINGS);
	PatchDataSave(Turbine.DataScope.Server, "FestivalBuddy_CharData", _CHARDATA);
	PatchDataSave(Turbine.DataScope.Account, "FestivalBuddy_ImageIDs", _SAVEDIMAGES);

end


function loadData()

	---------------------------------------------------------------------------------------------------------------------------------

	-- SAVED SETTINGS --

	local SavedSettings = {};

	-- Load the settings
	function GetSavedSettings()
		SavedSettings = PatchDataLoad(Turbine.DataScope.Character, "FestivalBuddy_Settings");
	end

	if pcall(GetSavedSettings) then
		-- Loaded without error
		SavedSettings = PatchDataLoad(Turbine.DataScope.Character, "FestivalBuddy_Settings");
	else
		-- Loaded with errors
		SavedSettings = nil;
		Turbine.Shell.WriteLine(_LANG.SETTINGSLOADERROR[SETTINGS.LANGUAGE]);
	end


	-- Check the saved settings to make sure it is still compatible with newer updates, add in any missing default settings
	if type(SavedSettings) == 'table' then

		local tempSETTINGS = {};
		tempSETTINGS = deepcopy(DEFAULT_SETTINGS);

		SETTINGS = mergeTables(tempSETTINGS,SavedSettings);

	else

		SETTINGS = deepcopy(DEFAULT_SETTINGS);

	end

	SELECTEDFESTIVAL = SETTINGS.FESTIVAL;

	SETTINGS["SELFESTIVAL"] = nil;

	----------------------------------------------------------------------------------------------------------------------------------


	-- SAVED CHARACTER DATA --

	local SavedCharData = {};

	-- Load the settings
	function GetSavedCharData()
		SavedCharData = PatchDataLoad(Turbine.DataScope.Server, "FestivalBuddy_CharData");
	end

	if pcall(GetSavedCharData) then
		-- Loaded without error
		SavedCharData = PatchDataLoad(Turbine.DataScope.Server, "FestivalBuddy_CharData");
	else
		-- Loaded with errors
		SavedCharData = nil;
		Turbine.Shell.WriteLine(_LANG.SETTINGSLOADERROR[SETTINGS.LANGUAGE]);
	end


	-- Check the saved settings to make sure it is still compatible with newer updates, add in any missing default settings
	if type(SavedCharData) == 'table' then
		_CHARDATA = deepcopy(SavedCharData);
	end

	-- Update old format to new format
	for playerName,festivalsTable in pairs (_CHARDATA) do
		if festivalsTable["Spring"] ~= nil then
			_CHARDATA[playerName][1] = deepcopy(festivalsTable["Spring"]);
			festivalsTable["Spring"] = nil;
		end

		if festivalsTable["Harvestmath"] ~= nil then
			_CHARDATA[playerName][3] = deepcopy(festivalsTable["Harvestmath"]);
			festivalsTable["Harvestmath"] = nil;
		end

		if festivalsTable["Yule"] ~= nil then
			_CHARDATA[playerName][4] = deepcopy(festivalsTable["Yule"]);
			festivalsTable["Yule"] = nil;
		end

		for festivalID,dataCategory in pairs (festivalsTable) do
			if dataCategory.TOKENS ~= nil then
				for k,v in pairs (dataCategory.TOKENS) do
					if _LANG.TOKENS[festivalID][k] == nil then _CHARDATA[playerName][festivalID].TOKENS[k] = nil end;
				end
			end
		end

	end

	----------------------------------------------------------------------------------------------------------------------------------

	-- SAVED IMAGE IDs --

	local SavedImageData = {};

	-- Load the settings
	function GetSavedImageData()
		SavedImageData = PatchDataLoad(Turbine.DataScope.Account, "FestivalBuddy_ImageIDs");
	end

	if pcall(GetSavedImageData) then
		-- Loaded without error
		SavedImageData = PatchDataLoad(Turbine.DataScope.Account, "FestivalBuddy_ImageIDs");
	else
		-- Loaded with errors
		SavedImageData = nil;
		Turbine.Shell.WriteLine(_LANG.SETTINGSLOADERROR[SETTINGS.LANGUAGE]);
	end


	-- Check the saved settings to make sure it is still compatible with newer updates, add in any missing default settings
	if type(SavedImageData) == 'table' then

		_SAVEDIMAGES = deepcopy(SavedImageData);

	end

	----------------------------------------------------------------------------------------------------------------------------------


end


function DrawWindows()

	DrawMainWin();
	DrawDanceWin();
	DrawBarterWin();
	DrawAltWin();

end


Turbine.Plugin.Unload = function (sender, args)
	-- Save the data when the plugin unloads.
	saveData();
end


-- Initiate load sequence
loadData();
CheckCharData();
DrawWindows();
InitiateChatLogger();
RegisterCommands();
RefreshTokenView();

-- Load text
print("Loaded Festival Buddy v" .. Plugins["Festival Buddy"]:GetVersion() .. " by Galuhad");
if wMainWinParent:IsVisible() == false then
	print(_LANG.OTHER.COMMAND[SETTINGS.LANGUAGE]);
end
