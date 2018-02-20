
function DrawMainWin()

	local tempWidth = 300;
	local tempHeight = 520;

	-- Main Parent window to hold all the elements
	wMainWinParent = Turbine.UI.Lotro.Window();
	wMainWinParent:SetSize(tempWidth,tempHeight);
	wMainWinParent:SetPosition(SETTINGS.MAINWIN.X,SETTINGS.MAINWIN.Y);
	wMainWinParent:SetText("Festival Buddy");
	wMainWinParent:SetVisible(SETTINGS.MAINWIN.VISIBLE);

	Onscreen(wMainWinParent); -- Makes sure the window is still onscreen (perhaps user changed resolution since last playing)


	local _FESTIVALS = {};

	for k,v in ipairs(_LANG.FESTIVALS) do
		table.insert(_FESTIVALS,v[SETTINGS.LANGUAGE]);
	end

	ddFestivals = DropDown(_FESTIVALS,_LANG.FESTIVALS[SELECTEDFESTIVAL][SETTINGS.LANGUAGE]);
	ddFestivals:SetParent(wMainWinParent);
	ddFestivals:SetPosition(50,40);
	ddFestivals:SetWidth(200);

	ddFestivals.ItemChanged = function (Sender,Args)
		SELECTEDFESTIVAL = Args.Index;
		SETTINGS.FESTIVAL = SELECTEDFESTIVAL;
		FillMainWin(SELECTEDFESTIVAL);
		if wEmoteAssistParent ~= nil then wEmoteAssistParent:Close() end;
		if wQSAssistParent ~= nil then wQSAssistParent:Close() end;
		RefreshTokenView();
		RefreshBarterList();
		CheckFestivalData(_CHARDATA[MYCHAR:GetName()]);
		if ddAltNames ~= nil then RefreshAltDisplay(ddAltNames:GetText()) end;
	end


	-- Control to hold the elements which change depending on the festival
	wMainWinHolder = Turbine.UI.Control();
	wMainWinHolder:SetParent(wMainWinParent);
	wMainWinHolder:SetSize(tempWidth-9,tempHeight-160);
	wMainWinHolder:SetPosition(5,70);

	FillMainWin(SELECTEDFESTIVAL);

	-- Common elements

	wMainCommonHolder = Turbine.UI.Control();
	wMainCommonHolder:SetParent(wMainWinParent);
	wMainCommonHolder:SetSize(tempWidth-20,45);
	wMainCommonHolder:SetPosition(10,wMainWinHolder:GetTop() + wMainWinHolder:GetHeight() + 5);
	wMainCommonHolder:SetBackground(_IMAGES.COMMONBACK);

	btnDance = Turbine.UI.Lotro.Button();
	btnDance:SetParent(wMainCommonHolder);
	btnDance:SetWidth(100);
	btnDance:SetPosition(30,10);
	btnDance:SetText(_LANG.BUTTONS.DANCE[SETTINGS.LANGUAGE]);

	btnDance.MouseClick = function (sender,args)

		if SETTINGS.DANCEWIN.VISIBLE == true then
			SETTINGS.DANCEWIN.VISIBLE = false;
		else
			SETTINGS.DANCEWIN.VISIBLE = true;
		end

		wDanceParent:SetVisible(SETTINGS.DANCEWIN.VISIBLE);

	end

	btnBarter = Turbine.UI.Lotro.Button();
	btnBarter:SetParent(wMainCommonHolder);
	btnBarter:SetWidth(100);
	btnBarter:SetPosition(150,10);
	btnBarter:SetText(_LANG.OTHER.BARTER[SETTINGS.LANGUAGE]);

	btnBarter.MouseClick = function (sender,args)

		if SETTINGS.BARTERWIN.VISIBLE == true then
			SETTINGS.BARTERWIN.VISIBLE = false;
		else
			SETTINGS.BARTERWIN.VISIBLE = true;
		end

		wBarterWinParent:SetVisible(SETTINGS.BARTERWIN.VISIBLE);

	end


	btnAlts = Turbine.UI.Lotro.Button();
	btnAlts:SetParent(wMainWinParent);
	btnAlts:SetWidth(100);
	btnAlts:SetPosition((tempWidth/2)-50,tempHeight-33);
	btnAlts:SetText(_LANG.OTHER.ALTS[SETTINGS.LANGUAGE]);

	btnAlts.MouseClick = function (sender,args)

		if SETTINGS.ALTWIN.VISIBLE == true then
			SETTINGS.ALTWIN.VISIBLE = false;
		else
			SETTINGS.ALTWIN.VISIBLE = true;

			if ddAltNames ~= nil then
				RefreshAltDisplay(ddAltNames:GetText());
			end
		end

		wAltWinParent:SetVisible(SETTINGS.ALTWIN.VISIBLE);

	end


	cReposCursor=Turbine.UI.Window();
	cReposCursor:SetSize(32,32);
	cReposCursor:SetBackground(_IMAGES.REPOSCURSOR)
	cReposCursor:SetStretchMode(2);
	cReposCursor:SetMouseVisible(false);
	cReposCursor:SetZOrder(1000);
	cReposCursor:SetVisible(false);



	-- Window events
	wMainWinParent.Update = function (sender,args)
		wMainWinParent:SetWantsUpdates(false);
		RefreshTokenView();
	end

	wMainWinParent.Closing = function()
		SETTINGS.MAINWIN.VISIBLE = false;
		print(_LANG.OTHER.COMMAND[SETTINGS.LANGUAGE]);
	end

	wMainWinParent.PositionChanged = function()
		SETTINGS.MAINWIN.X = wMainWinParent:GetLeft();
		SETTINGS.MAINWIN.Y = wMainWinParent:GetTop();
	end

	wMainWinParent:SetWantsKeyEvents(true);

	wMainWinParent.KeyDown = function (sender,args)
		if args.Action == 268435635 then -- handles F12 button

			if SETTINGS.SHOWSCREEN == false then
				wMainWinParent:SetVisible(SETTINGS.MAINWIN.VISIBLE);

				if wMainWinParent:IsVisible() == true then
					if wEmoteAssistParent ~= nil then wEmoteAssistParent:SetVisible(SETTINGS.EMOTEWIN.VISIBLE) end;
					if wQSAssistParent ~= nil then wQSAssistParent:SetVisible(SETTINGS.QSWIN.VISIBLE) end;
				end

				SETTINGS.SHOWSCREEN = true;
			else
				wMainWinParent:SetVisible(false);

				if wEmoteAssistParent ~= nil then wEmoteAssistParent:SetVisible(false) end;
				if wQSAssistParent ~= nil then wQSAssistParent:SetVisible(false) end;

				SETTINGS.SHOWSCREEN = false;
			end

		end

		if args.Action == 145 then -- handles Esc button
			if wMainWinParent:IsVisible() == true then
				SETTINGS.MAINWIN.VISIBLE = false;
				wMainWinParent:SetVisible(false);

				if wEmoteAssistParent ~= nil then wEmoteAssistParent:SetVisible(false) end;
				if wQSAssistParent ~= nil then wQSAssistParent:SetVisible(false) end;

				print(_LANG.OTHER.COMMAND[SETTINGS.LANGUAGE]);
			end
		end

	end

