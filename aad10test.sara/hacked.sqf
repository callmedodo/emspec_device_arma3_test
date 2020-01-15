/*
	author: callmedodo [TTT]
	description: what happens when something got hacked
	returns: nothing
*/

//_ok = cutRsc["RscTitles","Plain"];
private _caller = _this select 0;

private _antenna = _this select 1;
hint str _antenna;
private _ok = createDialog "MyHelloWorldDialog";

if(unitIsUAV _antenna) then {
//Let them burn
buttonSetAction[100,str _antenna + " setDamage 1"];

//buttonSetAction[101,_antenna+" deleteVehicleCrew _x } forEach crew "+_antenna];
buttonSetAction[101, str _antenna +"  setAutonomous false "];

//buttonSetAction[102,str _caller + " connectTerimnalToUAV " +str _antenna + ";"];

buttonSetAction[102, "[" +str _caller+","+ str  _antenna+"] execVM 'takeRemoteControl.sqf'"];

buttonSetAction[103,str _antenna +" fireAtTarget ["+str _antenna+" nearEntities [['Car', 'Motorcycle', 'UAV'], 200]];"];
hint str buttonAction 102;

buttonSetAction[104,str _antenna +" setCaptive true;"];

waitUntil { !dialog }; // hit ESC to close it

};
