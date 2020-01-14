/*
	author: callmedodo [TTT]
	description: addes tracking and hacking capabilities for emspec device
	returns: nothing
*/

/*
    PARAMS
*/
//get the caller of the function
_caller = _this select 0;
//get the specific antenna
_antenna = _this select 1;
//Range in which Device is Detecting
_outerRing2 =  _this select 2;      //100% ->range in which signal is always detectable -> 100
//in which degree will it detect source
_detecDegree = _this select 3; // 20
//Freq on which signal is broadcasted
_freq = _this select 4;

/*
    VARS
*/
_outterRing = _outerRing2 * 2;      //200% ->200
_middleRing = _outerRing2 * 0.75;       //75% -> 75
_innerRing = _outerRing2 * 0.5;        //50% -> 50
_detectionRadius = _outerRing2 * 0.25;  //25% -> range to "hack" target -> 25
_runcondition = true;

/*
    CODE
*/
//do loop until runcondition is false or caller is dead
while{_runcondition and  alive _caller} do {

    //distance between player(caller) and source
    _distPlaAnt1 = _caller distance _antenna;

    //in which direction from the caller is the source
    _azimuth = player getDir _antenna;
    //in which direction is the player facing
    _dir = direction player;

    //calculates difference between azimuth and dir, which is used to find out if player is pointed within specific values at source
    _dif1 = _azimuth - _dir;
    _difcheck =(_dif1 <= _detecDegree and _dif1 >= -_detecDegree) or (_dif1 <= 360 + _detecDegree and _dif1 >= 360 - _detecDegree) or (_dif1 >= -360 - _detecDegree and _dif1 <= -360 + _detecDegree);

    //is needed for hacking progress
    _progress = missionNameSpace getVariable "#EM_Progress";
    _selmax = missionNameSpace getVariable "#EM_SelMax";
    _selmin = missionNameSpace getVariable "#EM_SelMin";
    _emValues = missionNameSpace getVariable "#EM_Values";
    _updateValueEM = [_freq,0];

    if(_difcheck || _distPlaAnt1 <= _outterRing) then {
        if(_difcheck && _distPlaAnt1 >= _outerRing2) then {
            _updateValueEM = [_freq,-100];
            //missionNamespace setVariable ["#EM_Values", [141.8,-100]];
        } else {
            if(_difcheck && _distPlaAnt1 >= _middleRing) then {
                _updateValueEM = [_freq,-75];
                //missionNamespace setVariable ["#EM_Values", [141.8,-75]];
            } else {
                if(_difcheck && _distPlaAnt1 >= _innerRing) then {
                    _updateValueEM = [_freq,-50];
                   //missionNamespace setVariable ["#EM_Values", [141.8,-50]];
                } else {
                    if(_difcheck && _distPlaAnt1 >= _detectionRadius) then {
                        _updateValueEM = [_freq,-25];
                        //missionNamespace setVariable ["#EM_Values", [141.8,-25]];
                    } else {
                        if(_difcheck) then {
                            _updateValueEM = [_freq,0];
                            //missionNamespace setVariable ["#EM_Values", [141.8,0]];
                            if(_freq >= _selmin && _freq <= _selmax) then {
                                _newProg = _progress + 0.1;
                                missionNamespace setVariable ["#EM_Progress",_newProg];
                                if(_newProg >= 1) then {
                                    _updateValueEM = [_freq,-110];
                                    //missionNamespace setVariable ["#EM_Values", [141.8,-110]];//disable Signal
                                    _runcondition = false;//exiting loop
                                    [_caller,_antenna] execVM "hacked.sqf";//call GUI for Hacking
                                };
                            };
                        } else {
                            _updateValueEM = [_freq,-100];
                            //missionNamespace setVariable ["#EM_Values", [141.8,-100]];
                        };
                    };
                };
            };
        };
    } else {
        _updateValueEM = [_freq,-110];
        //missionNamespace setVariable ["#EM_Values", [141.8,-110]];
    };
    _elNum = {_x select 0 == _updateValueEM select 0} count _emValues;
    if(_elNum > -1) then{
        _emValues set [_elNum,_updateValueEM select 1];
    } else {
        _emValues pushBack _updateValueEM;
    };
    missionNameSpace setVariable ["#EM_Values",_emValues];
    sleep(0.5);
};
/*
    END OF CODE
*/
