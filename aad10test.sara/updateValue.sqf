/*
	author: callmedodo[TTT]
	description: none
	returns: nothing
*/
params ["_freq","_strength"];

private _currentFreqs = missionNamespace getVariable "#EM_Values";
private _newFreqs;
private _notFoundFreq = true;
for "_i" from 0 to (count _currentFreqs)-1 step 2 do {
	private _iFreq = _currentFreqs select _i;
	private _iStrength = _currentFreqs select _i +1;

	if(_notFoundFreq && _iFreq == _freq) then {
	    _newFreqs append _freq;
	    _newFreqs append _strength;
	    _notFoundFreq = false;
	} else{
	    _newFreqs append _iFreq;
	    _newFreqs append _strength;
	};
};
if((count _newFreqs) == 0 or ! _notFoundFreq) then {
    _newFreqs append _freq;
	_newFreqs append _strength;
};
missionNamespace setVariable ["#EM_Values", _newFreqs];
