function apply_friction(amount){
	if (horizontalSpeed != 0)
	{
		if (abs(horizontalSpeed) - amount > 0)
		{
			{
				horizontalSpeed -= amount * image_xscale;
			}
		}
	}
	else
	{
		horizontalSpeed = 0;
	}
}