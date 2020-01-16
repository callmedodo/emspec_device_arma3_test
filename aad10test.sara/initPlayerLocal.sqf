/*
	author: callmedodo[TTT]
	description: none
	returns: nothing
*/

params ["_player", "_didJIP"];

//[_1,_2,_3,_4]
//1->name has to be ingame name too
//2->distance in which antenna can be detected
//3->how close has the device be aimed on target for detection
//4->Frequency
private _antennas = [[antenna2,100,10,141.8]];//add all Antenas with frequencies


{
   [_player,_x] execVM "customAntenna.sqf";
} forEach _antennas;

