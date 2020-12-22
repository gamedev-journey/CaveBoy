switch (state)
{
		#region move right
			case snake.move_right:
				var wall_at_right = place_meeting(x + 1, y, obj_solid);
				var ledge_at_right = !position_meeting(bbox_right + 1, bbox_bottom + 1, obj_solid);
				if (wall_at_right or ledge_at_right)
				{
					state = snake.move_left;
				}
				
				image_xscale = 1;
				x += 1;
			break;
		
		#endregion
		
		#region move left
			case snake.move_left:
				var wall_at_left = place_meeting(x - 1, y, obj_solid);
				var ledge_at_left = !position_meeting(bbox_left - 1, bbox_bottom + 1, obj_solid);
				if (wall_at_left or ledge_at_left)
				{
					state = snake.move_right;
				}
				
				image_xscale = -1;
				x -= 1;
			break;
		
		#endregion
}