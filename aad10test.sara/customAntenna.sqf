/*
	author: callmedodo [TTT]
	description: addes tracking and hacking capabilities for emspec device
	returns: nothing
*/

/*
    PARAMS
*/
//get the caller of the function
private _caller = _this select 0;
//get the specific antenna
private _antenna = _this select 1;
//Range in which Device is Detecting
private _outerRing2 =  _this select 2;      //100% ->range in which signal is always detectable -> 100
//in which degree will it detect source
private _detecDegree = _this select 3; // 20
//Freq on which signal is broadcasted
private _freq = _this select 4;

/*
    VARS
*/
private _outterRing = _outerRing2 * 2;      //200% ->200
private _middleRing = _outerRing2 * 0.75;       //75% -> 75
private _innerRing = _outerRing2 * 0.5;        //50% -> 50
private _detectionRadius = _outerRing2 * 0.25;  //25% -> range to "hack" target -> 25
private _runcondition = true;

/*
    CODE
*/
//do loop until runcondition is false or caller is dead
while{_runcondition and  alive _caller} do {

    //distance between player(caller) and source
    private _distPlaAnt1 = _caller distance _antenna;

    //in which direction from the caller is the source
    private _azimuth = player getDir _antenna;
    //in which direction is the player facing
    private _dir = direction player;

    //calculates difference between azimuth and dir, which is used to find out if player is pointed within specific values at source
    private _dif1 = _azimuth - _dir;
    _difcheck =(_dif1 <= _detecDegree and _dif1 >= -_detecDegree) or (_dif1 <= 360 + _detecDegree and _dif1 >= 360 - _detecDegree) or (_dif1 >= -360 - _detecDegree and _dif1 <= -360 + _detecDegree);

    //is needed for hacking progress
    private _progress = missionNameSpace getVariable "#EM_Progress";
    private _selmax = missionNameSpace getVariable "#EM_SelMax";
    private _selmin = missionNameSpace getVariable "#EM_SelMin";
    private _emValues = missionNameSpace getVariable "#EM_Values";
    private _updateValueEM = [_freq,0];

    if(_difcheck || _distPlaAnt1 <= _outterRing) then {
        if(_difcheck && _distPlaAnt1 >= _outerRing2) then {
            [_freq,-100] execVM "updateValue.sqf";
            //missionNamespace setVariable ["#EM_Values", [141.8,-100]];
        } else {
            if(_difcheck && _distPlaAnt1 >= _middleRing) then {
               [_freq,-75] execVM "updateValue.sqf";
                //missionNamespace setVariable ["#EM_Values", [141.8,-75]];
            } else {
                if(_difcheck && _distPlaAnt1 >= _innerRing) then {
                    [_freq,-50] execVM "updateValue.sqf";
                   //missionNamespace setVariable ["#EM_Values", [141.8,-50]];
                } else {
                    if(_difcheck && _distPlaAnt1 >= _detectionRadius) then {
                        [_freq,-25] execVM "updateValue.sqf";
                        //missionNamespace setVariable ["#EM_Values", [141.8,-25]];
                    } else {
                        if(_difcheck) then {
                            [_freq,0] execVM "updateValue.sqf";
                            //missionNamespace setVariable ["#EM_Values", [141.8,0]];
                            if(_freq >= _selmin && _freq <= _selmax) then {
                                private _newProg = _progress + 0.1;
                                missionNamespace setVariable ["#EM_Transmit", true];
                                missionNamespace setVariable ["#EM_Progress",_newProg];
                                if(_newProg >= 1) then {
                                    [_freq,-110] execVM "updateValue.sqf";
                                    missionNamespace setVariable ["#EM_Transmit", false];
                                    //missionNamespace setVariable ["#EM_Values", [141.8,-110]];//disable Signal
                                    _runcondition = false;//exiting loop
                                    missionNamespace setVariable ["#EM_Progress",0];
                                    [_caller,_antenna] execVM "hacked.sqf";//call GUI for Hacking
                                };
                            };
                        } else {
                            [_freq,-100] execVM "updateValue.sqf";
                            //missionNamespace setVariable ["#EM_Values", [141.8,-100]];
                        };
                    };
                };
            };
        };
    } else {
        [_freq,-110] execVM "updateValue.sqf";
        //missionNamespace setVariable ["#EM_Values", [141.8,-110]];
    };

    sleep(0.5);
};
/*
    END OF CODE
*/
