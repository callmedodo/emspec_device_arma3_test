/*
	author: callmedodo[TTT]
	description: none
	returns: nothing
*/

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

_unit = _this select 0;
_radios = _this select 1;
_radiotype = _this select 2;
_additional = _this select 3;
_btDown = _this select 4;

if (_unit call TFAR_fnc_isSpeaking) then {
hint str [_unit,_radios,_radiotype,_additional,_btDown];

};