end


function FillMainWin(FESTIVAL)

	if FESTIVAL == nil then return end;

	wMainWinHolder:GetControls():Clear();

	wMainWinHolder:SetBackground( _IMAGES[ FESTIVAL ].BACKGROUND );

	-- TOKENS --------------------------------------------------------------------------
	cTokenHolder = Turbine.UI.ListBox();
	cTokenHolder:SetParent(wMainWinHolder);
	cTokenHolder:SetSize(0,34);
	cTokenHolder:SetPosition(10,2);
	cTokenHolder:SetOrientation(Turbine.UI.Orientation.Horizontal);

	scTokenHolder = Turbine.UI.Lotro.ScrollBar();
	scTokenHolder:SetParent(wMainWinHolder);
	scTokenHolder:SetSize(wMainWinHolder:GetWidth()-20,8);
	scTokenHolder:SetPosition(10,cTokenHolder:GetTop() + cTokenHolder:GetHeight());
	scTokenHolder:SetOrientation(Turbine.UI.Orientation.Horizontal);
	scTokenHolder:SetZOrder(200000);
	scTokenHolder:SetVisible(false);

	cTokenHolder:SetHorizontalScrollBar(scTokenHolder);

	--RefreshTokenView();

	-- COOLDOWNS -------------------------------------------------------------------------
	cDebuffHolder = Turbine.UI.ListBox();
	cDebuffHolder:SetParent(wMainWinHolder);
	cDebuffHolder:SetSize(wMainWinHolder:GetWidth()-28,144);
	cDebuffHolder:SetPosition(13,scTokenHolder:GetTop() + 18);
	cDebuffHolder:SetOrientation(Turbine.UI.Orientation.Horizontal);
	cDebuffHolder:SetMaxItemsPerLine(2);

	scDebuffHolder = Turbine.UI.Lotro.ScrollBar();
	scDebuffHolder:SetParent(wMainWinHolder);
	scDebuffHolder:SetSize(8,cDebuffHolder:GetHeight());
	scDebuffHolder:SetPosition(cDebuffHolder:GetLeft()+cDebuffHolder:GetWidth(),cDebuffHolder:GetTop());
	scDebuffHolder:SetOrientation(Turbine.UI.Orientation.Vertical);
	scDebuffHolder:SetZOrder(200000);
	scDebuffHolder:SetVisible(false);

	cDebuffHolder:SetVerticalScrollBar(scDebuffHolder);

	-- QUEST GUIDE -----------------------------------------------------------------------
	local _REFORMATQUESTS = {};

	for k,v in pairs(_LANG.QUESTS[SELECTEDFESTIVAL]) do
		table.insert(_REFORMATQUESTS,v[SETTINGS.LANGUAGE]);
	end

	ddQuests = DropDown(_REFORMATQUESTS,"");
	ddQuests:SetParent(wMainWinHolder);
	ddQuests:SetPosition(45,cDebuffHolder:GetTop()+cDebuffHolder:GetHeight() + 10);
	ddQuests:SetWidth(200);
	ddQuests:SetAlignment("Left");

	ddQuests.ItemChanged = function (Sender,Args)
		RefreshQuestGuide(Args.Text);
	end

	lblQuestGuide = Turbine.UI.Label();
	lblQuestGuide:SetParent(wMainWinHolder);
	lblQuestGuide:SetSize(wMainWinHolder:GetWidth()-38,120);
	lblQuestGuide:SetPosition(18,ddQuests:GetTop()+ddQuests:GetHeight() + 5);
	lblQuestGuide:SetMarkupEnabled(true);
	lblQuestGuide:SetFont(Verdana12);

	sclblQuestGuide = Turbine.UI.Lotro.ScrollBar();
	sclblQuestGuide:SetParent(wMainWinHolder);
	sclblQuestGuide:SetSize(8,lblQuestGuide:GetHeight());
	sclblQuestGuide:SetPosition(lblQuestGuide:GetLeft()+lblQuestGuide:GetWidth()+6,lblQuestGuide:GetTop());
	sclblQuestGuide:SetOrientation(Turbine.UI.Orientation.Vertical);
	sclblQuestGuide:SetZOrder(200000);
	sclblQuestGuide:SetVisible(false);

	lblQuestGuide:SetVerticalScrollBar(sclblQuestGuide);

	RefreshDebuffView();

