maxSpeed = 4;
hSpeed = 0;
vSpeed = 0;
acceleration = 1;
gravityAcceleration = 0.5;
jumpHeight = -9;
grabWidth = 18;

enum player 
{
	moving,
	ledgeGrab,
	door,
	hurt,
	death
}

state = player.moving;