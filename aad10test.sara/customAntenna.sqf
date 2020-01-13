/*
	author: callmedodo [TTT]
	description: addes tracking and hacking capabilities for emspec device
	returns: nothing
*/

//get the caller of the function
_caller = _this select 0;
//get the specific antenna
_antenna = _this select 1;
_outterRing = _this select 2;      //200% ->200
_outerRing2 = _outterRing * 0.5;      //100% ->range in which signal is always detectable -> 100
_middleRing = _outerRing2 * 0.75;       //75% -> 75
_innerRing = _outerRing2 * 0.5;        //50% -> 50
_detectionRadius = _outerRing2 * 0.25;  //25% -> range to "hack" target -> 25

//in which degree will it detect source
_detecDegree = _this select 3; // 20

_runcondition = true;

//do loop until runcondition is false or caller is dead
while{_runcondition and  alive _caller} do {

    //distance between player(caller) and source
    _distPlaAnt1 = _caller distance _antenna;

    //in which direction from the caller is the source
    _azimuth = player getDir _antenna;
    //in which direction is the player facing
    _dir = direction player;

    //calculates difference between azimuth and dir, which is used to find out if player is pointed within specific values at source
    //20 degree as standard
    _dif1 = _azimuth - _dir;
    _difcheck =(_dif1 <= _detecDegree and _dif1 >= -_detecDegree) or (_dif1 <= 360 + _detecDegree and _dif1 >= 360 - _detecDegree) or (_dif1 >= -360 - _detecDegree and _dif1 <= -360 + _detecDegree);

    //is needed for hacking progress
    _progress = missionNameSpace getVariable "#EM_Progress";
    _selmax = missionNameSpace getVariable "#EM_SelMax";
    _selmin = missionNameSpace getVariable "#EM_SelMin";

    if(_difcheck || _distPlaAnt1 <= _outterRing) then {
        if(_difcheck && _distPlaAnt1 >= _outerRing2) then {
            missionNamespace setVariable ["#EM_Values", [141.8,-100]];
        } else {
            if(_difcheck && _distPlaAnt1 >= _middleRing) then {
                missionNamespace setVariable ["#EM_Values", [141.8,-75]];
            } else {
                if(_difcheck && _distPlaAnt1 >= _innerRing) then {
                   missionNamespace setVariable ["#EM_Values", [141.8,-50]];
                } else {
                    if(_difcheck && _distPlaAnt1 >= _detectionRadius) then {
                        missionNamespace setVariable ["#EM_Values", [141.8,-25]];
                    } else {
                        if(_difcheck) then {
                            missionNamespace setVariable ["#EM_Values", [141.8,0]];
                            if(141.8>= _selmin && 141.8 <= _selmax) then {
                                _newProg = _progress + 0.1;
                                missionNamespace setVariable ["#EM_Progress",_newProg];
                                if(_newProg >= 1) then {
                                    hint "hacked";//TODO Delete Debug Statement
                                    missionNamespace setVariable ["#EM_Values", [141.8,-110]];//disable Signal
                                    _runcondition = false;//exiting loop
                                    execVM "hacked.sqf";//call GUI for Hacking
                                };
                            };
                        } else {
                            missionNamespace setVariable ["#EM_Values", [141.8,-100]];
                        };
                    };
                };
            };
        };
    } else {
        missionNamespace setVariable ["#EM_Values", [141.8,-110]];
    };
    sleep(0.5);
};
