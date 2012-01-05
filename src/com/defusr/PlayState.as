package com.defusr 
{
	import org.flixel.*;
	import com.defusr.TransState;
	
	public class PlayState extends FlxState
	{
		public var _theGrid:Array;
		public var _boardData:Array;
		public var _boardCache:Array;
		public var _boardTest:Array;
		public var _lightsOut:Array;
		public var _timer:Number;
		public var _timerInt:int;
		public static var _level:int;
		public static var _score:int;
		public static var _seenHint:Boolean;
		private var _timeDisplay:FlxText;
		private var _scoreDisplay:FlxText;
		private var _timeHint:FlxText;
		private var _winCondition:Array;
		private var _SndVictory:FlxSound;

        public static var lyrBackground:FlxGroup;
        public static var lyrSprites:FlxGroup;
        public static var lyrHUD:FlxGroup;
		
		[Embed(source = '../../data/26777__junggle__btn402.mp3')] protected var SndButton:Class;
		[Embed(source = '../../data/28915__junggle__btn105.mp3')] protected var SndVictory:Class;
		
        public function PlayState():void
        {
            super();
            
            lyrBackground = new FlxGroup;
            lyrSprites = new FlxGroup;
            lyrHUD = new FlxGroup;
			_theGrid = new Array();
			_timer = new Number(11);
			_SndVictory = new FlxSound;
			_SndVictory.loadEmbedded(SndVictory, false);

			levels(_level);
			drawBoard();
			clock();
			score();
            this.add(lyrBackground);
            this.add(lyrSprites);
            this.add(lyrHUD);
        }
		
		override public function update():void
        {
			if (_level < 15 && FlxG.mouse.justPressed()) {
				clickCheck();
			} else if (FlxG.mouse.justPressed()) { clickCheck2(); }

			//if (_boardData[0] == 0 && _boardData[1] == 0 && _boardData[2] == 0 && _boardData[3] == 0 && _boardData[4] == 0 && _boardData[5] == 0 && _boardData[6] == 0 && _boardData[7] == 0 && _boardData[8] == 0 && _boardData[9] == 0 && _boardData[10] == 0 && _boardData[11] == 0 && _boardData[12] == 0 && _boardData[13] == 0 && _boardData[14] == 0 && _boardData[15] == 0 && _boardData[16] == 0 && _boardData[17] == 0 && _boardData[18] == 0 && _boardData[19] == 0 && _boardData[20] == 0 && _boardData[21] == 0 && _boardData[22] == 0 && _boardData[23] == 0 && _boardData[24] == 0) {
			if (_boardData[0] == _winCondition[0] && _boardData[1] == _winCondition[1] && _boardData[2] == _winCondition[2] && _boardData[3] == _winCondition[3] && _boardData[4] == _winCondition[4] && _boardData[5] == _winCondition[5] && _boardData[6] == _winCondition[6] && _boardData[7] == _winCondition[7] && _boardData[8] == _winCondition[8] && _boardData[9] == _winCondition[9] && _boardData[10] == _winCondition[10] && _boardData[11] == _winCondition[11] && _boardData[12] == _winCondition[12] && _boardData[13] == _winCondition[13] && _boardData[14] == _winCondition[14] && _boardData[15] == _winCondition[15] && _boardData[16] == _winCondition[16] && _boardData[17] == _winCondition[17] && _boardData[18] == _winCondition[18] && _boardData[19] == _winCondition[19] && _boardData[20] == _winCondition[20] && _boardData[21] == _winCondition[21] && _boardData[22] == _winCondition[22] && _boardData[23] == _winCondition[23] && _boardData[24] == _winCondition[24]) {
				_score += 200;
				_level += 1;
				_SndVictory.play();
				FlxG.state = new TransState();
			} else if (_timer > 0) {
				_timer -= FlxG.elapsed;
				
				if (_timer <= 0 && _score <= 100) {
					_score = 0;
					FlxG.state = new EndGame(_level);
				} else if (_timer <= 0) {
					_score -= 100;
					FlxG.state = new EndState(_level);
				}
			}
			score();
			clock();
            super.update();
        }
        
		private function drawBoard():void
		{
			
			//row 1
			for (var n:int = 0; n < 5; n += 1)
			{
				var _buttonOn:int = new int(_boardData[n]);
				_theGrid[n] = lyrSprites.add(new bombButton(3+n*31, 43, _buttonOn));
			}
			//row 2
			for (n; n < 10; n += 1)
			{
				_buttonOn = _boardData[n];
				_theGrid[n] = lyrSprites.add(new bombButton(3+(n-5)*31, 74, _buttonOn));
			}
			//row 3
			for (n; n < 15; n += 1)
			{
				_buttonOn = _boardData[n];
				_theGrid[n] = lyrSprites.add(new bombButton(3+(n-10)*31, 105, _buttonOn));
			}
			//row 4
			for (n; n < 20; n += 1)
			{
				_buttonOn = _boardData[n];
				_theGrid[n] = lyrSprites.add(new bombButton(3+(n-15)*31, 136, _buttonOn));
			}
			//row 5
			for (n; n < 25; n += 1)
			{
				_buttonOn = _boardData[n];
				_theGrid[n] = lyrSprites.add(new bombButton(3+(n-20)*31, 167, _buttonOn));
			}
		}
		
		private function clickCheck():void
		{
			//beep
			//FlxG.play(SndButton);
			
			//pts4time
			if (FlxG.mouse.screenY >= 14 && FlxG.mouse.screenY <= 27 && FlxG.mouse.screenX >= 62 && FlxG.mouse.screenX <= 101 && _score >= 50) {
				if (_timer <= 55) {
					_timer += 5;
				} else {
					_timer = 60;
				}
				_score -= 50;
			}
			
			//row 1
			if (FlxG.mouse.screenY >= 44 && FlxG.mouse.screenY < 73)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(0);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(1);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(2);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(3);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(4);
				}
			}
			
			//row 2
			else if (FlxG.mouse.screenY >= 75 && FlxG.mouse.screenY < 104)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(5);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(6);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(7);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(8);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(9);
				}
			}
			
			//row 3
			else if (FlxG.mouse.screenY >= 106 && FlxG.mouse.screenY < 135)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(10);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(11);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(12);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(13);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(14);
				}
			}
			
			//row 4
			else if (FlxG.mouse.screenY >= 137 && FlxG.mouse.screenY < 166)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(15);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(16);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(17);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(18);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(19);
				}
			}

			//row 5
			else if (FlxG.mouse.screenY >= 168 && FlxG.mouse.screenY < 197)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(20);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(21);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(22);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(23);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton(24);
				}
			}
		}
		
		private function clickCheck2():void
		{
			//beep
			//FlxG.play(SndButton);
			
			//pts4time
			if (FlxG.mouse.screenY >= 14 && FlxG.mouse.screenY <= 27 && FlxG.mouse.screenX >= 62 && FlxG.mouse.screenX <= 101 && _score >= 50) {
				if (_timer <= 55) {
					_timer += 5;
				} else {
					_timer = 60;
				}
				_score -= 50;
			}
			
			//row 1
			if (FlxG.mouse.screenY >= 44 && FlxG.mouse.screenY < 73)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(0);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(1);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(2);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(3);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(4);
				}
			}
			
			//row 2
			else if (FlxG.mouse.screenY >= 75 && FlxG.mouse.screenY < 104)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(5);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(6);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(7);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(8);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(9);
				}
			}
			
			//row 3
			else if (FlxG.mouse.screenY >= 106 && FlxG.mouse.screenY < 135)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(10);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(11);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(12);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(13);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(14);
				}
			}
			
			//row 4
			else if (FlxG.mouse.screenY >= 137 && FlxG.mouse.screenY < 166)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(15);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(16);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(17);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(18);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(19);
				}
			}

			//row 5
			else if (FlxG.mouse.screenY >= 168 && FlxG.mouse.screenY < 197)
			{
				if (FlxG.mouse.screenX > 3 && FlxG.mouse.screenX < 33) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(20);
				} else if ( FlxG.mouse.screenX > 34 && FlxG.mouse.screenX < 64 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(21);
				} else if ( FlxG.mouse.screenX > 65 && FlxG.mouse.screenX < 95 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(22);
				} else if ( FlxG.mouse.screenX > 96 && FlxG.mouse.screenX < 126 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(23);
				} else if ( FlxG.mouse.screenX > 127 && FlxG.mouse.screenX < 157 ) {
					_score += 1;
					FlxG.play(SndButton);
					toggleButton2(24);
				}
			}
		}
		
		private function toggleButton(b:int):void
		{
			if (_boardData[b] == 0) {
				_boardData[b] = 1;
			} else {
				_boardData[b] = 0;
			}
			if ( b != 4 && b != 9 && b != 14 && b != 19 && b != 24)
			{
				if (_boardData[b+1] == 0) {
					_boardData[b+1] = 1;
				} else {
					_boardData[b+1] = 0;
				}
			}
			if ( b!= 20 && b != 21 && b != 22 && b != 23 && b != 24){
				if (_boardData[b+5] == 0) {
					_boardData[b+5] = 1;
				} else {
					_boardData[b+5] = 0;
				}
			}
			if ( b != 0 && b != 5 && b != 10 && b != 15 && b != 20) {
				if (_boardData[b-1] == 0) {
					_boardData[b-1] = 1;
				} else {
					_boardData[b-1] = 0;
				}
			}
			if( b != 0 && b != 1 && b != 2 && b != 3 && b != 4){
				if (_boardData[b-5] == 0) {
					_boardData[b-5] = 1;
				} else {
					_boardData[b-5] = 0;
				}
			}
			drawBoard();
		}
		
		private function toggleButton2(b:int):void
		{
			if (_boardData[b] == 0) {
				_boardData[b] = 1;
			} else if (_boardData[b] == 1) {
				_boardData[b] = 2;
			} else { _boardData[b] = 0; }
			if ( b != 4 && b != 9 && b != 14 && b != 19 && b != 24)
			{
				if (_boardData[b+1] == 0) {
					_boardData[b+1] = 1;
				} else if (_boardData[b+1] == 1) {
					_boardData[b+1] = 2;
				} else {
					_boardData[b+1] = 0;
				}
			}
			if ( b!= 20 && b != 21 && b != 22 && b != 23 && b != 24){
				if (_boardData[b+5] == 0) {
					_boardData[b+5] = 1;
				} else if (_boardData[b+5] == 1) {
					_boardData[b+5] = 2;
				} else {
					_boardData[b+5] = 0;
				}
			}
			if ( b != 0 && b != 5 && b != 10 && b != 15 && b != 20) {
				if (_boardData[b-1] == 0) {
					_boardData[b-1] = 1;
				} else if (_boardData[b-1] == 1) {
					_boardData[b-1] = 2;
				} else {
					_boardData[b-1] = 0;
				}
			}
			if( b != 0 && b != 1 && b != 2 && b != 3 && b != 4){
				if (_boardData[b-5] == 0) {
					_boardData[b-5] = 1;
				} else if (_boardData[b-5] == 1) {
					_boardData[b-5] = 2;
				} else {
					_boardData[b-5] = 0;
				}
			}
			drawBoard();
		}
		
		private function toggleTest(w:int):void
		{
			if (_boardTest[w] == 0) {
				_boardTest[w] = 1;
			} else {
				_boardTest[w] = 0;
			}
			if ( w != 4 && w != 9 && w != 14 && w != 19 && w != 24)
			{
				if (_boardTest[w+1] == 0) {
					_boardTest[w+1] = 1;
				} else {
					_boardTest[w+1] = 0;
				}
			}
			if ( w!= 20 && w != 21 && w != 22 && w != 23 && w != 24){
				if (_boardTest[w+5] == 0) {
					_boardTest[w+5] = 1;
				} else {
					_boardTest[w+5] = 0;
				}
			}
			if ( w != 0 && w != 5 && w != 10 && w != 15 && w != 20) {
				if (_boardTest[w-1] == 0) {
					_boardTest[w-1] = 1;
				} else {
					_boardTest[w-1] = 0;
				}
			}
			if( w != 0 && w != 1 && w != 2 && w != 3 && w != 4){
				if (_boardTest[w-5] == 0) {
					_boardTest[w-5] = 1;
				} else {
					_boardTest[w-5] = 0;
				}
			}
		}
		
		private function toggleTest2(w:int):void
		{
			if (_boardTest[w] == 0) {
				_boardTest[w] = 1;
			} else if (_boardTest[w] == 1) {
				_boardTest[w] = 2;
			} else { _boardTest[w] = 0; }
			if ( w != 4 && w != 9 && w != 14 && w != 19 && w != 24)
			{
				if (_boardTest[w+1] == 0) {
					_boardTest[w+1] = 1;
				} else if (_boardTest[w+1] == 1) {
					_boardTest[w+1] = 2;
				} else {
					_boardTest[w+1] = 0;
				}
			}
			if ( w!= 20 && w != 21 && w != 22 && w != 23 && w != 24){
				if (_boardTest[w+5] == 0) {
					_boardTest[w+5] = 1;
				} else if (_boardTest[w+5] == 1) {
					_boardTest[w+5] = 2;
				} else {
					_boardTest[w+5] = 0;
				}
			}
			if ( w != 0 && w != 5 && w != 10 && w != 15 && w != 20) {
				if (_boardTest[w-1] == 0) {
					_boardTest[w-1] = 1;
				} else if (_boardTest[w-1] == 1) {
					_boardTest[w-1] = 2;
				} else {
					_boardTest[w-1] = 0;
				}
			}
			if( w != 0 && w != 1 && w != 2 && w != 3 && w != 4){
				if (_boardTest[w-5] == 0) {
					_boardTest[w-5] = 1;
				} else if (_boardTest[w-5] == 1) {
					_boardTest[w-5] = 2;
				} else {
					_boardTest[w-5] = 0;
				}
			}
		}
		
		private function clock():void
		{
			_timerInt = _timer;
			lyrHUD.add(new blackOut(62, 14));
			if(_timerInt >= 10) {
				_timeDisplay = new FlxText(60, 10, FlxG.width, "0:" + _timerInt.toString());
			} else if (_timerInt < 10 && _timer >= 0){
				_timeDisplay = new FlxText(60, 10, FlxG.width, "0:0" + _timerInt.toString());
			}
			if (_timer <= 5 && _seenHint != true)
			{
				_timeHint = new FlxText(0, 30, FlxG.width, "Click Timer: -50 pts, +5 sec")
				_timeHint.setFormat(null, 8, 0xFFFFFFFF, "center");
				lyrHUD.add(_timeHint);
				//_seenHint = true;
			}
			_timeDisplay.setFormat(null, 16, 0xFFFFFFFF);
			lyrHUD.add(_timeDisplay);
		}
		
		private function score():void
		{
			lyrHUD.add(new bigBlackOut(0, 200));
			_scoreDisplay = new FlxText(0, 200, FlxG.width, _score.toString() + " pts");
			_scoreDisplay.setFormat(null, 16, 0xFFFFFFFF, "right");
			lyrHUD.add(_scoreDisplay);
		}
		
		public function makeSolvable():void
		{
			_boardData = new Array();
			
			for (var j:int = 0; j < 20; j += 1)
			{
				if (_boardTest[j] == 1) {
					toggleTest(j + 5); 
				}
			}
			
			if ( _boardTest[20] == 0 && _boardTest[21] == 0 && _boardTest[22] == 0 && _boardTest[23] == 0 && _boardTest[24] == 0)
			{
				for (var q:int = 0; q < 25; q += 1)
				{
					_boardData[q] = _boardCache[q];
					trace(_boardCache);
					trace(_boardData);
					trace(_boardTest);
				}
			} else if ( _boardTest[20] == 0 && _boardTest[21] == 0 && _boardTest[22] == 0 ) {
				makeTestable();
			} else { gSolve(); }
		}
		
		public function makeSolvable2():void
		{
			_boardData = new Array();
			
			for (var j:int = 0; j < 20; j += 1)
			{
				if (_boardTest[j] == 1) {
					toggleTest2(j + 5); 
					toggleTest2(j + 5); 
				} else if (_boardTest[j] == 2) {
					toggleTest2(j + 5); 
				}
			}
			
			if ( _boardTest[20] == 0 && _boardTest[21] == 0 && _boardTest[22] == 0 && _boardTest[23] == 0 && _boardTest[24] == 0)
			{
				for (var q:int = 0; q < 25; q += 1)
				{
					_boardData[q] = _boardCache[q];
					trace(_boardCache);
					trace(_boardData);
					trace(_boardTest);
				}
			} else if ( _boardTest[20] == 0 && _boardTest[21] == 0 ) {
				makeTestable2();
			} else { gSolve2(); }
		}
		
		public function gSolve():void
		{
			if (_boardTest[20] == 1) {
				toggleTest(3);
				toggleTest(4);
			} else if (_boardTest[21] == 1) {
				toggleTest(1);
				toggleTest(4);
			} else if (_boardTest[22] == 1) {
				toggleTest(3);
			}
			makeSolvable();
		}
		
		public function gSolve2():void
		{
			if (_boardTest[20] == 1) {
				toggleTest2(1);
				toggleTest2(1);
			} else if (_boardTest[20] == 2) {
				toggleTest(1);
			} else if (_boardTest[21] == 1) {
				toggleTest2(0);
				toggleTest2(0);
				toggleTest2(1);
				toggleTest2(1);
			} else if (_boardTest[21] == 2) {
				toggleTest2(0);
				toggleTest2(1);
			}
			makeSolvable2();
		}
		
		public function makeTestable():void
		{
			_boardCache = new Array();
			_boardTest = new Array();
				
			for (var i:int = 0; i < 25; i += 1)
			{
				_boardCache[i] = Math.round(Math.random());
			}
				
			for (var k:int = 0; k < 25; k += 1)
			{
				_boardTest[k] = _boardCache[k];
			}
			makeSolvable();
		}
		
		public function makeTestable2():void
		{
			_boardCache = new Array();
			_boardTest = new Array();
				
			for (var i:int = 0; i < 25; i += 1)
			{
				_boardCache[i] = Math.round(Math.random()) + Math.round(Math.random());
			}
				
			for (var k:int = 0; k < 25; k += 1)
			{
				_boardTest[k] = _boardCache[k];
			}
			makeSolvable2();
		}
		
		public function levels(_level:int):void
		{
			if (_level == 0) {
				_boardData = new Array(0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 1) {
				_boardData = new Array(1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 2) {
				_boardData = new Array(0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 3) {
				_boardData = new Array(0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 4) {
				_boardData = new Array(1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 5) {
				_boardData = new Array(0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 6) {
				_boardData = new Array(0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 7) {
				_boardData = new Array(1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level > 7 && _level < 15) {
				makeTestable();
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 15)  {
				_boardData = new Array(0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 16)  {
				_boardData = new Array(1, 2, 0, 0, 0, 2, 1, 2, 0, 0, 0, 2, 1, 2, 0, 0, 0, 2, 1, 2, 0, 0, 0, 2, 1);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 17)  {
				_boardData = new Array(2, 1, 1, 0, 0, 1, 2, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 2, 1, 0, 0, 1, 1, 2);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 18)  {
				_boardData = new Array(0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 2, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 19)  {
				_boardData = new Array(0, 0, 2, 2, 0, 0, 0, 2, 0, 1, 0, 0, 2, 2, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level == 20)  {
				_boardData = new Array(2, 0, 0, 0, 2, 0, 1, 0, 1, 0, 0, 2, 1, 2, 0, 0, 0, 2, 0, 0, 0, 1, 1, 1, 0);
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			} else if (_level > 20) {
				makeTestable2();
				_winCondition = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			}
			
		}
		
    }    
} 