// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function take_damage(){
	if (state != player.hurt)
	{
		state = player.hurt;
		
		audio_play_sound(snd_ouch, 8, false);
		
		image_blend = make_color_rgb(220, 150, 150);
		
		verticalSpeed = -6;
		horizontalSpeed = (sign(x - other.x) * 8);
		
		move(obj_solid)
		
		if (instance_exists(obj_player_stats))
		{
			obj_player_stats.hp -= 1;
		}
	}
}