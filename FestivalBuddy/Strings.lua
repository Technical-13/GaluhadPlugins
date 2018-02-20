-- E.G -- wBListParent:SetText( _LANG.BListWindowTitle[ SETTINGS.LANGUAGE ] );
_LANG = {
-- [ "STRINGNAME" ] = 	{[ "ENGLISH" ] = "";	[ "FRENCH" ] = "";	[ "GERMAN" ] = "";	[ "RUSSIAN" ] = "";};
	[ "FESTIVALS" ] = {
		[ 1 ] = {[ "ENGLISH" ] = "Spring";			[ "FRENCH" ] = "Printemps";			[ "GERMAN" ] = "Spring";			[ "RUSSIAN" ] = "Spring";};
		[ 2 ] = {[ "ENGLISH" ] = "Summer";			[ "FRENCH" ] = "\195\137t\195\169";	[ "GERMAN" ] = "Summer";			[ "RUSSIAN" ] = "Summer";};
		[ 3 ] = {[ "ENGLISH" ] = "Harvestmath";		[ "FRENCH" ] = "Moissines";			[ "GERMAN" ] = "Harvestmath";		[ "RUSSIAN" ] = "Harvestmath";};
		[ 4 ] = {[ "ENGLISH" ] = "Yule";			[ "FRENCH" ] = "Yule";				[ "GERMAN" ] = "Yule";			[ "RUSSIAN" ] = "Yule";};
		[ 5 ] = {[ "ENGLISH" ] = "Anniversary";		[ "FRENCH" ] = "Anniversaire";		[ "GERMAN" ] = "Anniversary";		[ "RUSSIAN" ] = "Anniversary";};
		[ 6 ] = {[ "ENGLISH" ] = "Farmer's Faire";	[ "FRENCH" ] = "Foire des fermiers";	[ "GERMAN" ] = "Farmer's Faire";	[ "RUSSIAN" ] = "Farmers Faire";};
		[ 7 ] = {[ "ENGLISH" ] = "Treasure Hunt";	[ "FRENCH" ] = "Treasure Hunt";	[ "GERMAN" ] = "Treasure Hunt";	[ "RUSSIAN" ] = "Treasure Hunt";};
	};

	[ "OTHER" ] = {
		[ "BARTER" ] = 		{[ "ENGLISH" ] = "Barter";		[ "FRENCH" ] = "Troqueur";				[ "GERMAN" ] = "Barter";			[ "RUSSIAN" ] = "Barter";};
		[ "BARTERITEMS" ] = 	{[ "ENGLISH" ] = "Barter Items";	[ "FRENCH" ] = "Articles de troc";		[ "GERMAN" ] = "Barter Items";	[ "RUSSIAN" ] = "Barter Items";};
		[ "SORT" ] = 			{[ "ENGLISH" ] = "Sort";			[ "FRENCH" ] = "Trier";					[ "GERMAN" ] = "Sort";			[ "RUSSIAN" ] = "Sort";};
		[ "ALTS" ] = 			{[ "ENGLISH" ] = "Alts";			[ "FRENCH" ] = "Alts";					[ "GERMAN" ] = "Alts";			[ "RUSSIAN" ] = "Alts";};
		[ "RESETS" ] =		{[ "ENGLISH" ] = "Resets";		[ "FRENCH" ] = "Remettre \195\160 0";		[ "GERMAN" ] = "Resets";			[ "RUSSIAN" ] = "Resets";};

		[ "NOALTS" ] = 	{		[ "ENGLISH" ] = "No alt data to display. To access this you will need to load this plugin from each of your alts.";
								[ "FRENCH" ] = "Pas de donn\195\169es autres \195\160 afficher. Vous devez charger le plugin pour chacun de vos personnages pour cela.";
								[ "GERMAN" ] = "No alt data to display. To access this you will need to load this plugin from each of your alts.";
								[ "RUSSIAN" ] = "No alt data to display. To access this you will need to load this plugin from each of your alts.";};

		[ "EMOTETARGET" ] = { [ "ENGLISH" ] = ": Select this target before emoting.";
								[ "FRENCH" ] = ": Selectionez cette cible avant d'envoyer une \195\169mote.";
								[ "GERMAN" ] = ": Select this target before emoting.";
								[ "RUSSIAN" ] = ": Select this target before emoting.";};

		[ "YULESELAUDIENCE" ] = { [ "ENGLISH" ] = "Select <rgb=#00FFFF>'The Audience'</rgb> before emoting";
								[ "FRENCH" ] = "Selectionnez <rgb=#00FFFF>'Le Public'</rgb> avant d'envoyer une \195\169mote";
								[ "GERMAN" ] = "Select <rgb=#00FFFF>'The Audience'</rgb> before emoting";
								[ "RUSSIAN" ] = "Select <rgb=#00FFFF>'The Audience'</rgb> before emoting";};

		[ "TIMETOPERFORM" ] = { [ "ENGLISH" ] = "It's your turn to perform";
								[ "FRENCH" ] = "C'est \195\160 vous !";
								[ "GERMAN" ] = "It's your turn to perform";
								[ "RUSSIAN" ] = "It's your turn to perform";};

		[ "COMMAND" ] = { [ "ENGLISH" ] = "Use command /festival to re-open the main window";
								[ "FRENCH" ] = "Utilisez la commande /festival pour r\195\169-ouvrir la fen\195\170tre";
								[ "GERMAN" ] = "Use command /festival to re-open the main window";
								[ "RUSSIAN" ] = "Use command /festival to re-open the main window";};

		-- These must match the names given in-game
		[ "AUDIENCE" ] = { [ "ENGLISH" ] = "The Audience"; [ "FRENCH" ] = "Le Public"; [ "GERMAN" ] = "The Audience"; [ "RUSSIAN" ] = "The Audience";}; -- Yule Frostbluff Theatre
		[ "NPC_FIREWORKANNOUNCER" ] = { [ "ENGLISH" ] = "Fireworks Announcer"; [ "FRENCH" ] = "Animateur du feu d'artifice";	[ "GERMAN" ] = "Fireworks Announcer";	[ "RUSSIAN" ] = "Fireworks Announcer";}; -- Anniversary Fireworks in Bree
	};


	[ "DANCES" ] = {
		[ "DANCE1" ] = { [ "ENGLISH" ] = "Look at me and dance step one"; [ "FRENCH" ] = "Regardez-moi et ex\195\169cutez le premier pas !"; [ "GERMAN" ] = "Look at me and dance step one"; [ "RUSSIAN" ] = "Look at me and dance step one";};
		[ "DANCE2" ] = { [ "ENGLISH" ] = "Now follow me in doing the second dance"; [ "FRENCH" ] = "Suivez-moi \195\160 pr\195\169sent pour la deuxi\195\168me danse."; [ "GERMAN" ] = "Now follow me in doing the second dance"; [ "RUSSIAN" ] = "Now follow me in doing the second dance";};
		[ "DANCE3" ] = { [ "ENGLISH" ] = "Dance three is the step here"; [ "FRENCH" ] = "Voici le pas de la troisi\195\168me danse."; [ "GERMAN" ] = "Dance three is the step here"; [ "RUSSIAN" ] = "Dance three is the step here";};
	};

	[ "DEBUFFS" ] = {	-- Must match the names given in-game
		[ 1 ] = {};
		[ 2 ] = {};
		[ 3 ] = {
			[ "SCROLLSEARCHING" ] = {[ "ENGLISH" ] = "Scroll Searching"; [ "FRENCH" ] = "P\195\170che aux parchemins"; [ "GERMAN" ] = "Scroll Searching"; [ "RUSSIAN" ] = "Scroll Searching";};
			[ "GEODEHUNTING" ] = {[ "ENGLISH" ] = "Geode Hunting"; [ "FRENCH" ] = "A la p\195\170che aux g\195\169odes"; [ "GERMAN" ] = "Geode Hunting"; [ "RUSSIAN" ] = "Geode Hunting";};
			[ "PUMPKINPICKING" ] = {[ "ENGLISH" ] = "Pumpkin Picking"; [ "FRENCH" ] = "La chasse aux citrouilles"; [ "GERMAN" ] = "Pumpkin Picking"; [ "RUSSIAN" ] = "Pumpkin Picking";};
			[ "APPLEBOBBING" ] = {[ "ENGLISH" ] = "Apple Bobbing"; [ "FRENCH" ] = "P\195\170che aux pommes"; [ "GERMAN" ] = "Apple Bobbing"; [ "RUSSIAN" ] = "Apple Bobbing";};
			[ "SECRETREASURECHEST" ] = {[ "ENGLISH" ] = "Secret Treasure - Chest"; [ "FRENCH" ] = "Tr\195\169sor secret : Coffre"; [ "GERMAN" ] = "Secret Treasure - Chest"; [ "RUSSIAN" ] = "Secret Treasure - Chest";};
			[ "THSTRONGBOX" ] = {[ "ENGLISH" ] = "Treasure Hunting - Strongbox"; [ "FRENCH" ] = "Chasse au tr\195\169sor : Cassette"; [ "GERMAN" ] = "Treasure Hunting - Strongbox"; [ "RUSSIAN" ] = "Treasure Hunting - Strongbox";};
			[ "THLOCKBOX" ] = {[ "ENGLISH" ] = "Treasure Hunting - Lockbox"; [ "FRENCH" ] = "Chasse au tr\195\169sor : Cassette"; [ "GERMAN" ] = "Treasure Hunting - Lockbox"; [ "RUSSIAN" ] = "Treasure Hunting - Lockbox";};
			[ "THCHEST" ] = {[ "ENGLISH" ] = "Treasure Hunting - Chest"; [ "FRENCH" ] = "Chasse au tr\195\169sor : Coffre"; [ "GERMAN" ] = "Treasure Hunting - Chest"; [ "RUSSIAN" ] = "Treasure Hunting - Chest";};
		};
		[ 4 ] = {
			[ "VILLAIN" ] = {[ "ENGLISH" ] = "Villain"; [ "FRENCH" ] = "M\195\169chant"; [ "GERMAN" ] = "Villain"; [ "RUSSIAN" ] = "Villain";};
			[ "EXTRA" ] = {[ "ENGLISH" ] = "Extra"; [ "FRENCH" ] = "Figurant"; [ "GERMAN" ] = "Extra"; [ "RUSSIAN" ] = "Extra";};
			[ "PROTAGONIST" ] = {[ "ENGLISH" ] = "Protagonist"; [ "FRENCH" ] = "Protagoniste"; [ "GERMAN" ] = "Protagonist"; [ "RUSSIAN" ] = "Protagonist";};
			[ "THEATRE" ] = {[ "ENGLISH" ] = "Frostbluff Theatre"; [ "FRENCH" ] = "Th\195\169\195\162tre de Rivegel"; [ "GERMAN" ] = "Frostbluff Theatre"; [ "RUSSIAN" ] = "Frostbluff Theatre";};
		};
		[ 5 ] = {};
		[ 6 ] = {};
		[ 7 ] = { -- Is there an effect for these or do I have to calculate 15 minutes ( 900 seconds ) from the completion notice
			--"<rgb=#00FFFF>A new round has begun</rgb>"
			[ "TREASURECAMP" ] = { [ "ENGLISH" ] = "Treasure Camp"; [ "FRENCH" ] = "Treasure Camp";[ "GERMAN" ] = "Treasure Camp"; [ "RUSSIAN" ] = "Treasure Camp";};
			--[ "COMPLETEDQUEST" ] .. " Treasure Hunt"
			[ "TREASUREHUNT" ] = { [ "ENGLISH" ] = "Treasure Hunt"; [ "FRENCH" ] = "Treasure Hunt";[ "GERMAN" ] = "Treasure Hunt"; [ "RUSSIAN" ] = "Treasure Hunt";};
			--[ "COMPLETEDQUEST" ] .. " Berries"
			[ "BERRIES" ] = { [ "ENGLISH" ] = "Berries"; [ "FRENCH" ] = "Berries";[ "GERMAN" ] = "Berries"; [ "RUSSIAN" ] = "Berries";};
		};
	};

	[ "QUESTS" ] = {	-- Must match the quest names given in-game
		-- General
		[ "ELFDANCEQUEST" ] = 	{[ "ENGLISH" ] = "Dances with Elves";			[ "FRENCH" ] = "Danse avec les Elfes";		[ "GERMAN" ] = "Dances with Elves";		[ "RUSSIAN" ] = "Dances with Elves";};
		[ "DWARFDANCEQUEST" ] = 	{[ "ENGLISH" ] = "Dances with Dwarves";		[ "FRENCH" ] = "Danse avec les Nains";		[ "GERMAN" ] = "Dances with Dwarves";		[ "RUSSIAN" ] = "Dances with Dwarves";};
		[ "HOBBITDANCEQUEST" ] = 	{[ "ENGLISH" ] = "Dances with Hobbits";		[ "FRENCH" ] = "Danse avec les Hobbits";		[ "GERMAN" ] = "Dances with Hobbits";		[ "RUSSIAN" ] = "Dances with Hobbits";};
		[ "MENDANCEQUEST" ] = 	{[ "ENGLISH" ] = "Dances with Men";			[ "FRENCH" ] = "Danse avec les Hommes";		[ "GERMAN" ] = "Dances with Men";			[ "RUSSIAN" ] = "Dances with Men";};

		[ "START" ] = { 	-- Must match the text given in-game
			[ "ENGLISH" ] =	"The dance will begin now! Come, shall we dance"; -- Say channel
			[ "FRENCH" ] =	"La danse va commencer. Suivez les pas demand\195\169s !";
			[ "GERMAN" ] = 	"The dance will begin now! Come, shall we dance";
			[ "RUSSIAN" ] =	"The dance will begin now! Come, shall we dance";
		};

		[ "END" ] = { -- Must match the text given in-game
			[ "ENGLISH" ] = 	"Great job! Wonderful! You have all been part of the festival-dance! We will dance again in 20 minutes"; -- Say channel
			[ "FRENCH" ] = 	"Tr\195\168s bien ! Formidable ! Vous avez tous particip\195\169 \195\160 la danse du festival ! Nous recommencerons dans 20 minutes.";
			[ "GERMAN" ] = 	"Great job! Wonderful! You have all been part of the festival-dance! We will dance again in 20 minutes";
			[ "RUSSIAN" ] = 	"Great job! Wonderful! You have all been part of the festival-dance! We will dance again in 20 minutes";
		};

		-- Must match the text given in-game
		[ "NEWQUEST" ] = 			{[ "ENGLISH" ] = "New Quest:";	[ "FRENCH" ] = "Nouvelle qu\195\170te :";	[ "GERMAN" ] = "New Quest:";	[ "RUSSIAN" ] = "New Quest:";};
		[ "COMPLETEDQUEST" ] = 	{[ "ENGLISH" ] = "Completed:";	[ "FRENCH" ] = "Termin\195\169";	[ "GERMAN" ] = "Completed:";	[ "RUSSIAN" ] = "Completed:";};

		-- Season specific -- Must match the text given in-game
		[ 1 ] = { -- Spring
			[ "SHREWLEISURELY" ] ={[ "ENGLISH" ] = "Stomp-a-Shrew for the Leisurely Gardener";	[ "FRENCH" ] = "Ecrase-musaraignes pour jardinier amateur";			[ "GERMAN" ] = "Stomp-a-Shrew for the Leisurely Gardener";			[ "RUSSIAN" ] = "Stomp-a-Shrew for the Leisurely Gardener";};
			[ "SHREWPRACTICED" ] ={[ "ENGLISH" ] = "Stomp-a-Shrew for the Practised Gardener";	[ "FRENCH" ] = "Ecrase-musaraignes pour jardinier confirm\195\169";	[ "GERMAN" ] = "Stomp-a-Shrew for the Practised Gardener";			[ "RUSSIAN" ] = "Stomp-a-Shrew for the Practised Gardener";};
			[ "SHREWELITE" ] =	{[ "ENGLISH" ] = "The Stomp-a-Shrew Challenge";				[ "FRENCH" ] = "Le d\195\169fi de l'\195\169crase-musaraigne";		[ "GERMAN" ] = "The Stomp-a-Shrew Challenge";							[ "RUSSIAN" ] = "The Stomp-a-Shrew Challenge";};
			[ "SHREWENORMOUS" ] =	{[ "ENGLISH" ] = "Stomp-a-Shrew -- An Enormous Shrew";		[ "FRENCH" ] = "Ecrase-musaraignes -- Une musaraigne gigantesque";	[ "GERMAN" ] = "Stomp-a-Shrew -- An Enormous Shrew";					[ "RUSSIAN" ] = "Stomp-a-Shrew -- An Enormous Shrew";};
			[ "FISTFULFLOWERS" ] =	{[ "ENGLISH" ] = "A Fistful of Flowers";					[ "FRENCH" ] = "Brass\195\169es de fleurs";							[ "GERMAN" ] = "A Fistful of Flowers";								[ "RUSSIAN" ] = "A Fistful of Flowers";};
		};
		[ 2 ] = { -- Summer
			[ "TOOMUCHFESTIVAL" ] = 	{[ "ENGLISH" ] = "Too Much Festival";			[ "FRENCH" ] = "Too Much Festival";				[ "GERMAN" ] = "Too Much Festival";			[ "RUSSIAN" ] = "Too Much Festival";};
			[ "GOINGHUNGRY" ] = 		{[ "ENGLISH" ] = "Going Hungry";				[ "FRENCH" ] = "Going Hungry";					[ "GERMAN" ] = "Going Hungry";				[ "RUSSIAN" ] = "Going Hungry";};
			[ "BELONGINGS" ] = 		{[ "ENGLISH" ] = "Belongings Gone Fishing";	[ "FRENCH" ] = "Belongings Gone Fishing";			[ "GERMAN" ] = "Belongings Gone Fishing";		[ "RUSSIAN" ] = "Belongings Gone Fishing";};
			[ "STOCKINGPOND" ] = 		{[ "ENGLISH" ] = "Stocking the Pond";			[ "FRENCH" ] = "Stocking the Pond";				[ "GERMAN" ] = "Stocking the Pond";			[ "RUSSIAN" ] = "Stocking the Pond";};
			[ "FORGOTTENERRANDS" ] = 	{[ "ENGLISH" ] = "Forgotten Errands";			[ "FRENCH" ] = "Forgotten Errands";				[ "GERMAN" ] = "Forgotten Errands";			[ "RUSSIAN" ] = "Forgotten Errands";};
			[ "WAGER" ] = 			{[ "ENGLISH" ] = "Losing More Than a Wager";	[ "FRENCH" ] = "Losing More Than a Wager";		[ "GERMAN" ] = "Losing More Than a Wager";	[ "RUSSIAN" ] = "Losing More Than a Wager";};
			[ "MISSINGTHINGS" ] =		{[ "ENGLISH" ] = "Missing Things";			[ "FRENCH" ] = "Missing Things";					[ "GERMAN" ] = "Missing Things";				[ "RUSSIAN" ] = "Missing Things";};
		};
		[ 3 ] = { -- Harvestmath
			-- New Quest: Troves and Trickery -- Thorin's Hall
			-- Completed:\n Troves and Trickery -- Thorin's Hall
			[ "TROVESDUILLOND" ] = 	{[ "ENGLISH" ] = "Troves and Trickery -- Duillond";		[ "FRENCH" ] = "Tours et surprises -- Duillond";			[ "GERMAN" ] = "Troves and Trickery -- Duillond";			[ "RUSSIAN" ] = "Troves and Trickery -- Duillond";}; -- Quest channel
			[ "TROVESTHORINS" ] = 	{[ "ENGLISH" ] = "Troves and Trickery -- Thorin's Hall";	[ "FRENCH" ] = "Tours et surprises -- Palais de Thorin";	[ "GERMAN" ] = "Troves and Trickery -- Thorin's Hall";	[ "RUSSIAN" ] = "Troves and Trickery -- Thorin's Hall";};
			[ "TROVESSHIRE" ] = 		{[ "ENGLISH" ] = "Troves and Trickery -- the Shire";		[ "FRENCH" ] = "Tours et surprises -- La Comt\195\169";	[ "GERMAN" ] = "Troves and Trickery -- the Shire";		[ "RUSSIAN" ] = "Troves and Trickery -- the Shire";};
			[ "TROVESBREE" ] = 		{[ "ENGLISH" ] = "Troves and Trickery -- Bree";			[ "FRENCH" ] = "Tours et surprises -- Bree";				[ "GERMAN" ] = "Troves and Trickery -- Bree";				[ "RUSSIAN" ] = "Troves and Trickery -- Bree";};
			[ "RIDDLEBOTTLE" ] = 		{[ "ENGLISH" ] = "A Riddle in a Bottle";					[ "FRENCH" ] = "Une \195\169nigme dans une bouteille";	[ "GERMAN" ] = "A Riddle in a Bottle";					[ "RUSSIAN" ] = "A Riddle in a Bottle";};
		};
		[ 4 ] = { -- Yule
			[ "SNOWBEASTS" ] = 	{[ "ENGLISH" ] = "The Abominable Snow-beasts";		[ "FRENCH" ] = "Les abominables b\195\170tes des neiges";				[ "GERMAN" ] = "The Abominable Snow-beasts";				[ "RUSSIAN" ] = "The Abominable Snow-beasts";};
			[ "VILLAIN" ] =		{[ "ENGLISH" ] = "Villain - Frostbluff Theatre";		[ "FRENCH" ] = "M\195\169chant - Th\195\169\195\162tre de Rivegel";	[ "GERMAN" ] = "Villain - Frostbluff Theatre";			[ "RUSSIAN" ] = "Villain - Frostbluff Theatre";};
			[ "EXTRA" ] =			{[ "ENGLISH" ] = "Extra - Frostbluff Theatre";		[ "FRENCH" ] = "Figurant - Th\195\169\195\162tre de Rivegel";			[ "GERMAN" ] = "Extra - Frostbluff Theatre";				[ "RUSSIAN" ] = "Extra - Frostbluff Theatre";};
			[ "PROTAGONIST" ] =	{[ "ENGLISH" ] = "Protagonist - Frostbluff Theatre";	[ "FRENCH" ] = "Protagoniste - Th\195\169\195\162tre de Rivegel";		[ "GERMAN" ] = "Protagonist - Frostbluff Theatre";		[ "RUSSIAN" ] = "Protagonist - Frostbluff Theatre";};
			[ "THEATRE" ] = {[ "ENGLISH" ] = "The Frostbluff Theatre"; [ "FRENCH" ] = "Le Th\195\169\195\162tre de Rivegel"; [ "GERMAN" ] = "The Frostbluff Theatre"; [ "RUSSIAN" ] = "The Frostbluff Theatre";};
			[ "STUFFINGSTUFFED" ] = {[ "ENGLISH" ] = "Stuffing the Stuffed"; [ "FRENCH" ] = "Gaver les participants"; [ "GERMAN" ] = "Stuffing the Stuffed"; [ "RUSSIAN" ] = "Stuffing the Stuffed";};
			[ "EMPTYKEG" ] = {[ "ENGLISH" ] = "Empty Keg Emergency"; [ "FRENCH" ] = "Des tonneaux presque vides"; [ "GERMAN" ] = "Empty Keg Emergency"; [ "RUSSIAN" ] = "Empty Keg Emergency";};
			[ "BIGGESTSTOMACH" ] = {[ "ENGLISH" ] = "The Biggest Stomach of Them All"; [ "FRENCH" ] = "Le plus gros estomac du monde"; [ "GERMAN" ] = "The Biggest Stomach of Them All"; [ "RUSSIAN" ] = "The Biggest Stomach of Them All";};
		};
		[ 5 ] = { -- Anniversary
			[ "BREEFIREWORKS" ] = {[ "ENGLISH" ] = "Fireworks in Bree"; [ "FRENCH" ] = "Feux d'artifice \195\160 Bree"; [ "GERMAN" ] = "Fireworks in Bree"; [ "RUSSIAN" ] = "Fireworks in Bree";};
			[ "LOSTINVITES" ] = {[ "ENGLISH" ] = "Lost Invitations"; [ "FRENCH" ] = "Invitations perdues"; [ "GERMAN" ] = "Lost Invitations"; [ "RUSSIAN" ] = "Lost Invitations";};
			[ "MIGHTIESTBLOW_BASIC" ] = {[ "ENGLISH" ] = "The Mightiest Blow (Basic)"; [ "FRENCH" ] = "Le coup fatal (Basique)"; [ "GERMAN" ] = "The Mightiest Blow (Basic)"; [ "RUSSIAN" ] = "The Mightiest Blow (Basic)";};
			[ "MIGHTIESTBLOW_INT" ] = {[ "ENGLISH" ] = "The Mightiest Blow (Intermediate)"; [ "FRENCH" ] = "Le coup fatal (Interm\195\169diaire)"; [ "GERMAN" ] = "The Mightiest Blow (Intermediate)"; [ "RUSSIAN" ] = "The Mightiest Blow (Intermediate)";};
			[ "MIGHTIESTBLOW_EXPERT" ] = {[ "ENGLISH" ] = "The Mightiest Blow (Expert)"; [ "FRENCH" ] = "Le coup fatal (Expert)"; [ "GERMAN" ] = "The Mightiest Blow (Expert)"; [ "RUSSIAN" ] = "The Mightiest Blow (Expert)";};
		};
		[ 6 ] = { -- Farmer's Faire

			};
		[ 7 ] = { -- Treasure Hunt
			[ "TREASURECAMP" ] = { [ "ENGLISH" ] = "Treasure Camp"; [ "FRENCH" ] = "Treasure Camp";[ "GERMAN" ] = "Treasure Camp"; [ "RUSSIAN" ] = "Treasure Camp";};
			[ "TREASUREHUNT" ] = { [ "ENGLISH" ] = "Treasure Hunt"; [ "FRENCH" ] = "Treasure Hunt";[ "GERMAN" ] = "Treasure Hunt"; [ "RUSSIAN" ] = "Treasure Hunt";};
			[ "BERRIES" ] = { [ "ENGLISH" ] = "Berries"; [ "FRENCH" ] = "Berries";[ "GERMAN" ] = "Berries"; [ "RUSSIAN" ] = "Berries";};
		};
	};
	[ "BUTTONS" ] = {
		[ "DANCE" ] = {[ "ENGLISH" ] = "Dance";	[ "FRENCH" ] = "Danse";	[ "GERMAN" ] = "Dance";	[ "RUSSIAN" ] = "Dance";};
	};
	[ "TOKENS" ] = { -- BARTER TOKENS USED AT THE FESTIVALS.
		[ 1 ] = {	-- Spring
			[ "FESTIVAL" ] = 1879151743;
			[ "MITHRIL" ] = 1879255991;
			[ "RACE" ] = 1879173003;
			[ "VIOLET" ] = 1879103239;
			[ "MARIGOLD" ] = 1879103242;
			[ "PRIMROSE" ] = 1879103241;
		};
		[ 2 ] = { 	-- Summer
			[ "RACE" ] = 1879115708;
			[ "FESTIVAL" ] = 1879115679;
			[ "HADDOCK" ] = 1879115925;
			[ "AMBERJACK" ] = 1879115674;
			[ "LUILLIM" ] = 1879115675;
			[ "DRUM" ] = 1879115676;
			[ "CELEBHAL" ] = 1879115678;
			[ "GOLDRED" ] = 1879115929;
			[ "FLOUNDER" ] = 1879115924;
			[ "SMALLFISH" ] = 1879115927;
			[ "MITHRIL" ] = 1879255991;
		};
		[ 3 ] = { -- Harvestmath
			[ "RACE" ] = 1879101765;
			[ "FESTIVAL" ] = 1879098272;
			[ "MITHRIL" ] = 1879255991;
			[ "SMALLAPPLE" ] = 1879098268;
			[ "MEDIUMAPPLE" ] = 1879098267;
			[ "LARGEAPPLE" ] = 1879098266;
			[ "CRACKEDGEODE" ] = 1879098262;
			[ "PRISTINEGEODE" ] = 1879098261;
			[ "FAULTLESSGEODE" ] = 1879098260;
			[ "UNIMPRESSIVESCROLL" ] = 1879098265;
			[ "WELLWRITTENSCROLL" ] = 1879098264;
			[ "ELEGANTSCROLL" ] = 1879098263;
			[ "SMALLPUMPKIN" ] = 1879098271;
			[ "MEDIUMPUMPKIN" ] = 1879098270;
			[ "LARGEPUMPKIN" ] = 1879098269;
		};
		[ 4 ] = { -- Yule
			[ "FESTIVAL" ] = 1879256449;
			[ "GOLDFESTIVAL" ] = 1879257572;
			[ "TICKET" ] = 1879238505;
			[ "RACE" ] = 1879149799;
			[ "MITHRIL" ] = 1879255991;
		};
		[ 5 ] = {	-- Anniversary
			[ "RACE" ] = 1879201266;
			[ "FESTIVAL" ] = 1879200721;
			[ "STEEL" ] = 1879303343;
			[ "MITHRIL" ] = 1879255991;
		};
		[ 6 ] = { -- Farmers Faire
			[ "RACE" ] = 1879227344;
			[ "FESTIVAL" ] = 1879223715;
			[ "MITHRIL" ] = 1879255991;
		};
		[ 7 ] = { -- Treasure Hunt
			[ "TREASURE" ] = 1879206049;
			[ "MITHRIL" ] = 1879255991;
		};
	};
};