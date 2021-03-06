
#region Set up player controls
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
upRelease = keyboard_check_released(vk_up);

#endregion

#region state machine
switch (state)
{
#region move state

	case player.moving:
	if (horizontalSpeed == 0)
	{
		sprite_index = spr_player_idle;
	}
	else
	{
		sprite_index = spr_player_walk;
	}
	if (!place_meeting(x, y + 1, obj_solid))
	{
		verticalSpeed += gravityAcceleration
		sprite_index = spr_player_jump;
		image_index = (verticalSpeed > 0);
		
		if (upRelease and verticalSpeed < -6)
		{
			verticalSpeed = -3;
		}
	}
	else
	{
		verticalSpeed = 0;
		
		if (up)
		{
			verticalSpeed = jumpHeight;
			audio_play_sound(snd_jump, 5, false);
		}
	}
	if (horizontalSpeed != 0)
	{
		image_xscale = sign(horizontalSpeed);
	}
	if (right or left)
	{
		horizontalSpeed += (right - left) * acceleration;
		horizontalSpeed = clamp(horizontalSpeed, -maxSpeed, maxSpeed);
	}
	else
	{
		horizontalSpeed = 0;
		//apply_friction(acceleration);
	}
		
	if (place_meeting(x, y + verticalSpeed + 1, obj_solid) and verticalSpeed > 0)
	{
		audio_play_sound(snd_step, 5, false);
	}
	
	move(obj_solid);
	
	var falling = y - yprevious > 0;
	var wasntWall = !position_meeting(x + grabWidth * image_xscale, yprevious, obj_solid);
	var isWall = position_meeting(x + grabWidth * image_xscale, y, obj_solid);
	
	if (falling and wasntWall and isWall)
	{
		horizontalSpeed = 0;
		verticalSpeed = 0;
		
		while (!place_meeting(x + image_xscale, y, obj_solid))
		{
			x += image_xscale;
		}
		
		while (position_meeting(x + grabWidth * image_xscale, y - 1, obj_solid))
		{
			y -= 1;
		}
		
		sprite_index = spr_ledge_grab;
		state = player.ledgeGrab;
		
		audio_play_sound(snd_step, 6, false);
	}
	
	break;
	
#endregion
#region ledge grab state
	case player.ledgeGrab:
		if (down)
		{
			state = player.moving;
		}
		if (up)
		{
			state = player.moving;
			verticalSpeed = jumpHeight;
		}
		
	break;
#endregion
#region door state
	case player.door:
	sprite_index = spr_player_exit;
		if (image_alpha > 0)
		{
			image_alpha -= .05;
		}
		else
		{
			room_goto_next();
		}
	
	break;
#endregion
#region hurt state
	case player.hurt:
		sprite_index = spr_player_hurt;
		
		if (horizontalSpeed != 0)
		{
			image_xscale = sign(horizontalSpeed);
		}
		
		if (!place_meeting(x, y + 1, obj_solid))
		{
			verticalSpeed += gravityAcceleration;
		}
		else
		{
			verticalSpeed = 0;
			horizontalSpeed = 0;
		}
		direction_move_bounce(obj_solid);
		
		if (horizontalSpeed == 0 and verticalSpeed == 0)
		{
			if (obj_player_stats.hp <= 0)
			{
				state = player.death;
			}
			else
			{
				image_blend = c_white
				state = player.moving;
			}
		}
	
	break;
#endregion
#region death state
	case player.death:
		with (obj_player_stats)
		{
			hp = maxHp;
			sapphires = 0;
		}
		
		room_restart();
	
	break;
#endregion
}
#endregion

