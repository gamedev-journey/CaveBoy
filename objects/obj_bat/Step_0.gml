switch (state)
{
	#region bat idle
	case bat.idle:
		image_index = spr_bat_idle;
		if (instance_exists(obj_player))
		{
			var dis = point_distance(x, y, obj_player.x, obj_player.y);
			if (dis < sight)
			{
				state = bat.chase;
			}
		}
	break;
	#endregion
	
	#region bat chase
	case bat.chase:
		if (instance_exists(obj_player))
		{
			var dir = point_direction(x, y, obj_player.x, obj_player.y);
			horizontalSpeed = lengthdir_x(max_speed, dir);
			verticalSpeed = lengthdir_y(max_speed, dir);
			sprite_index = spr_bat_flying;
			if (horizontalSpeed != 0)
			{
				image_xscale = sign(horizontalSpeed);
			}
			
			move(obj_solid);
		}
	break;
	#endregion
}