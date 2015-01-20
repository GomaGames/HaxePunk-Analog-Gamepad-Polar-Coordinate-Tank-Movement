# HaxePunk-Analog-Gamepad-Polar-Coordinate-Tank-Movement
## Proof of concept - Move a simple shape around using polar coordinates with analog gamepad controls in tank style

A great starting point for game projects and game jams.  
See our other [HaxePunk Code Samples](https://github.com/GomaGames?query=HaxePunk)

----

## Move an Entity around using Polar Coordinate Movement with a gamepad like a tank

This is best for `tank` style movement, like a top down tank shooter.  

If you want even `x` **and** `y` angular movement, like a top down adventure game or a free moving space shooter (Geometry Wars style) then see this Proof of concept instead [HaxePunk-Analog-Gamepad-Polar-Coordinate-Movement](https://github.com/GomaGames/HaxePunk-Analog-Gamepad-Polar-Coordinate-Movement)

This demo autodetects your connected usb gamepad.  
If it's not found, reconnect it and restart this demo.  
This assumes a usb XBOX style gamepad, though other input configurations can be used, check the docs for:  

- [PS3 Gamepad](http://haxepunk.com/documentation/api/com/haxepunk/utils/PS3_GAMEPAD.html)
- [XBOX Gamepad](http://haxepunk.com/documentation/api/com/haxepunk/utils/XBOX_GAMEPAD.html)
- [OUYA Gamepad](http://haxepunk.com/documentation/api/com/haxepunk/utils/OUYA_GAMEPAD.html)
- [Joystick](http://haxepunk.com/documentation/api/com/haxepunk/utils/Joystick.html)
- [Touch](http://haxepunk.com/documentation/api/com/haxepunk/utils/Touch.html)


[see video](http://gfycat.com/FlimsyKnobbyCondor)  
![tank movement](http://zippy.gfycat.com/FlimsyKnobbyCondor.gif)  
_notice how reverse is set to a slower speed than forward_


Plug in a usb gamepad.  
Test this proof of concept.

Controls : 

- Left Analog Control Stick
  - `x` axis - rotate the tank base
  - `y` axis
    - `up` to move forward
    - `down`  to move in reverse (reverse has slower move speed)
- Right Analog Control Stick `x` axis - rotate the turret

Gamepads used : 

Aftermarket usb gamepad, [walmart link](http://www.walmart.com/ip/POWER-A-PS3-ProEX-Wired-Controller-Black-PS3-Playstation-3/14962336), [newegg link](http://www.newegg.com/Product/Product.aspx?Item=N82E16879815015)  
![USB Gampad](http://i5.walmartimages.com/dfw/dce07b8c-f05b/k2-_8c4a253a-abcf-474d-bf5c-f2c4725ce7f3.v1.jpg)

Logitech F310 usb gamepad - [newegg link](http://www.newegg.com/Product/Product.aspx?Item=N82E16826104402)  
![Logitech Gamepad](http://gaming.logitech.com/assets/47832/f310-gaming-gamepad-images.png)  
_on the back of this gamepad, there is a switch setting for `x` and `d`, set it to `d` if it's not detected (osx)_  

----

## To run this proof of concept

### Setup
_only need to do this once_

##### install Haxe  
http://haxe.org/download/

##### setup haxelib  

````
haxelib setup
````
the output will look something like this  
_just press the `Enter` key to accept defaults_

````
Please enter haxelib repository path with write access
Hit enter for default (/usr/lib/haxe/lib)
Path : 
````

##### install HaxePunk  
__using haxelib__

````
haxelib install HaxePunk
````

##### setup HaxePunk

````
haxelib run HaxePunk setup
...
Do you want to install the "lime" command? [y/n/a] ? y
````

#### If you have Sublime Text, get the Haxe Plugin

##### Get Sublime Text Package Control  
https://packagecontrol.io/installation

`ctrl + shift + p` to open the Sublime Text command palette  

![Command Palette](http://i.imgur.com/UlD29KO.png)

````
package install
````
"Haxe"

more information on [editors an IDEs](http://haxe.org/documentation/introduction/editors-and-ides.html#sublime)

----

## Testing

#### Run With Sublime Text Plugin

open this project in Sublime Text

open the `Main.hx` file

Choose compile target using `ctrl + shift + b`  

![compile target](http://i.imgur.com/8wFfZSe.png)

Test the project using the chosen target `ctrl + enter`


#### Run With Command Line

````
lime test neko 
````

----

Tank sprite came from [http://opengameart.org/content/tank-sprite](http://opengameart.org/content/tank-sprite)