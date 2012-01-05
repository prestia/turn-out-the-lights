package  
{
	import org.flixel.*;
	import com.defusr.MenuState;
	
	[SWF(width = "320", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	
	public class defusr extends FlxGame
	{
		
		public function defusr():void
		{
			super(160, 240, MenuState, 2);
			FlxG.mouse.show();
		}
		
	}

}