end


function RefreshQuestGuide(QUESTNAME)

	SELECTEDQUEST = QUESTNAME;

	if ddQuests ~= nil then ddQuests:SetText(QUESTNAME) end;

	local _QUESTS = _LANG.QUESTS[SELECTEDFESTIVAL];

	for k,v in pairs (_QUESTS) do

		if v[SETTINGS.LANGUAGE] == QUESTNAME then
			lblQuestGuide:SetText(_QUESTSTRINGS[SELECTEDFESTIVAL][k].STRING[SETTINGS.LANGUAGE]);

			if wEmoteAssistParent ~= nil then wEmoteAssistParent:Close() end;
			if wQSAssistParent ~= nil then wQSAssistParent:Close() end;

			if SETTINGS.EMOTESASSIST == true and _QUESTSTRINGS[SELECTEDFESTIVAL][k].EMOTES ~= nil then CreateEmotesAssist(_QUESTSTRINGS[SELECTEDFESTIVAL][k].EMOTES[SETTINGS.LANGUAGE]) end;
			if SETTINGS.QSASSIST == true and _QUESTSTRINGS[SELECTEDFESTIVAL][k].QUICKSLOTS ~= nil then CreateQuickSlotAssit(_QUESTSTRINGS[SELECTEDFESTIVAL][k].QUICKSLOTS[SETTINGS.LANGUAGE]) end;

			break;
		end
	end
