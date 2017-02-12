-- Turbine Imports..
import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

-- Localization
lang = Turbine.Engine.GetLanguage();
de = { };-- German
	de.title = "LotRO API Tabelle Dump";
	de.dumpTable = "Dump";
	de.clear = "Klar";
	de.load = "Loaded German text for "..de.title..".";-- If needed for debugging
en = { };-- English
	en.title = "LotRO API Table Dump";
	en.dumpTable = "Dump";
	en.clear = "Clear";
	en.load = "Loaded English text for "..en.title..".";-- If needed for debugging
fr = { };-- French
	fr.title = "LotRO API D\195\169p\195\180t de table";
	fr.dumpTable = "D\195\169verser";
	fr.clear = "Clair";
	fr.load = "Loaded French text for "..fr.title..".";-- If needed for debugging
langVal = { de, en, fr }-- German, English, French
langKey = { 268435460, 2, 268435459 };-- German, English, French
for i, v in ipairs( langKey ) do
	if lang == v then
		localizedText =  langVal[ i ];
		break;
	end
end

wParentWin = Turbine.UI.Lotro.Window();
wParentWin:SetSize( 500, 100 );
wParentWin:SetPosition(
	( ( Turbine.UI.Display.GetWidth() / 2 ) - ( wParentWin:GetWidth() / 2 ) ),
	( ( Turbine.UI.Display.GetHeight() / 3 ) - ( wParentWin:GetHeight() / 2 ) )
);
wParentWin:SetVisible( true );
wParentWin:SetText( localizedText.title );

txtEnter = Turbine.UI.TextBox();
txtEnter:SetParent( wParentWin );
txtEnter:SetSize( 350, 20 );
txtEnter:SetPosition( 20, 50 );
txtEnter:SetMultiline( false );
txtEnter:SetSelectable( true );
txtEnter:SetVisible( true );
txtEnter:SetBackColor( Turbine.UI.Color( 1, 1, 1 ) );
txtEnter:SetForeColor( Turbine.UI.Color( 0, 0, 0 ) );
txtEnter:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft );

btnDump = Turbine.UI.Lotro.Button();
btnDump:SetParent( wParentWin );
btnDump:SetSize( btnDump:GetTextLength() + 50, 20 );
btnDump:SetPosition( 380, 50 );
btnDump:SetVisible( true );
btnDump:SetText( localizedText.dumpTable );

btnDump.MouseClick = function ( sender, args )
	local dumpString = txtEnter:GetText();

	Turbine.Shell.WriteLine( "\n" .. dumpString );
	Turbine.Shell.WriteLine( dump( findKey( dumpString ) ) );
end

btnClear = Turbine.UI.Lotro.Button();
btnClear:SetParent( wParentWin );
btnClear:SetSize( btnClear:GetTextLength() + 50, 20 );
btnClear:SetPosition( btnDump:GetWidth() + btnDump:GetLeft(), 50 );
btnClear:SetVisible( true );
btnClear:SetText( localizedText.clear );

btnClear.MouseClick = function ( sender, args )
	local dumpString = txtEnter:SetText( "" );
end

function findKey( key )
	local dotCount = 0;
	local stringLen = string.len( key );

	for i = 1, stringLen, 1 do
		local curChar = string.sub( key, i, i )
		if curChar == "." then dotCount = dotCount + 1 end;
	end

	local numKeys = dotCount + 1;
	local keySegs = {};
	local newDotLocation = 0;
	local oldDotLocation = 0;

	for i=1, numKeys, 1 do
		if numKeys > 1 then
			newDotLocation = string.find( key, "%.", oldDotLocation + 1 );

			if newDotLocation == nil then
				keySegs[ i ] = string.sub( key, oldDotLocation + 1, stringLen );
			else
				keySegs[ i ] = string.sub( key, oldDotLocation + 1, newDotLocation - 1 );
			end

			oldDotLocation = newDotLocation;
		else
			keySegs[ 1 ] = key;
		end
	end

	local t = {};
	t = Turbine;

	if numKeys > 1 then
		for i=  2, numKeys, 1 do
			for k,v in pairs( t ) do
				if k == keySegs[ i ] then
					t = v;
				end;
			end
		end
	end
	
	return t;
end

function dump( o )
    if type( o ) == 'table' then
        local s = '{\n'
        for k,v in pairs( o ) do
                if type( k ) ~= 'number' then k = '"'..k..'"' end
                s = s .. '['..k..'] = ' .. dump( v ) .. '\n'
        end
        return s .. '}\n'
    else
        return tostring( o )
    end
end

Turbine.Shell.WriteLine( localizedText.load );