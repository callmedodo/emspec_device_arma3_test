////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by callmedodo, v1.063, #Fyvyly)
////////////////////////////////////////////////////////
class MyHelloWorldDialog {
	idd = -1;
	movingEnable = 0;
	class ControlsBackground {
		// define controls here
	};
	class Objects {
		// define controls here
	};
	class Controls {
		// define controls here
class topButton: RscButton
{
	type = CT_BUTTON;
    	idc = -1;
    	text = "Kill";
    	x = 0.80;
        			y = 0.10;
        			w = 0.20;
        			h = 0.05;
	action = "antenna2 setDamage 1;";
};
class topMidButton: RscButton
{
	type = CT_BUTTON;
        	idc = -1;
        	text = "Disable";
        	x = 0.80;
            			y = 0.20;
            			w = 0.20;
            			h = 0.05;
    	action = "{ antenna2 deleteVehicleCrew _x } forEach crew antenna2; ";
};
class bottomMidButton: RscButton
{
	type = CT_BUTTON;
        	idc = -1;
        	text = "hack";
        	x = 0.80;
            			y = 0.30;
            			w = 0.20;
            			h = 0.05;
    	action = "hint '3';";
};
class bottomButton: RscButton
{
	type = CT_BUTTON;
         	idc = -1;
         	text = "Berserker";
         	x = 0.80;
             			y = 0.40;
             			w = 0.20;
             			h = 0.05;
     	action = "hint '4';";
	};
};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
