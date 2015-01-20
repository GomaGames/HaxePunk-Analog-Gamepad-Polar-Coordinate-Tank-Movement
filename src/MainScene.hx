import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;

class MainScene extends Scene
{
  private var tank:Tank;

  public override function begin()
  {
    
    /*
      Create a player for every gamepad connected
     */

    if( Input.joystick( 0 ).connected ){
      
      /*
        Create a new instance of a Tank entity
       */
      tank = new Tank();

      /*
        Add the new entity to this scene
        http://haxepunk.com/documentation/api/com/haxepunk/Scene.html#add
       */
      add( tank );

    }else{
      trace( "Did not detect any gamepads. Connect a gamepad and restart this demo." );
    }
    
  }

}