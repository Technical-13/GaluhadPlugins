
----------------------------------------------------------------------------------------------------------------------
--
--	MESSAGEBOX V1.0 BY GALUHAD
--
-- This class creates a LOTRO style message box.
-- It has two parameters, Message and Button.
-- Message is the message string you would like to display.
-- Button is the style of button(s) you would like..

-- Button options:
--		MBOK 		-- OK only (default if no option entered)
--		MBCANCEL 	-- Cancel only
--		MBYESNO 	-- Yes / No Buttons

-- The function returns the button pressed; either:
--		MBOK		-- OK button pressed
--		MBCANCEL	-- Cancel button pressed
--		MBYES		-- Yes button pressed
--		MBNO		-- No button pressed

-- You can use these values in your logic to determine how to process the players response.
-- E.G

-- tempMsg = MessageBox.Create("Are you sure?","MBYESNO");
-- tempMsg.Prompt = function () -- Event executed when a button is pressed.
-- 		if tempMsg:GetResponse() == "MBYES" then -- Tells you which button.
--			<do something here>
--		end
--	end

MSGBOXBACKIMAGE = RESOURCEDIR.."MessageBox.tga"; -- location where you stored the background image in your plugin.

-----------------------------------------------------------------------------------------------------------------------

MBOK = "MBOK";
MBCANCEL = "MBCANCEL";
MBYESNO = "MBYESNO";

MessageBox = {};

function MessageBox.Create(MESSAGE,BUTTON)

	local List = {};

	local BUTTONPRESSED = "";
	local BUTTONWIDTH = 80;
	local BUTTONTOP = 130;
	local MBinterval = 0;
	local MBTIME = Turbine.Engine.GetLocalTime();
	local MBCURTIME = Turbine.Engine.GetLocalTime();
	local YELLOW = Turbine.UI.Color((210/255),1,0);

	local ScreenBlock = Turbine.UI.Window();
	ScreenBlock:SetSize(Turbine.UI.Display.GetSize());
	ScreenBlock:SetMouseVisible(true);
	ScreenBlock:SetVisible(true);

	local MessageWindow = Turbine.UI.Window();
	MessageWindow:SetParent(ScreenBlock);
	MessageWindow:SetSize(510,170);
	MessageWindow:SetPosition((ScreenBlock:GetWidth()/2)-255,(ScreenBlock:GetHeight()/2)-85);
	MessageWindow:SetBackground(MSGBOXBACKIMAGE);
	MessageWindow:SetBlendMode(4);
	MessageWindow:SetVisible(true);
	MessageWindow:Activate();

	local MessageLabel = Turbine.UI.Label();
	MessageLabel:SetParent(MessageWindow);
	MessageLabel:SetPosition(20,20);
	MessageLabel:SetSize(470,100);
	MessageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	MessageLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro16);
	MessageLabel:SetForeColor(YELLOW);
	MessageLabel:SetMultiline(true);
	MessageLabel:SetText(MESSAGE);

	if BUTTON == MBOK then

		local btnOK = Turbine.UI.Lotro.Button();
		btnOK:SetParent(MessageWindow);
		btnOK:SetPosition(255-(BUTTONWIDTH/2),BUTTONTOP);
		btnOK:SetWidth(BUTTONWIDTH);
		btnOK:SetText("OK");

		btnOK.Click = function (sender, args)
			BUTTONPRESSED = "MBOK";

			-- External event listener
			function GetResponse()

				List:Prompt();
				return BUTTONPRESSED;

			end

			if pcall(GetResponse) == true then
				-- External listener function exists, so execute the code.
				--ItemChangedListener(); -- may not be needed, check if statements are executed twice.
			end

			ScreenBlock:Close();
		end


	elseif BUTTON == MBCANCEL then

		local btnCancel = Turbine.UI.Lotro.Button();
		btnCancel:SetParent(MessageWindow);
		btnCancel:SetPosition(255-(BUTTONWIDTH/2),BUTTONTOP);
		btnCancel:SetWidth(BUTTONWIDTH);
		btnCancel:SetText("Cancel");

		btnCancel.Click = function (sender, args)
			BUTTONPRESSED = "MBCANCEL";

			-- External event listener
			function GetResponse()

				List:Prompt();
				return BUTTONPRESSED;

			end

			if pcall(GetResponse) == true then
				-- External listener function exists, so execute the code.
				--ItemChangedListener(); -- may not be needed, check if statements are executed twice.
			end

			ScreenBlock:Close();
		end

	elseif BUTTON == MBYESNO then

		local btnYes = Turbine.UI.Lotro.Button();
		btnYes:SetParent(MessageWindow);
		btnYes:SetPosition(255-BUTTONWIDTH-10,BUTTONTOP);
		btnYes:SetWidth(BUTTONWIDTH);
		btnYes:SetText("Yes");

		local btnNo = Turbine.UI.Lotro.Button();
		btnNo:SetParent(MessageWindow);
		btnNo:SetPosition(265,BUTTONTOP);
		btnNo:SetWidth(BUTTONWIDTH);
		btnNo:SetText("No");

		btnNo.Click = function (sender, args)
			BUTTONPRESSED = "MBNO";

			-- External event listener
			function GetResponse()

				List:Prompt();
				return BUTTONPRESSED;

			end

			if pcall(GetResponse) == true then
				-- External listener function exists, so execute the code.
				--ItemChangedListener(); -- may not be needed, check if statements are executed twice.
			end

			ScreenBlock:Close();
		end

		btnYes.Click = function (sender, args)
			BUTTONPRESSED = "MBYES";

			-- External event listener
			function GetResponse()

				List:Prompt();
				return BUTTONPRESSED;

			end

			if pcall(GetResponse) == true then
				-- External listener function exists, so execute the code.
				--ItemChangedListener(); -- may not be needed, check if statements are executed twice.
			end

			ScreenBlock:Close();
		end

	else

		--No button entered so OK button only
		local btnOK = Turbine.UI.Lotro.Button();
		btnOK:SetParent(MessageWindow);
		btnOK:SetPosition(215,BUTTONTOP);
		btnOK:SetWidth(BUTTONWIDTH);
		btnOK:SetText("OK");

		btnOK.Click = function (sender, args)
			BUTTONPRESSED = "MBOK";

			-- External event listener
			function GetResponse()

				List:Prompt();
				return BUTTONPRESSED;

			end

			if pcall(GetResponse) == true then
				-- External listener function exists, so execute the code.
				--ItemChangedListener(); -- may not be needed, check if statements are executed twice.
			end

			ScreenBlock:Close();
		end

	end


	-- This part creates the metatable.
	MessageBox.__index = MessageBox;
	MessageBox.__newindex = MessageBox;

	setmetatable(List,MessageBox);

	List.GetResponse = function ()

		return BUTTONPRESSED;

	end

	return List;

end


