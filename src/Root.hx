import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;

class Root extends Sprite {

    public static var assets:AssetManager;
    public var preGame:Image;

    public function new() {
        super();
    }

    public function start(startup:Startup) {

        assets = new AssetManager();
        assets.enqueue("assets/pre game.png");
        assets.loadQueue(function onProgress(ratio:Float) {

            if (ratio == 1) {

                Starling.juggler.tween(startup.loadingBitmap, 1.5, {
                    transition: Transitions.LINEAR,
                        delay: 0,
                        alpha: 0,
                        onComplete: function() {
                        startup.removeChild(startup.loadingBitmap);
                        preGame = new Image(Root.assets.getTexture("pre game"));
                        preGame.x = 0;
                        preGame.y = 0;
                        addChild(preGame);
                    }

                });
            }

        });
    }

}
