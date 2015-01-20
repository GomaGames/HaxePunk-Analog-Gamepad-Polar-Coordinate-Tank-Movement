import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Joystick;

class Tank extends Entity
{
  // set the movement speed
  private static inline var tank_forward_speed:Float = 5;
  private static inline var tank_reverse_speed:Float = 1;

  // set the rotation speed of the base
  private static inline var tank_pivot_speed:Float = 2;

  // set the rotation speed of the turret
  private static inline var turret_rotation_speed:Float = 2;

  /*
    The Image object for tank
   */
  private var tank_base:Image;
  private var turret:Image;

  /*
    Store tank motion speeds
   */
  private var tank_velocity:Float;            // forward velocity
  private var tank_angular_velocity:Float;    // tank's base rotation and direction
  private var turret_angular_velocity:Float;  // turret's rotation

  /*
    Store Player GamePad
   */
  private var player_gamepad:Joystick;

  /*
    Create a new Entity
    http://haxepunk.com/documentation/api/com/haxepunk/Entity.html
   */
  public function new(){
    
    this.player_gamepad = Input.joystick( 0 );

    super( 250 , 250 );

    /*
      Initialize player movement speed
     */
    tank_velocity = 0;
    tank_angular_velocity = 0;
    turret_angular_velocity = 0;


    /*
      Create a new Image graphic from an image asset
      
     */
    tank_base = new Image( "graphics/tankBase.png" );
    turret =  new Image( "graphics/tankTurret.png" );
    
    /*
      Make sure the shape rotates around a center origin
      instead of the default upper right corner
     */
    tank_base.originX = 16;
    tank_base.originY = 16;
    tank_base.scale = 1.5;

    turret.originX = 16;
    turret.originY = 16;
    turret.scale = 1.5;

    /*
      Add graphics to the Entity GraphicList
      http://haxepunk.com/documentation/api/com/haxepunk/Entity.html#addGraphic
     */
    this.addGraphic(tank_base);
    this.addGraphic(turret);

  }

  /*
    Performed by the game loop, updates all contained Entities.
    If you override this to give your Scene update code, remember to call super.update() or your Entities will not be updated.
    http://haxepunk.com/documentation/api/com/haxepunk/Scene.html#update
   */
  public override function update()
  {
    handleInput();

    handleAnimation();
    
    super.update();
  }

  /**
   * moves player
   */
  public inline function handleAnimation()
  {
    // base rotation
    tank_base.angle += tank_angular_velocity;

    // turret rotation, also moves "with" the base
    turret.angle += tank_angular_velocity + turret_angular_velocity;

    /*
      Move the shape
      http://haxepunk.com/documentation/api/com/haxepunk/Entity.html#moveAtAngle

      move at tank_basee.angle - 90 to move toward the direction of the image
     */
    this.moveAtAngle(tank_base.angle - 90, tank_velocity);
  }

  /**
   * Checks for gamepad input
   */
  private inline function handleInput()
  {

    /*
      X Axis controls the Tank Base Direction (angle)
     */
    if ( player_gamepad.getAxis( XBOX_GAMEPAD.LEFT_ANALOGUE_X ) != 0 ){

      // move shape towards negative x axis
      tank_angular_velocity = tank_pivot_speed * -player_gamepad.getAxis( XBOX_GAMEPAD.LEFT_ANALOGUE_X ) ;

    }else{

      // stop moving horizontally
      tank_angular_velocity *= .9; // set to = 0; to stop hard

    }

    /*
      Y Axis controls the Tank's forward and reverse movement
     */
    if ( player_gamepad.getAxis( XBOX_GAMEPAD.LEFT_ANALOGUE_Y ) != 0 ){

      // move shape towards negative y axis
      tank_velocity = (
        ( player_gamepad.getAxis( XBOX_GAMEPAD.LEFT_ANALOGUE_Y ) < 0 )?
        tank_forward_speed : tank_reverse_speed
      ) * player_gamepad.getAxis( XBOX_GAMEPAD.LEFT_ANALOGUE_Y );

    }else{

      // stop moving vertically
      tank_velocity *= .9; // set to = 0; to stop hard

    }

    /*
      Turret Rotation Control
      For OSX, LEFT_TRIGGER is registered as X axis for my test gamepad
     */
    if ( player_gamepad.getAxis( XBOX_GAMEPAD.LEFT_TRIGGER ) != 0 ){

      // rotate shape
      turret_angular_velocity = turret_rotation_speed * -player_gamepad.getAxis( XBOX_GAMEPAD.LEFT_TRIGGER );

    }else{

      // stop rotating
      turret_angular_velocity *= .9; // set to = 0; to stop hard

    }


  }

}