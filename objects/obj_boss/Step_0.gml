switch (state)
{
	#region idle state
	case boss.idle:
		var dis = point_distance(x, y, obj_player.x, obj_player.y);
		if (dis <= sight)
		{
			state = boss.lift;
		}
	break;
	#endregion
	
	#region lift state
	case boss.lift:
		image_index = 1;
		verticalSpeed = -3.5;
		move(obj_solid);
		if (place_meeting(x, y - 64, obj_solid))
		{
			verticalSpeed = 0;
			state = boss.chase;
		}
	break;
	#endregion
	
	#region chase state
	case boss.chase:
		var dis = point_distance(x, y, obj_player.x, y);
		if (dis < (sprite_width / 2 - 16) or place_meeting(x - 1, y, obj_solid) or place_meeting(x + 1, y, obj_solid))
		{
			state = boss.smash;
			audio_play_sound(snd_jump, 6, false);
			horizontalSpeed = 0;
		}
		else
		{
			horizontalSpeed = (obj_player.x - x) * 0.015;
		}
		
		move(obj_solid);
	break;
	#endregion
	
	#region smash state
	case boss.smash:
		if (!place_meeting(x, y + 1, obj_solid))
		{
			if (verticalSpeed < 16)
			{
				verticalSpeed += 0.5;
			}
			move(obj_solid);
		}
		else
		{
			state = boss.stall;
			alarm[0] = room_speed;
			audio_play_sound(snd_step, 8, false);
			if (place_meeting(x, y, obj_lava))
			{
				hp -= 1;
				audio_play_sound(snd_snake, 9, false);
			}
		}
	break;
	#endregion
	
	#region stall state
	case boss.stall:
		image_index = 0;
		if (alarm[0] == -1) 
		{
			state = boss.lift;
		}
	break;
	#endregion
}

if (place_meeting(x, y, obj_lava))
{
	image_blend = c_red;
}
else
{
	image_blend = c_white;
}


if (hp <= 0)
{
	repeat(50)
	{
		var particle = instance_create_layer(bbox_left + random(sprite_width - 24), bbox_top + random(sprite_height), "lava", obj_particle);
		particle.image_blend = c_red;
	}
	instance_destroy();
}