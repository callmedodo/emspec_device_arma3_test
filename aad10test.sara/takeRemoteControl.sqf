/*
	author: callmedodo[TTT]
	description: none
	returns: nothing
*/
private _caller = _this select 0;
private _antenna = _this select 1;
_caller action ["nvGogglesOff",_caller];
_caller remoteControl gunner _antenna;
gunner _antenna switchCamera 'Internal';
sleep(30);
objNull remoteControl gunner _antenna;
_caller switchCamera "Internal";
