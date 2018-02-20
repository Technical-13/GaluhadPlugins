
-- Chat log filter.
-- Controls chat messages and actions the appropriate functions based on the message.

function InitiateChatLogger()

	CHATLOG = Turbine.Chat;
	CHATLOG.Received = function (sender, args)

		local tempMessage = tostring(args.Message);

		if args.ChatType == Turbine.ChatType.Standard then
			FilterStandard(tempMessage);
		end

		if args.ChatType == Turbine.ChatType.Say then
			FilterSay(tempMessage);
		end

		if args.ChatType == Turbine.ChatType.Quest then
			FilterQuest(tempMessage);
		end

	end
end


function FilterStandard(cMessage)
-- Filters here for use with the Standard channel.

	--Debug("Standard: " .. cMessage);


	-- Yule Festival: Theatre emote prompt filters.
	if ISACTING == true then

		if string.find(cMessage,_LANG.OTHER.TIMETOPERFORM[SETTINGS.LANGUAGE]) then
			-- Target checking
			local SELTARGET = MYCHAR:GetTarget();

			if SELTARGET ~= nil then
				if SELTARGET:GetName() ~= _LANG.OTHER.AUDIENCE[SETTINGS.LANGUAGE] then local tmpMsg = Alert(_LANG.OTHER.YULESELAUDIENCE[SETTINGS.LANGUAGE]) end;
			else
				local tmpMsg = Alert(_LANG.OTHER.YULESELAUDIENCE[SETTINGS.LANGUAGE]);
			end
		end
	end
	----

end


function FilterQuest(cMessage)
-- Filters here for use with the Quest channel.

	local NewQuest = string.find(cMessage,(_LANG.QUESTS.NEWQUEST[SETTINGS.LANGUAGE]));
	local CompQuest = string.find(cMessage,(_LANG.QUESTS.COMPLETEDQUEST[SETTINGS.LANGUAGE]));

	if NewQuest ~= nil then FilterNewQuests(cMessage) end;
	if CompQuest ~= nil then FilterCompletedQuests(cMessage) end;

end


function FilterSay(cMessage)
-- Filters here for use with the say channel.

	-- Dance instructor filters.
	if wDanceParent:IsVisible(true) then

		local a = string.find(cMessage,("Nedhrien"));
		local b = string.find(cMessage,("Oger Brockhouse"));
		local c = string.find(cMessage,("Galmi"));
		local d = string.find(cMessage,("Ada Musgrove"));

		if a ~= nil then
			FilterDanceStep(cMessage,"Nedhrien"); -- Dance instructor message
		elseif b ~= nil then
			FilterDanceStep(cMessage,"Oger Brockhouse"); -- Dance instructor message
		elseif c ~= nil then
			FilterDanceStep(cMessage,"Galmi"); -- Dance instructor message
		elseif d ~= nil then
			FilterDanceStep(cMessage,"Ada Musgrove"); -- Dance instructor message
		end
	end

	-- Bree Fireworks Announcer (Anniversary)
	if SELECTEDQUEST == _LANG.QUESTS[5].BREEFIREWORKS[SETTINGS.LANGUAGE] then
		if string.find(cMessage,_LANG.OTHER.NPC_FIREWORKANNOUNCER[SETTINGS.LANGUAGE]) then
			local message = string.match(cMessage,"[\"'](.*)[\"']");
			Alert("<rgb=#00FFFF>"..message.."</rgb>",6);
		end
	end

	-- Other filters


end