end


function RefreshDebuffView()

	cDebuffHolder:ClearItems();

	local ITEMWIDTH = (cDebuffHolder:GetWidth()/2);
	local ITEMHEIGHT = 36;
	local EFFECTSCOUNT = EFFECTS:GetCount();

	for k,v in pairs (_LANG.DEBUFFS[SELECTEDFESTIVAL]) do

		-- Draw controls

		local cCURITEM = Turbine.UI.Control();
		cCURITEM:SetSize(ITEMWIDTH,ITEMHEIGHT);

		local cCURITEMICON = Turbine.UI.Control();
		cCURITEMICON:SetParent(cCURITEM);
		cCURITEMICON:SetSize(32,32);
		cCURITEMICON:SetPosition(0,2);
		cCURITEMICON:SetBlendMode(4);


		local cCURITEMLABEL = Turbine.UI.Label();
		cCURITEMLABEL:SetParent(cCURITEM);
		cCURITEMLABEL:SetSize(ITEMWIDTH-34,ITEMHEIGHT-4);
		cCURITEMLABEL:SetPosition(34,2);
		cCURITEMLABEL:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
		cCURITEMLABEL:SetFont(Verdana12);
		--cCURITEMLABEL:SetOutlineColor(BLACK);
		--cCURITEMLABEL:SetFontStyle(Turbine.UI.FontStyle.Outline);
		cCURITEMLABEL:SetText(v[SETTINGS.LANGUAGE]);
		cCURITEMLABEL:SetMouseVisible(true);


		-- Test for debuff
		local blCURDEBUFFFOUND = false;

		for i=1, EFFECTSCOUNT do

			local CUREFFECT = EFFECTS:Get(i);
			local CUREFFECTNAME = CUREFFECT:GetName();

			if v[SETTINGS.LANGUAGE] == CUREFFECTNAME then
				-- Debuff found
				blCURDEBUFFFOUND = true;

				-- Store expiry time in _CHARDATA
				local EFFECTEND = CUREFFECT:GetStartTime() + CUREFFECT:GetDuration();

				_CHARDATA[MYCHAR:GetName()][SELECTEDFESTIVAL]["COOLDOWNS"][v[SETTINGS.LANGUAGE]] = EFFECTEND;

				break;
			end
		end

		-- Adjust label accordingly.
		if SELECTEDFESTIVAL == 4 then -- handles theatre roles debuffs / inverted from normal debuffs
			if blCURDEBUFFFOUND == false then
				cCURITEMLABEL:SetForeColor(GREY);
				cCURITEMICON:SetBackground(_IMAGES.HOURGLASS);
				cCURITEMICON:SetSize(32,32);
				cCURITEMICON:SetPosition(0,2);

			else
				_CHARDATA[MYCHAR:GetName()][SELECTEDFESTIVAL]["COOLDOWNS"][v[SETTINGS.LANGUAGE]] = 0;
				cCURITEMLABEL:SetForeColor(YELLOW);
				cCURITEMICON:SetBackground(_IMAGES.GREENTICK);
				cCURITEMICON:SetSize(25,22);
				cCURITEMICON:SetPosition(3,8);

				if k ~= "THEATRE" then
					-- Current role has been found, set questguide
					RefreshQuestGuide(_LANG.QUESTS[4][k][SETTINGS.LANGUAGE]);
					ISACTING = true;
				else
					-- Debuff is THEATRE - only set guide if not acting
					if ISACTING == false then RefreshQuestGuide(_LANG.QUESTS[4][k][SETTINGS.LANGUAGE]) end;
				end
			end
		else
			if blCURDEBUFFFOUND == true then
				cCURITEMLABEL:SetForeColor(GREY);
				cCURITEMICON:SetBackground(_IMAGES.HOURGLASS);
				cCURITEMICON:SetSize(32,32);
				cCURITEMICON:SetPosition(0,2);

				local _END = GetEndTime(_CHARDATA[MYCHAR:GetName()][SELECTEDFESTIVAL]["COOLDOWNS"][v[SETTINGS.LANGUAGE]]);
				local _CURDATE = Turbine.Engine.GetDate();

				local ENDMINUTE = tostring(_END.MINUTE);
				if string.len(ENDMINUTE) == 1 then ENDMINUTE = "0" .. ENDMINUTE end;

				if _CURDATE.Day == _END.DAY then
					sEND = _END.HOUR .. ":" .. ENDMINUTE;
				else
					sEND = _END.MONTH .. "/" .. _END.DAY .. " - " .. _END.HOUR .. ":" .. ENDMINUTE;
				end

				cCURITEMLABEL:SetToolTip(_LANG.OTHER.RESETS[SETTINGS.LANGUAGE] .. ": " .. sEND);

			else
				_CHARDATA[MYCHAR:GetName()][SELECTEDFESTIVAL]["COOLDOWNS"][v[SETTINGS.LANGUAGE]] = 0;
				cCURITEMLABEL:SetForeColor(YELLOW);
				cCURITEMICON:SetBackground(_IMAGES.GREENTICK);
				cCURITEMICON:SetSize(25,22);
				cCURITEMICON:SetPosition(3,8);
			end
		end

		-- Add item to ListBox
		cDebuffHolder:AddItem(cCURITEM);

	end

