package com.defusr 
{
	import org.flixel.*;
	import com.defusr.PlayState;
	
	public class MenuState extends FlxState
	{
		public static var _level:int;
		public static var _score:int;
		public static var _seenHint:Boolean;
		private var _SndStart:FlxSound;
		[Embed(source='../../data/5208__fonogeno__contact03.mp3')] protected var SndStart:Class;
		
		override public function MenuState():void 
		{
			_score = new int(0);
			_level = new int(0);
			_seenHint = new Boolean(false);
			_SndStart = new FlxSound;
			_SndStart.loadEmbedded(SndStart, false);
			
			_SndStart.play();
			
			var txt:FlxText;
			txt = new FlxText(0, (FlxG.width / 2) - 40, FlxG.width, "TURN");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
			
			txt = new FlxText(0, (FlxG.width / 2) - 15, FlxG.width, "[OUT]");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
			
			txt = new FlxText(0, (FlxG.width / 2) + 10, FlxG.width, "THE");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
			
			txt = new FlxText(0, (FlxG.width / 2) + 35, FlxG.width, "[LIGHTS]");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
			
			txt = new FlxText(0, FlxG.height  -50, FlxG.width, "CLICK TO START");
			txt.setFormat(null, 8, 0xFFFFFFFF, "center");
			this.add(txt);
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justPressed())
			{
				FlxG.flash.start(0xffffffff, 0.5);
				FlxG.fade.start(0xff000000, 0.5, onFade);
			}
			super.update();
		}
		
		private function onFade():void
		{
			FlxG.state = new PlayState();
			//FlxG.state = new TransState();
		}
		
	}

}