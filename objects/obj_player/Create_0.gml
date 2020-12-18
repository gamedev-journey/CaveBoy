maxSpeed = 4;
horizontalSpeed = 0;
verticalSpeed = 0;
acceleration = 1;
gravityAcceleration = 0.5;
jumpHeight = -9;
grabWidth = 18;

image_xscale = 1;

enum player 
{
	moving,
	ledgeGrab,
	door,
	hurt,
	death
}

state = player.moving;