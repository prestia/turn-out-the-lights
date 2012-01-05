package com.defusr 
{
	import org.flixel.*;
	import com.defusr.PlayState;
	
	public class TransState extends FlxState
	{
		private var wait:Number;
		public static var _level:int;
		
		override public function TransState():void
		{
			wait = new Number(0);
			
			
		}
		
		override public function update():void
		{
			//FlxG.flash.start(0x99c000ff, 0.1);
			
			/*var txt:FlxText;
			
			if (_level == 8) {
			
			txt = new FlxText(0, (FlxG.width / 2) - 60, FlxG.width, "TIME");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
			
			txt = new FlxText(0, (FlxG.width / 2) - 35, FlxG.width, "TO [MIX]");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
			
			txt = new FlxText(0, (FlxG.width / 2) - 10, FlxG.width, "IT UP");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
			
			txt = new FlxText(0, (FlxG.width / 2) + 15, FlxG.width, "A [BIT]");
			txt.setFormat(null, 24, 0xFFFFFFFF, "center");
			this.add(txt);
			}
			
			if ( wait <= 1) {
				wait += FlxG.elapsed;
			}
			
			if ( wait >= 1) {
				FlxG.state = new PlayState();
			}*/
			
			FlxG.flash.start(0xffffffff, 0.5, startPlay);
			//FlxG.fade.start(0xff000000, 0.5, startPlay);
			
			super.update();
		}
		
		private function startPlay():void
		{
			FlxG.state = new PlayState()
		}
		
	}

}