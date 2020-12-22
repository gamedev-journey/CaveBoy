if (state == spider.idle)
{
	if (instance_exists(obj_player))
	{
		horizontalSpeed = sign(obj_player.x - x) * max_speed;
		verticalSpeed = -abs(horizontalSpeed * 2);
	}
	
	move(obj_solid);
	state = spider.jump;
}