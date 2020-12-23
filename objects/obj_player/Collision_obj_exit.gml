if (up and other.visible == true)
{
	y = yprevious;
	state = player.door;
	audio_play_sound(snd_exit, 4, false);
	audio_stop_sound(snd_jump);
	if (room == rm_boss)
	{
		game_restart();
	}
}

