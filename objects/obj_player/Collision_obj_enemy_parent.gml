var above_enemy = y < other.y + verticalSpeed;
var falling = verticalSpeed > 0;

if (above_enemy and (falling or state == player.ledgeGrab))
{
	if (!place_meeting(x, yprevious, obj_solid))
	{
		y = yprevious;
	}
	
	while (!place_meeting(x, y + 1, other))
	{
		y++;
	}
	
	with (other)
	{
		instance_destroy();
	}
	
	verticalSpeed = -(16 / 3);
	audio_play_sound(snd_step, 6, false);
}
else
{
	take_damage();
}