
-- General functions specific to Festival Buddy

-- THIS FUNCTION IS CURRENTLY NOT USED.

function GetDebuffs()

	local EFFECTSCOUNT = EFFECTS:GetCount();

	for i=1, EFFECTSCOUNT do

		local CUREFFECT = EFFECTS:Get(i);
		local CUREFFECTNAME = CUREFFECT:GetName();

		local _DEBUFFS = _LANG.DEBUFFS[SELECTEDFESTIVAL];

		for k,v in pairs (_DEBUFFS) do

			if v[SETTINGS.LANGUAGE] == CUREFFECTNAME then

				local CDREMAINING = CUREFFECT:GetDuration() - (Turbine.Engine.GetGameTime() - CUREFFECT:GetStartTime());

				local TIME = ConvertTime(CDREMAINING);

				--Debug(CUREFFECT:GetName() .. " = " .. TIME.DAYS .. ":" .. TIME.HOURS .. ":" .. TIME.MINUTES .. ":" .. TIME.SECONDS);

				break;
			end

		end

	end

end


function FilterNewQuests(QUESTNAME)

	-- loop through quest names to see if there's a match in the table. If so set it as the quest guide.
	for k,v in pairs (_LANG.QUESTS[SELECTEDFESTIVAL]) do

		local TEMPQUEST = v[SETTINGS.LANGUAGE];
		TEMPQUEST = string.gsub(TEMPQUEST,"%-","%%-");
		TEMPQUEST = string.gsub(TEMPQUEST,"%(","%%(");
		TEMPQUEST = string.gsub(TEMPQUEST,"%)","%%)");

		local a = string.find(QUESTNAME,TEMPQUEST);

		if a ~= nil then
			-- Match found
			RefreshQuestGuide(v[SETTINGS.LANGUAGE]);
			break;
		end
	end
end


function FilterCompletedQuests(QUESTNAME)

	local TEMPQUEST = string.gsub(SELECTEDQUEST,"%-","%%-");
	TEMPQUEST = string.gsub(TEMPQUEST,"%(","%%(");
	TEMPQUEST = string.gsub(TEMPQUEST,"%)","%%)");
	local a = string.find(QUESTNAME,TEMPQUEST);

	if a ~= nil then
		-- match found
		lblQuestGuide:SetText("");
		ddQuests:SetText("");
		SELECTEDQUEST = "";
		if wEmoteAssistParent ~= nil then wEmoteAssistParent:Close() end;
		if wQSAssistParent ~= nil then wQSAssistParent:Close() end;
	end
end


function CheckCharData()

	-- This function checks if there is an entry in the _CHARDATA table, if not then it creates it.
	local CHARNAME = MYCHAR:GetName();

	if type (_CHARDATA[CHARNAME]) ~= 'table' then _CHARDATA[CHARNAME] = {} end;

	CheckFestivalData(_CHARDATA[CHARNAME]);

end


function CheckFestivalData(_TABLE)

	if type (_TABLE) ~= 'table' then return end;

	-- Checks if the current festival exists in the characters data, if so then it adds any newer fields that may have been
	-- added in newer updates whilst retaining the values of old values that have been loaded.
	for e,f in pairs(_LANG.FESTIVALS) do

		if _TABLE[e] == nil then _TABLE[e] = {} end;


		-- COOLDOWNS ---
		if _TABLE[e]["COOLDOWNS"] == nil then _TABLE[e]["COOLDOWNS"] = {} end;

		local _CDTABLE = _TABLE[e]["COOLDOWNS"];

		for	k,v in pairs (_LANG.DEBUFFS[e]) do
			if _CDTABLE[v[SETTINGS.LANGUAGE]] == nil then
				_CDTABLE[v[SETTINGS.LANGUAGE]] = 0;
			end
		end


		-- TOKENS ---
		if _TABLE[e]["TOKENS"] == nil then _TABLE[e]["TOKENS"] = {} end;

		for	k,v in pairs (_LANG.TOKENS[e]) do
			if _TABLE[e]["TOKENS"][k] == nil then
				_TABLE[e]["TOKENS"][k] = 0;
			end
		end

	end

end


function GetAltNames()

	-- This function gets the names of the alts which have data stored and builds the names into a returned table.
	local _ALTS = {};

	for k,v in pairs (_CHARDATA) do
		if k ~= MYCHAR:GetName() then
			table.insert(_ALTS,k);
		end
	end

	return _ALTS;
end

