/*
	author: callmedodo [TTT]
	description: what happens when something got hacked
	returns: nothing
*/

//_ok = cutRsc["RscTitles","Plain"];
_caller = _this select 0;

_antenna = _this select 1;

_ok = createDialog "MyHelloWorldDialog";

//Let them burn
buttonSetAction[100,_antenna + "setDamage 1"];

//buttonSetAction[101,_antenna+" deleteVehicleCrew _x } forEach crew "+_antenna];
buttonSetAction[101, _antenna +"  setAutonomous false "];

buttonSetAction[102,_caller + " connectTerimnalToUAV " + _antenna];

buttonSetAction[103,_caller + " remoteControl driver "+_antenna+";
                                gunner "+_antenna+" switchCamera 'Internal';
                                sleep(30);
                                objNull remoteControl gunner +"_antenna+";"];


waitUntil { !dialog }; // hit ESC to close it
