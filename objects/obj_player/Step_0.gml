
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
		
	
	move(obj_solid);
	break;
#endregion
#region ledge grab state
	case player.ledgeGrab:
	
	break;
#endregion
#region door state
	case player.door:
	
	break;
#endregion
#region hurt state
	case player.hurt:
	
	break;
#endregion
#region death state
	case player.death:
	
	break;
#endregion
}
#endregion

