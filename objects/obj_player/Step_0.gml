
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

