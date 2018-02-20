--[[
Alerts v1.0 by Galuhad

	This class creates an alert window - a short message displayed
	in the centre of the screen to inform the user of something.

	Usage: local tempMsg = Alert("MESSAGE STRING");
--]]

Alert = {};
_mtAlert = {};

function Alert.Constructor( SENDER, MESSAGE, DURATION )
	if DURATION == nil then DURATION = 2.5 end;
	local MessageWindow = Turbine.UI.Window();
		MessageWindow:SetSize( Turbine.UI.Display.GetWidth() - 500, 100 );
		MessageWindow:SetPosition( ( Turbine.UI.Display.GetWidth() / 2 ) - ( MessageWindow:GetWidth() / 2 ), ( Turbine.UI.Display.GetHeight() / 3 ) - ( MessageWindow:GetHeight() / 2 ) );
		MessageWindow:SetMouseVisible( false );
		MessageWindow:SetVisible( true );
	local MessageLabel = Turbine.UI.Label();
		MessageLabel:SetParent( MessageWindow );
		MessageLabel:SetSize( MessageWindow:GetSize() );
		MessageLabel:SetPosition( 0, 0 );
		MessageLabel:SetTextAlignment(  Turbine.UI.ContentAlignment.MiddleCenter);
		MessageLabel:SetFont( Turbine.UI.Lotro.Font.TrajanProBold24 );
		MessageLabel:SetForeColor( Turbine.UI.Color.OrangeRed );
		MessageLabel:SetOutlineColor( Turbine.UI.Color( 0.1, 0.1, 0.1 ) );
		MessageLabel:SetFontStyle( Turbine.UI.FontStyle.Outline );
		MessageLabel:SetMarkupEnabled( true );
		MessageLabel:SetMultiline( true );
		MessageLabel:SetMouseVisible( false );
		MessageLabel:SetText( MESSAGE );

	-- This function animates the main windows fade out when mouse leaves.
	local function AnimateAlert( CONTROL, STARTX, FINISHX, STARTY, FINISHY, STARTOPACITY, FINISHOPACITY, DURATION ) -- DURATION in SECONDS.
		if CONTROL == nil then return end;
		local startGameTime = Turbine.Engine.GetGameTime();
		local endGameTime = startGameTime + DURATION;
		local PERCENTBEFOREFADE = 0.8;
		AnimateControl = Turbine.UI.Control();
			AnimateControl:SetSize( 1, 1 );
			AnimateControl:SetWantsUpdates( true );
			AnimateControl.Update = function ()
			local currentGameTime = Turbine.Engine.GetGameTime();
			PERCENTCOMPLETE = ( currentGameTime - startGameTime ) / DURATION;
			if PERCENTCOMPLETE > 1 then PERCENTCOMPLETE = 1 end;
			CONTROL:SetTop(STARTY + ( PERCENTCOMPLETE * ( FINISHY - STARTY ) ) );
			CONTROL:SetLeft(  STARTX + ( PERCENTCOMPLETE * ( FINISHX - STARTX ) ) );
			if PERCENTCOMPLETE < PERCENTBEFOREFADE then
				PERCENTCOMPLETE = 0;
			else
				PERCENTCOMPLETE = ( PERCENTCOMPLETE - PERCENTBEFOREFADE ) / ( 1 - PERCENTBEFOREFADE );
			end
			CONTROL:SetOpacity( STARTOPACITY + ( PERCENTCOMPLETE * ( FINISHOPACITY - STARTOPACITY)));
			if currentGameTime > endGameTime then
				AnimateControl:SetWantsUpdates( false );
				MessageLabel = nil;
				MessageWindow = nil;
			end
		end
	end
	AnimateAlert( MessageWindow, MessageWindow:GetLeft(), MessageWindow:GetLeft(), MessageWindow:GetTop(), MessageWindow:GetTop(), 1, 0, DURATION )
end

function _mtAlert.__call( ... )
    return Alert.Constructor( ... );
end
setmetatable( Alert, _mtAlert );