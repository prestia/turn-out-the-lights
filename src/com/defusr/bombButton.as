package com.defusr 
{
	import org.flixel.*;
	
	public class bombButton extends FlxSprite
	{
		[Embed(source = '../../data/buttonOn.png')] private var ImgButtonOn:Class;
		[Embed(source = '../../data/buttonOff.png')] private var ImgButtonOff:Class;
		[Embed(source = '../../data/bottonOn2.png')] private var ImgButtonOn2:Class;
		//[Embed(source = '../../data/buttonOnBlink.png')] private var ImgButtonOn:Class;
		//[Embed(source = '../../data/buttonOffBlink.png')] private var ImgButtonOff:Class;

		public function bombButton(X:Number,Y:Number,buttonOn:Number):void
		{
			super(X, Y);
			if (buttonOn == 0) {
				loadGraphic(ImgButtonOff, false, false, 31, 31);
				//loadGraphic(ImgButtonOff, true, false, 29, 29);
				//addAnimation("normalOff", [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5], 20);
				//play("normalOff");
			} else if (buttonOn == 1) {
				loadGraphic(ImgButtonOn, false, false, 31, 31);
				//loadGraphic(ImgButtonOn, true, false, 29, 29);
				//addAnimation("normalOn", [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5], 20);
				//play("normalOn");
			} else { loadGraphic(ImgButtonOn2, false, false, 31, 31); }
		}
			
	}

}