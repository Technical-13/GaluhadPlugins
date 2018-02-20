

function RegisterCommands()

	---------------------------------------------------------------------------------------------

	-- COMMAND TO DISPLAY / HIDE THE MAIN WINDOW.
	cmdMainWin = Turbine.ShellCommand();

	function cmdMainWin:Execute( command, arguments )

		if wMainWinParent:IsVisible() == false then
			wMainWinParent:SetVisible(true);
			SETTINGS.MAINWIN.VISIBLE = true;

			if wEmoteAssistParent ~= nil then wEmoteAssistParent:SetVisible(SETTINGS.EMOTEWIN.VISIBLE) end;
			if wQSAssistParent ~= nil then wQSAssistParent:SetVisible(SETTINGS.QSWIN.VISIBLE) end;

		else
			wMainWinParent:SetVisible(false);

			if wEmoteAssistParent ~= nil then wEmoteAssistParent:SetVisible(false) end;
			if wQSAssistParent ~= nil then wQSAssistParent:SetVisible(false) end;

			SETTINGS.MAINWIN.VISIBLE = false;
		end
	end

	function cmdMainWin:GetHelp()
		return "Festival Buddy: Shows/hides the main window.";
	end

	function cmdMainWin:GetShortHelp()
		return "Festival Buddy: Shows/hides the main window.";
	end

	Turbine.Shell.AddCommand( "festival", cmdMainWin);

	---------------------------------------------------------------------------------------------


end





