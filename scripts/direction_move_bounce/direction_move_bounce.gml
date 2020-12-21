// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function direction_move_bounce(collisionObject){
	if (place_meeting(x + horizontalSpeed, y, collisionObject))
		{
			while (!place_meeting(x + sign(horizontalSpeed), y, collisionObject))
			{
				x += sign(horizontalSpeed);
			}
			horizontalSpeed = -(horizontalSpeed / 4);
		}
	
		x += horizontalSpeed;
	
		if (place_meeting(x, y + verticalSpeed, collisionObject))
		{
			while (!place_meeting(x, y + sign(verticalSpeed), collisionObject))
			{
				y += sign(verticalSpeed);
			}
			verticalSpeed = -(verticalSpeed / 4);
			if (abs(verticalSpeed) < 2)
			{
				verticalSpeed = 0;
			}
		}	
	
		y += verticalSpeed;
}