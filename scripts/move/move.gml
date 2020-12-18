/// @param collision_object
function move(collisionObject){
	
	if (place_meeting(x + horizontalSpeed, y, collisionObject))
	{
		while (!place_meeting(x + sign(horizontalSpeed), y, collisionObject))
		{
			x += sign(horizontalSpeed);
		}
		horizontalSpeed = 0;
	}
	
	x += horizontalSpeed;
	y += verticalSpeed;
}