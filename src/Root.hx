import flash.media.Sound;
import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.events.Event;
import starling.events.KeyboardEvent;

//[Embed(source="../media/sounds/testedit.wav")]
//public const MOVE_SOUND:Class;

class Root extends Sprite {

    public static var assets:AssetManager;
    public var first_screen:Image;


    public function new() {
        super();
    }

    public function start(startup:Startup) {

        assets = new AssetManager();
	    assets.enqueue("assets/dino_lose.png");
        assets.enqueue("assets/first_screen_no_pants_or_pencil.png");
        assets.enqueue("assets/first_screen_no_pants.png");
        assets.enqueue("assets/first_screen_no_paper.png");
        assets.enqueue("assets/first_screen_no_pencil.png");
        assets.enqueue("assets/first_screen.png");
        assets.enqueue("assets/lose.png");
        assets.enqueue("assets/ready_for_school.png");
        assets.enqueue("assets/sleep_lose.png");
        assets.enqueue("assets/tv_lose.png");
        assets.enqueue("assets/win_pants.png");
        assets.enqueue("assets/you_win.png");
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
						first_screen = new Image(Root.assets.getTexture("first_screen"));
                        first_screen.x = 0;
                        first_screen.y = 0;
						first_screen = new Image(Root.assets.getTexture("first_screen"));
                        first_screen.x = 0;
                        first_screen.y = 0;
						first_screen = new Image(Root.assets.getTexture("first_screen"));
                        first_screen.x = 0;
                        first_screen.y = 0;
						first_screen = new Image(Root.assets.getTexture("first_screen"));
                        first_screen.x = 0;
                        first_screen.y = 0;
						first_screen = new Image(Root.assets.getTexture("first_screen"));
                        first_screen.x = 0;
                        first_screen.y = 0;
						first_screen = new Image(Root.assets.getTexture("first_screen"));
                        first_screen.x = 0;
                        first_screen.y = 0;
						first_screen = new Image(Root.assets.getTexture("first_screen"));
                        first_screen.x = 0;
                        first_screen.y = 0;
                        addChild(first_screen);
                        addChild(first_screen_no_pants_or_pencil);
                        addChild(first_screen_no_pants);
                        addChild(first_screen_no_pencil);
                        addChild(lose);
                        addChild(ready_for_school);
                        addChild(sleep_lose);
                        addChild(tv_lose);
                        addChild(win_pants);
                        addChild(you_win);
                        addChild(dino_lose);
                    }

                });
            }

        });
    }
	


}
