with (instance_create_layer(x + random(sprite_width), y - sprite_height / 2, "lava", obj_particle))
{
	image_blend = c_yellow;
}

alarm[0] = random_range(10, 20);