import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.events.Event;
import starling.events.KeyboardEvent;

class Root extends Sprite {

    public static var assets:AssetManager;
    public var first_screen:Image;
	public var got_items = 0;

    public function new() {
        super();
		update();
    }

 
    public function start(startup:Startup) {

        assets = new AssetManager();
        assets.enqueue("assets/first_screen.png");
        assets.enqueue("assets/testedit.mp3");
        assets.loadQueue(function onProgress(ratio:Float) {

            if (ratio == 1) {

                Starling.juggler.tween(startup.loadingBitmap, 1.5, {
                    transition: Transitions.LINEAR,
                        delay: 0,
                        alpha: 0,
                        onComplete: function() {
                        startup.removeChild(startup.loadingBitmap);
                        first_screen = new Image(Root.assets.getTexture("first_screen"));
                        first_screen.x = 0;
                        first_screen.y = 0;
                        addChild(first_screen);
						Root.assets.playSound("testedit");
                    }
                });
            }
        });
    }
	
	public function update(){
        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, checkInput);
    }
	
	private function checkInput(e:KeyboardEvent)
    {
        if(e.keyCode == 65){
			assets = new AssetManager();
			assets.enqueue("assets/first_screen_no_paper.png");
			assets.loadQueue(function onProgress(ratio:Float) {

            if (ratio == 1) {

                Starling.juggler.tween(first_screen, 1.5, {
                    transition: Transitions.LINEAR,
                        delay: 0,
                        alpha: 0,
                        onComplete: function() {
                        removeChild(first_screen);
                        first_screen = new Image(Root.assets.getTexture("first_screen_no_paper"));
                        first_screen.x = 0;
                        first_screen.y = 0;
                        addChild(first_screen);
                    }
					

                });
				
            }

			});
            
			got_items += 1;
			
		}
        else if(e.keyCode == 66){
            if (got_items == 1){
			
			assets = new AssetManager();
			assets.enqueue("assets/you_win.png");
			assets.loadQueue(function onProgress(ratio:Float) {

            if (ratio == 1) {

                Starling.juggler.tween(first_screen, 1.5, {
                    transition: Transitions.LINEAR,
                        delay: 0,
                        alpha: 0,
                        onComplete: function() {
                        removeChild(first_screen);
                        first_screen = new Image(Root.assets.getTexture("you_win"));
                        first_screen.x = 0;
                        first_screen.y = 0;
                        addChild(first_screen);
                    }
                });
            }
			});
			
			}
			else{
			
			assets = new AssetManager();
			assets.enqueue("assets/lose.png");
			assets.loadQueue(function onProgress(ratio:Float) {

            if (ratio == 1) {

                Starling.juggler.tween(first_screen, 1.5, {
                    transition: Transitions.LINEAR,
                        delay: 0,
                        alpha: 0,
                        onComplete: function() {
                        removeChild(first_screen);
                        first_screen = new Image(Root.assets.getTexture("lose"));
                        first_screen.x = 0;
                        first_screen.y = 0;
                        addChild(first_screen);
                    }
					

                });
				
            }

			});
			
			}
		}
    }
	
	
}