end


function RefreshTokenView()

	cTokenHolder:ClearItems();

	local ITEMWIDTH = 40;
	local PARENTWIDTH = 0;


	for k,v in pairs (_LANG.TOKENS[SELECTEDFESTIVAL]) do

		-- This will check each of the tokens for the selected festival to see if they exist in the wallet.
		local TOKENINDEX,ITEM = GetTokenIndex(v);

		if TOKENINDEX ~= nil and TOKENINDEX ~= 0 then
			-- Exists in wallet.
			local TEMPITEM = MYWALLET:GetItem(TOKENINDEX);

			local cCURITEM = Turbine.UI.Control();
			cCURITEM:SetSize(ITEMWIDTH,36);

			local cItemInspect = Turbine.UI.Lotro.ItemInfoControl();
			cItemInspect:SetParent(cCURITEM);
			cItemInspect:SetSize(36,36);
			cItemInspect:SetPosition(0,0);
			cItemInspect:SetItemInfo(ITEM:GetItemInfo());
			cItemInspect:SetQuantity(TEMPITEM:GetQuantity());

			_CHARDATA[MYCHAR:GetName()][SELECTEDFESTIVAL]["TOKENS"][k] = TEMPITEM:GetQuantity();

			PARENTWIDTH = PARENTWIDTH + ITEMWIDTH;

			cTokenHolder:AddItem(cCURITEM);

			if PARENTWIDTH > (wMainWinHolder:GetWidth()-20) then
				cTokenHolder:SetWidth(wMainWinHolder:GetWidth()-20);
				cTokenHolder:SetLeft(10);
			else
				cTokenHolder:SetWidth(PARENTWIDTH);
				cTokenHolder:SetLeft(wMainWinHolder:GetWidth()-PARENTWIDTH-10);
			end

			MYWALLET:GetItem(TOKENINDEX).QuantityChanged = function (sender,args)
				-- Quantity changed event
				cItemInspect:SetQuantity(TEMPITEM:GetQuantity());
				_CHARDATA[MYCHAR:GetName()][SELECTEDFESTIVAL]["TOKENS"][k] = TEMPITEM:GetQuantity();
			end
		else
			_CHARDATA[MYCHAR:GetName()][SELECTEDFESTIVAL]["TOKENS"][k] = 0;
		end

	end

