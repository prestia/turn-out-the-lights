package com.defusr 
{
	import org.flixel.*;
	
	public class blackOut extends FlxSprite
	{
		[Embed(source='../../data/blackout.png')] private var _blackOut:Class;

		public function blackOut(X:Number,Y:Number):void
		{
			super(X, Y);
			loadGraphic(_blackOut, false, false, 40, 14);
		}
			
	}

}