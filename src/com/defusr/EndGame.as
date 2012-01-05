package com.defusr 
{
	import org.flixel.*;
	
	public class EndGame extends FlxState
	{
		public static var _level:int;
		private var _SndEnd:FlxSound;
		[Embed(source = '../../data/5207__fonogeno__contact02.mp3')] protected var SndEnd:Class;
		
		override public function EndGame(_level:int):void
		{
			_SndEnd = new FlxSound;
			_SndEnd.loadEmbedded(SndEnd, false);
			
			_SndEnd.play();
			
			var txt:FlxText;
			txt = new FlxText(0, (FlxG.width / 2), FlxG.width, "GAME OVER");
			txt.setFormat(null, 16, 0xFFFFFFFF, "center");
			this.add(txt);
				
			txt = new FlxText(0, FlxG.height  -120, FlxG.width, "CLICK TO END");
			txt.setFormat(null, 8, 0xFFFFFFFF, "center");
			this.add(txt);
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justPressed())
			{
				FlxG.flash.start(0xffffffff, 0.75);
				FlxG.fade.start(0xff000000, 1, onFade);
			}
			super.update();
		}
		
		private function onFade():void
		{
			FlxG.state = new MenuState();
		}
		
	}

}