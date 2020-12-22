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
	break;
	#endregion
}