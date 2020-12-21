with (obj_player_stats)
{
	++hp;
	if (hp > maxHp)
	{
		hp = maxHp;
	}
}
with (other)
{
	instance_destroy();
}