end



function GetTokenIndex(itemID)

	if itemID == nil then return end;

	local TOKENINDEX = 0;

	local item = GetItemFromID(itemID);
	local itemName = item:GetItemInfo():GetName();

	for i=1, MYWALLET:GetSize() do
		if MYWALLET:GetItem(i):GetName() == itemName then
			TOKENINDEX = i;
			break;
		end
	end

	return TOKENINDEX,item;

end


-- This function creates a window displaying the list of quickslots
function CreateQuickSlotAssit(QSLIST)

	if QSLIST == nil then return end;

	local QSSIZE = 36;
	local QSHEIGHT = 36;

	local QSGAP = 10;
	local QSTOP = 20;
	local QSLEFT = 10;

	local tempHeight = 30+QSHEIGHT;
	local tempWidth = 0;

	wQSAssistParent = Turbine.UI.Window();
	wQSAssistParent:SetPosition(SETTINGS.QSWIN.X,SETTINGS.QSWIN.Y);
	wQSAssistParent:SetVisible(true);

	SETTINGS.QSWIN.VISIBLE = true;

	local blDRAGGING = false;
	local relX = 0;
	local relY = 0;

	wQSReposBar = Turbine.UI.Control();
	wQSReposBar:SetParent(wQSAssistParent);
	wQSReposBar:SetSize(tempWidth-20,QSTOP-3);
	wQSReposBar:SetMouseVisible(true);


	wQSReposBar.MouseEnter = function (sender,args)
		cReposCursor:SetPosition(Turbine.UI.Display.GetMouseX()-16,Turbine.UI.Display.GetMouseY()-16);
		cReposCursor:SetVisible(true);
	end

	wQSReposBar.MouseLeave = function (sender,args)
		cReposCursor:SetVisible(false);
	end

	wQSReposBar.MouseDown = function (sender, args)
		blDRAGGING = true;
		relX = args.X;
		relY = args.Y;
	end

	wQSReposBar.MouseUp = function (sender, args)
		blDRAGGING = false;
	end

	wQSReposBar.MouseMove = function (sender, args)

		local scX = Turbine.UI.Display.GetMouseX();
		local scY = Turbine.UI.Display.GetMouseY();

		if blDRAGGING == true then

			SETTINGS.QSWIN.X = scX - relX;
			SETTINGS.QSWIN.Y = scY - relY;

			wQSAssistParent:SetPosition(SETTINGS.QSWIN.X,SETTINGS.QSWIN.Y);
			Onscreen(wQSAssistParent);
		end

		cReposCursor:SetPosition(scX-16,scY-16);
	end

	local wEmoteBack = Turbine.UI.Control();
	wEmoteBack:SetParent(wQSAssistParent);
	wEmoteBack:SetBackColor(Turbine.UI.Color(0.9,0,0,0));
	wEmoteBack:SetMouseVisible(false);


	local cCloseIcon = Turbine.UI.Control();
	cCloseIcon:SetParent(wQSAssistParent);
	cCloseIcon:SetSize(16,16);
	cCloseIcon:SetPosition(tempWidth-16,1);
	cCloseIcon:SetBackground(_IMAGES.CLOSE_NORMAL);

	cCloseIcon.MouseEnter = function ()
		cCloseIcon:SetBackground(_IMAGES.CLOSE_OVER);
	end

	cCloseIcon.MouseLeave = function ()
		cCloseIcon:SetBackground(_IMAGES.CLOSE_NORMAL);
	end

	cCloseIcon.MouseClick = function ()
		wQSAssistParent:Close();
	end

	--[[
			{
			[1] = {["TYPE"]="Item";["NAME"]="Piece of Frostbluff Rotten Fruit";};
			[2] = {["TYPE"]="Item";["NAME"]="Bag of Frostbluff Flower Petals";};
			};
	--]]

	-- Loop
	for k,v in pairs (QSLIST) do

		local QSTYPE = v.TYPE;
		local QSNAME = v.NAME;

		if QSTYPE == "Item" then

			local icAssist = Turbine.UI.Lotro.ItemControl();
			icAssist:SetParent(wQSAssistParent);
			icAssist:SetSize(QSSIZE,QSHEIGHT);
			icAssist:SetPosition(QSLEFT,QSTOP);
			icAssist:SetZOrder(1);
			icAssist:SetAllowDrop(false);
			icAssist:SetVisible(true);
			icAssist:SetItem(GetInvItem(icAssist,QSNAME));

		else

			local qsAssist = Turbine.UI.Lotro.Quickslot();
			qsAssist:SetParent(wQSAssistParent);
			qsAssist:SetSize(QSSIZE,QSHEIGHT);
			qsAssist:SetPosition(QSLEFT,QSTOP);
			qsAssist:SetZOrder(1);
			qsAssist:SetAllowDrop(false);
			qsAssist:SetVisible(true);

			--qsAssist:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType[QSTYPE], v));

		end

		QSLEFT = QSLEFT + QSSIZE + QSGAP;
		tempWidth = QSLEFT;

	end


	wQSAssistParent:SetSize(tempWidth,tempHeight-5);
	wQSReposBar:SetSize(tempWidth-20,QSTOP-3);
	cCloseIcon:SetPosition(tempWidth-16,1);
	wEmoteBack:SetSize(tempWidth-10,tempHeight-10);
	wEmoteBack:SetPosition(5,10);

	-- Window events
	wQSAssistParent.Closed = function (sender,args)

		SETTINGS.QSWIN.VISIBLE = false;

		DestroyControl(wQSAssistParent);

		-- Remove items from _ITEMCONTROLS table
		_ITEMCONTROLS = {};

	end

