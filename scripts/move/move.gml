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
	
	if (place_meeting(x, y + verticalSpeed, collisionObject))
	{
		while (!place_meeting(x, y + sign(verticalSpeed), collisionObject))
		{
			y += sign(verticalSpeed);
		}
		verticalSpeed = 0;
	}	
	
	y += verticalSpeed;
}