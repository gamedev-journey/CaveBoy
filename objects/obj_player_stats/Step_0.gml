if (keyboard_check_pressed(vk_space) and room == rm_title)
{
	room_goto(rm_one);
	audio_stop_sound(msc_title);
	audio_play_sound(msc_cave, 10, true);
}

if (!audio_is_playing(msc_title) and !audio_is_playing(msc_cave))
{
	audio_play_sound(msc_cave, 10, true);
}
