/*
	author: callmedodo [TTT]
	description: none
	returns: nothing
*/

//_ok = cutRsc["RscTitles","Plain"];
_ok = createDialog "MyHelloWorldDialog";
waitUntil { !dialog }; // hit ESC to close it
hint "Dialog closed.";
