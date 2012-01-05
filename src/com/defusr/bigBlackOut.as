package com.defusr 
{
	import org.flixel.*;
	
	public class bigBlackOut extends FlxSprite
	{
		[Embed(source='../../data/bigBlackOut.png')] private var _bigBlackOut:Class;

		public function bigBlackOut(X:Number,Y:Number):void
		{
			super(X, Y);
			loadGraphic(_bigBlackOut, false, false, 319, 39);
		}
			
	}

}