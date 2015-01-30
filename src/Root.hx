import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.animation.IAnimatable;
import Std;
import flash.events.Event;


class Root extends Sprite {

    public static var assets:AssetManager;
    public var Door1:Image;
    public var Door2:Image;
    public var choice1:Int = 0;
    public var choice2:Int = 0;
    public var score:Int = 0;
    public var touched1:Bool = false;
    public var touched2:Bool = false;
    public var scoreText:TextField;
    public var overText:TextField;

    public function makeDoor(){
        choice1 = Std.random(9);
        if(choice1 <= 4){
            choice1 = 1;
            choice2 = 0;
        }
        else{
            choice1 = 0;
            choice2 = 1;
        }
    }

    public function new() {
        super();
    }

    public function start(startup:Startup) {

        assets = new AssetManager();
        assets.enqueue("assets/Door.png");
        assets.enqueue("assets/gameOver.png");
        assets.loadQueue(function onProgress(ratio:Float) {

            if (ratio == 1) {

                Starling.juggler.tween(startup.loadingBitmap, 2.0, {
                    transition: Transitions.EASE_OUT,
                        delay: 1.0,
                        alpha: 0,
                        onComplete: function() {
                        startup.removeChild(startup.loadingBitmap);
                        Door1 = new Image(Root.assets.getTexture("Door"));
                        Door1.x = 20;
                        Door1.y = 0;
                        Door2 = new Image(Root.assets.getTexture("Door"));
                        Door2.x = 200;
                        Door2.y = 0;
                        addChild(Door1);
                        Door1.addEventListener(TouchEvent.TOUCH, onTouch1);
                        addChild(Door2);
                        Door2.addEventListener(TouchEvent.TOUCH, onTouch2);
                        makeDoor();
                        displayScore();
                    }

                });
            }

        });
    }

    public function correctL(){
        makeDoor();
        //trace("door1:" + choice1 + "door2:" + choice2);
        if(choice1 == 1){
            score += 1;
            updateScore();
            displayScore();
            //trace("score:" + score);
            }
        else{
            Door1.removeEventListener(TouchEvent.TOUCH, onTouch1);
            Door2.removeEventListener(TouchEvent.TOUCH, onTouch2);
            overText = new TextField(500, 200, "Game Over!", "Times", 50, 0xFE0303);
            this.addChild(overText);
            displayScore();
        }
    }

    public function correctR(){
        makeDoor();
        //trace("door1:" + choice1 + "door2:" + choice2);
        if(choice2 == 1){
            score += 1;
            updateScore();
            displayScore();
            //trace("score:" + score);
            }
        else{
            overText = new TextField(500, 200, "Game Over!", "Times", 50, 0xFE0303);
            this.addChild(overText);
            Door1.removeEventListener(TouchEvent.TOUCH, onTouch1);
            Door2.removeEventListener(TouchEvent.TOUCH, onTouch2);
            displayScore();     
        }
    }

    public function displayScore(){
        //trace("display score");
        scoreText = new TextField(500, 50, "Score: ", "Times", 50, 0x02BF02);
        this.addChild(scoreText);
        scoreText.text += score;
    }

    public function updateScore(){
        //trace("Score updated");
        this.removeChild(scoreText);
    }

    public function onTouch1(event1:TouchEvent){
        var touch:Touch = event1.getTouch(this,TouchPhase.ENDED);
        if(touch!=null){
            //trace("Door1 was touched");
            correctL();
            };
    }

    public function onTouch2(event2:TouchEvent){
        var touch:Touch = event2.getTouch(this,TouchPhase.ENDED);
        if(touch!=null){
            //trace("Door2 was touched");
            correctR();
            };
    }

}