end


-- This function takes an item name and searches for it within the player's backpack. If it's found it returns the item.
function GetInvItem(SENDER,ITEMNAME)

	if type(ITEMNAME) ~= "string" or SENDER == nil then return nil end;

	local FOUNDITEM = "";

	for i=1, MYBACKPACK:GetSize() do

		local CURITEM = MYBACKPACK:GetItem(i);

		if CURITEM ~= nil and CURITEM:GetName() == ITEMNAME then
			FOUNDITEM = MYBACKPACK:GetItem(i);
			break;
		end

	end

	-- Add to itemcontrol table to be recalled later if needed
	_ITEMCONTROLS[ITEMNAME] = SENDER;

	return FOUNDITEM;

end


function CreateEmotesAssist(EMOTELIST)

	if EMOTELIST == nil then return end;

	-- This function creates a window displaying a list of emote quickslots for the user

	local QSSIZE = 90;
	local QSHEIGHT = 25;

	local QSGAP = 10;
	local QSTOP = 20;

	local numQS = 0;
	local tempHeight = 0;
	local tempWidth = 20+QSSIZE;

	wEmoteAssistParent = Turbine.UI.Window();
	wEmoteAssistParent:SetPosition(SETTINGS.EMOTEWIN.X,SETTINGS.EMOTEWIN.Y);
	wEmoteAssistParent:SetVisible(true);

	SETTINGS.EMOTEWIN.VISIBLE = true;

	local blDRAGGING = false;
	local relX = 0;
	local relY = 0;

	wEmoteReposBar = Turbine.UI.Control();
	wEmoteReposBar:SetParent(wEmoteAssistParent);
	wEmoteReposBar:SetSize(tempWidth-20,QSTOP-3);
	wEmoteReposBar:SetMouseVisible(true);


	wEmoteReposBar.MouseEnter = function (sender,args)
		cReposCursor:SetPosition(Turbine.UI.Display.GetMouseX()-16,Turbine.UI.Display.GetMouseY()-16);
		cReposCursor:SetVisible(true);
	end

	wEmoteReposBar.MouseLeave = function (sender,args)
		cReposCursor:SetVisible(false);
	end

	wEmoteReposBar.MouseDown = function (sender, args)
		blDRAGGING = true;
		relX = args.X;
		relY = args.Y;
	end

	wEmoteReposBar.MouseUp = function (sender, args)
		blDRAGGING = false;
	end

	wEmoteReposBar.MouseMove = function (sender, args)

		local scX = Turbine.UI.Display.GetMouseX();
		local scY = Turbine.UI.Display.GetMouseY();

		if blDRAGGING == true then

			SETTINGS.EMOTEWIN.X = scX - relX;
			SETTINGS.EMOTEWIN.Y = scY - relY;

			wEmoteAssistParent:SetPosition(SETTINGS.EMOTEWIN.X,SETTINGS.EMOTEWIN.Y);
			Onscreen(wEmoteAssistParent);
		end

		cReposCursor:SetPosition(scX-16,scY-16);
	end

	local wEmoteBack = Turbine.UI.Control();
	wEmoteBack:SetParent(wEmoteAssistParent);
	wEmoteBack:SetBackColor(Turbine.UI.Color(0.9,0,0,0));
	wEmoteBack:SetMouseVisible(false);


	local cCloseIcon = Turbine.UI.Control();
	cCloseIcon:SetParent(wEmoteAssistParent);
	cCloseIcon:SetSize(16,16);
	cCloseIcon:SetPosition(tempWidth-16,1);
	cCloseIcon:SetBackground(_IMAGES.CLOSE_NORMAL);

	cCloseIcon.MouseEnter = function ()
		cCloseIcon:SetBackground(_IMAGES.CLOSE_OVER);
	end

	cCloseIcon.MouseLeave = function ()
		cCloseIcon:SetBackground(_IMAGES.CLOSE_NORMAL);
	end

	cCloseIcon.MouseClick = function ()
		wEmoteAssistParent:Close();
	end


	for k,v in pairs (EMOTELIST) do

		numQS = numQS + 1;

		local qsEmote = Turbine.UI.Lotro.Quickslot();
		qsEmote:SetParent(wEmoteAssistParent);
		qsEmote:SetSize(QSSIZE,QSHEIGHT);
		qsEmote:SetPosition(10,QSTOP);
		qsEmote:SetZOrder(1);
		qsEmote:SetAllowDrop(false);
		qsEmote:SetVisible(true);

		local qsLabel = Turbine.UI.Label();
		qsLabel:SetParent(wEmoteAssistParent);
		qsLabel:SetSize(qsEmote:GetSize());
		qsLabel:SetPosition(qsEmote:GetPosition());
		qsLabel:SetMouseVisible(false);
		qsLabel:SetBackColor(Turbine.UI.Color(0.1,0.15,0.3));
		qsLabel:SetFont(Turbine.UI.Lotro.Font.Verdana12);
		qsLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
		qsLabel:SetText(v);
		qsLabel:SetZOrder(1000);

		qsEmote.MouseEnter = function ()
			qsLabel:SetBackColor(Turbine.UI.Color(0.2,0.25,0.4));
			qsLabel:SetForeColor(YELLOW);
		end

		qsEmote.MouseLeave = function ()
			qsLabel:SetBackColor(Turbine.UI.Color(0.1,0.15,0.3));
			qsLabel:SetForeColor(WHITE);
		end

		qsEmote:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, v));

		QSTOP = QSTOP + QSHEIGHT + QSGAP;
		tempHeight = QSTOP;

	end

	wEmoteAssistParent:SetSize(tempWidth,tempHeight-5);
	wEmoteBack:SetSize(tempWidth-10,tempHeight-10);
	wEmoteBack:SetPosition(5,10);


	-- Window events
	wEmoteAssistParent.Closed = function (sender,args)
		SETTINGS.EMOTEWIN.VISIBLE = false;
		DestroyControl(wEmoteAssistParent);
	end
end


