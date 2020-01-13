/*
	author: callmedodo[TTT]
	description: none
	returns: nothing
*/


// should run when detected speaking
// Radio settings will be used for emspec settings$
// when you broadcast, in a given radius you can be detected speaking
//->Listener
["MyID", "OnSpeak", {hint format ["%1 %2 speaking", _this select 0, if(_this select 1)then{"is"}else{"isn't"}];}, ObjNull] call TFAR_fnc_addEventHandler;
["001","OnTangent",{[_this] execVM "tfarRadioHack.sqf";},objNull] call TFAR_fnc_addEventHandler;
// when emspec device is on right frequency, a new local radio is generated which plays the message.

// only can hear them, when security key for radio's have been fouond

//
//
//    OnTangent
  //  When the local player uses a radio.
//    OBJECT – unit.
 //   STRING / ARRAY – former if SW radio class, latter if LR.
  //  NUMBER – 0 for SW, 1 for LR, 2 for underwater transceiver.
   // BOOLEAN – additional channel key.
   // BOOLEAN – button down
//
