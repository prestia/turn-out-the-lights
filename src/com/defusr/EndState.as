package com.defusr 
{
	import org.flixel.*;
	
	public class EndState extends FlxState
	{
		public static var _level:int;
		private var _SndEnd:FlxSound;
		[Embed(source = '../../data/5207__fonogeno__contact02.mp3')] protected var SndEnd:Class;
		private var _SndStart:FlxSound;
		[Embed(source = '../../data/5208__fonogeno__contact03.mp3')] protected var SndStart:Class;
		
		override public function EndState(_level:int):void
		{
			_SndEnd = new FlxSound;
			_SndEnd.loadEmbedded(SndEnd, false);
			_SndStart = new FlxSound;
			_SndStart.loadEmbedded(SndStart, false);
			
			_SndEnd.play();
			
			var txt:FlxText;
			txt = new FlxText(0, (FlxG.width / 2) - 40, FlxG.width, "FAILURE");
			txt.setFormat(null, 16, 0xFFFFFFFF, "center");
			this.add(txt);
			
			txt = new FlxText(0, (FlxG.width / 2), FlxG.width, "-100 pts");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
				
			txt = new FlxText(0, FlxG.height  -110, FlxG.width, "CLICK TO RETRY");
			txt.setFormat(null, 8, 0xFFFFFFFF, "center");
			this.add(txt);
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justPressed())
			{
				_SndStart.play();
				FlxG.flash.start(0xffffffff, 0.75);
				FlxG.fade.start(0xff000000, 1, onFade);
			}
			super.update();
		}
		
		private function onFade():void
		{
			FlxG.state = new PlayState();
		}
		
	}

}