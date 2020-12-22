switch (state)
{
	#region spider idle
	case spider.idle:
		if (instance_exists(obj_player))
		{
			var dis = distance_to_object(obj_player);
			if (dis < sight and alarm[0] <= 0)
			{
				image_speed = 0.5;
				
				if (obj_player.x != x)
				{
					image_xscale = sign(obj_player.x - x);
				}
			}
		}
	break;
	#endregion
	
	#region spider jump
	case spider.jump:
		image_index = image_number - 1;
		
		if (!place_meeting(x, y + 1, obj_solid))
		{
			verticalSpeed += gravity_acceleration;
		}
		else
		{
			verticalSpeed = 0;
			horizontalSpeed = 0;
			
			if (horizontalSpeed == 0 and verticalSpeed == 0)
			{
				state = spider.idle;
				alarm[0] = 15;
				image_speed = 0;
				image_index = 0;
			}
		}
		
		if (horizontalSpeed != 0)
		{
			image_xscale = sign(horizontalSpeed);
		}
		
		move(obj_solid);
	break;
	#endregion
}