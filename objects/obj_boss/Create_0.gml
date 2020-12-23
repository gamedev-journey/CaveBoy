horizontalSpeed = 0;
verticalSpeed = 0;
hp = 3;
sight = 128;

enum boss 
{
	idle,
	lift,
	chase,
	smash,
	stall
}

state = boss.idle;