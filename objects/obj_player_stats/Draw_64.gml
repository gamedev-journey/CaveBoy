if (room == rm_title)
{
	draw_set_halign(fa_center);
	draw_set_font(fnt_title);
	draw_text_color(room_width / 2 + 4, 24 + 6, "Niall of the Cave", c_black, c_black, c_black, c_black, 1);
	draw_text_color(room_width / 2, 24, "Niall of the Cave", c_white, c_white, c_white, c_white, 1);
	
	draw_set_font(fnt_start);
	draw_text_color(room_width / 2 + 1, room_height - 48 + 1, "Press Space to play", c_black, c_black, c_black, c_black, 0.7);
	draw_text_color(room_width / 2, room_height - 48, "Press Space to play", c_white, c_white, c_white, c_white, 1);
	

}

if (room != rm_title)
{
	for (var i = 1; i <= hp; ++i)
	{
		draw_sprite_ext(spr_heart, 0, (i * 25) - 10, 15, 1, 1, 0, c_white, 1);
	}
	
	draw_set_font(fnt_score);
	draw_set_halign(fa_left);
	draw_text(camera_get_view_width(view_camera[0]) - 120, 10, "Score: " + string(sapphires));
}