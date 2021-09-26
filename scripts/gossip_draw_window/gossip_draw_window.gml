enum gossip_window_sides {
	ws_left,
	ws_right,
	ws_top,
	ws_bottom
}

/// @function    gossip_draw_window()
/// @description Draws a window sprite given a base theme sprite. Height and width should be divisible by 3.
/// @param {real} x The x position of the window.
/// @param {real} y The y position of the window.
/// @param {real} width The width of the window.
/// @param {real} height the height of the window.
/// @param {real} theme the theme of the sprite
/// @param {real} theme_index The image index of the sprite theme.
function gossip_draw_window(x_pos, y_pos, width, height, theme, theme_index){
	
	//Get the size of one cell (assuming sprite is 3x3)
	var cell_size = (1/3) * sprite_get_width(theme);
	
	//Lock width and height to a minimum value to avoid sprite overlap
	var min_scale = cell_size * 2;
	width = (width < min_scale) ? min_scale : width;
	height = (height < min_scale) ? min_scale : height;

	#region Drawing Corners
	
	//Draw top-left corner
	draw_sprite_part(theme, theme_index, 0, 0, cell_size, cell_size, x_pos, y_pos);
	
	//Draw top-right corner
	draw_sprite_part(theme, theme_index, cell_size * 2, 0, cell_size, cell_size, x_pos + width - cell_size, y_pos);
	
	//Draw bottom-left corner
	draw_sprite_part(theme, theme_index, 0, cell_size * 2, cell_size, cell_size, x_pos, y_pos + height - cell_size);
	
	//Draw bottom-right corner
	draw_sprite_part(theme, theme_index, cell_size * 2, cell_size * 2, cell_size, cell_size, x_pos + width - cell_size, y_pos + height - cell_size);
	
	#endregion
	
	#region Drawing Fills
	
	//Draw top fill
	gossip_draw_window_side(x_pos + cell_size, y_pos, gossip_window_sides.ws_top, theme, theme_index, width - (cell_size * 2));
	
	//Draw bottom fill
	gossip_draw_window_side(x_pos + cell_size, y_pos + height - cell_size, gossip_window_sides.ws_bottom, theme, theme_index, width - (cell_size * 2));

	//Draw left fill
	gossip_draw_window_side(x_pos, y_pos + cell_size, gossip_window_sides.ws_left, theme, theme_index, height - (cell_size * 2));
	
	//Draw right fill
	gossip_draw_window_side(x_pos + width - cell_size, y_pos + cell_size, gossip_window_sides.ws_right, theme, theme_index, height - (cell_size * 2));
	
	//Draw center fill
	draw_sprite_part_ext(theme, theme_index, cell_size, cell_size, 1, 1, x_pos + cell_size, y_pos + cell_size, width - (cell_size * 2), height - (cell_size * 2), draw_get_color(), draw_get_alpha());
	
	#endregion
}



function gossip_draw_window_side(x_pos, y_pos, side, theme, theme_index, length) {
	
	//Get the size of one cell (assuming sprite is 3x3)
	var cell_size = (1/3) * sprite_get_width(theme);
	
	switch(side) {
		
		//Draw left side
		case(gossip_window_sides.ws_left):
		
			var current_height = 0;
			
			while(current_height + cell_size < length) {
				draw_sprite_part(theme, theme_index, 0, cell_size, cell_size, cell_size, x_pos, y_pos + current_height);
				current_height += cell_size;
			}
			
			draw_sprite_part(theme, theme_index, 0, cell_size, cell_size, abs(current_height - length), x_pos, y_pos + current_height);

		break;
		
		//Draw right side
		case(gossip_window_sides.ws_right):
		
			var current_height = 0;
			
			while(current_height + cell_size < length) {
				draw_sprite_part(theme, theme_index, cell_size * 2, cell_size, cell_size, cell_size, x_pos, y_pos + current_height);
				current_height += cell_size;
			}
			
			draw_sprite_part(theme, theme_index, cell_size * 2, cell_size, cell_size, abs(current_height - length), x_pos, y_pos + current_height);

		break;
		
		//Draw top side
		case(gossip_window_sides.ws_top):
		
			var current_width = 0;
			
			while(current_width + cell_size < length) {
				draw_sprite_part(theme, theme_index, cell_size, 0, cell_size, cell_size, x_pos + current_width, y_pos);
				current_width += cell_size;
			}

			draw_sprite_part(theme, theme_index, cell_size, 0, abs(current_width - length), cell_size, x_pos + current_width, y_pos);

		break;
		
		//Draw bottom side
		case(gossip_window_sides.ws_bottom):
		
			var current_width = 0;
			
			while(current_width + cell_size < length) {
				draw_sprite_part(theme, theme_index, cell_size, cell_size * 2, cell_size, cell_size, x_pos + current_width, y_pos);
				current_width += cell_size;
			}

			draw_sprite_part(theme, theme_index, cell_size, cell_size * 2, abs(current_width - length), cell_size, x_pos + current_width, y_pos);

		break;
		
	}
	
}	