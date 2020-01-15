////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by callmedodo, v1.063, #Fyvyly)
////////////////////////////////////////////////////////
class MyHelloWorldDialog {
	idd = 12;
	movingEnable = 1;
	class ControlsBackground {
		// define controls here
	};
	class Objects {
		// define controls here
	};
	class Controls {
		// define controls here
        class topButton: RscButton {
	        type = CT_BUTTON;
    	    idc = 100;
    	    text = "Kill";
    	    x = 0.80;
        	y = 0.10;
        	w = 0.20;
        	h = 0.05;

        };
        class topMidButton: RscButton {
	        type = CT_BUTTON;
        	idc = 101;
        	text = "Disable";
        	x = 0.80;
            y = 0.20;
            w = 0.20;
            h = 0.05;

        };
        class bottomMidButton: RscButton {
	        type = CT_BUTTON;
        	idc = 102;
        	text = "hack";
        	x = 0.80;
            y = 0.30;
            w = 0.20;
            h = 0.05;
        };
        class bottomButton: RscButton {
	        type = CT_BUTTON;
         	idc = 103;
         	text = "Berserker";
         	x = 0.80;
            y = 0.40;
            w = 0.20;
            h = 0.05;
	    };
	     class bottomButtondown: RscButton {
            type = CT_BUTTON;
            idc = 104;
            text = "SetCaptive";
            x = 0.80;
            y = 0.50;
            h = 0.05;
        	};
    };
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
