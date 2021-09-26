/// @function    gossip_set_style()
/// @description Sets the style of the textbox. Can be run multiple times to change style mid-game.
function gossip_set_style() {
	
	with(obj_gossip) {
		
		//Textbox
		textbox_font = "fnt_gossip_default"; //The font of the textbox text
		textbox_font_color  = "c_white"; //The default color of the textbox text
		textbox_line_height = 10; //The vertical seperation of lines of text
		textbox_theme = spr_gossip_textbox_themes; //The sprite for the textbox
		textbox_theme_index = 0; //The sprite index for the textbox theme
		textbox_is_tiled = true; //Whether the textbox is a tiled sprite (3x3)
		draw_textbox = true; //Whether the textbox should be drawn
		textbox_transition_in = gossip_transitions.sweep_down; //The type of in-transition for the textbox
		textbox_transition_out = gossip_transitions.sweep_down; //The type of out-transition for the textbox
		textbox_transition_speed = 6; //The multiplier speed for the textbox transition
		textbox_proceed_arrow = spr_gossip_proceed_arrow; //The proceed arrow sprite
		textbox_proceed_arrow_speed = 5; //The speed of the arrow's movement (snap must be set to false)
		
		textbox_typewriter = { //A struct representing the textbox typewriter options for scribble
			is_enabled: true,
			speed: .35,
			speedup: 4,
			smoothness: 1,
			ease: {
				ease_method: SCRIBBLE_EASE.LINEAR,
				offset: {
					x: 0,
					y: 10
				},
				scale: {
					x: 0,
					y: 0
				},
				rotation: 0,
				alpha_duration: .2
			}
		};

		textbox_position = { //The position of the textbox
			x: 0,
			y: 500
		};

		textbox_dimensions = { //The dimensions of the textbox
			width: 1280,
			height: 220
		};

		textbox_padding = { //The padding values for the textbox
			left:   198,
			right:  18,
			top:    18,
			bottom: 18
		};
		
		textbox_proceed_arrow_offset = { //The offset for the textbox's proceed arrow
			x: 5,
			y: 4
		};

		//Nametag
		nametag_font = "fnt_gossip_default"; //The font for the nametag text
		nametag_font_color  = "c_white"; //The default color of the nametag text
		nametag_theme = spr_gossip_textbox_themes; //The sprite for the nametag
		nametag_theme_index = 0; //The sprite index for the nametag sprite
		nametag_is_tiled = true; //Whether the nametag is a tiled sprite (3x3)
		nametag_is_fit = true; //Whether the nametag is fit to the current name
		nametag_min_width = 200; //The minimum width for fit textboxes
		draw_nametag = true; //Whether the nametag is drawn
		
		nametag_typewriter = { //A struct representing the nametag typewriter options for scribble
			is_enabled: false,
			speed: .35,
			smoothness: 1,
			ease: {
				ease_method: SCRIBBLE_EASE.QUAD,
				offset: {
					x: 0,
					y: 0
				},
				scale: {
					x: 0,
					y: 0
				},
				rotation: 0,
				alpha_duration: 1
			}
		};

		nametag_offset = { //The offset for the nametag (relative to the textbox)
			x: 0,
			y: -52
		};

		nametag_dimensions = { //The dimensions of the nametag (width is automatic if nametag is fit)
			width: 400,
			height: 55
		};

		nametag_padding = { //the padding for the nametag
			left:   18,
			right:  18,
			top:    18,
			bottom: 18
		};

		//Portrait
		portrait_behind = false; //Whether the portrait is drawn behind or in front of the textbox
		portrait_speed = 0; //The animation speed of the portrait sprite

		portrait_offset = { //The offset of the portrait relative to the textbox
			x: 20,
			y: 20
		};
		
		//Question box
		question_box_font = "fnt_gossip_default"; //The font for the textbox answers
		question_box_font_color = "c_white"; //The default font color for answers
		question_box_theme = spr_gossip_textbox_themes; //The sprite theme for the question box
		question_box_theme_index = 0; //The sprite theme index for the question box
		question_box_location = gossip_question_box_locations.top_right; //The location for the question box relative to the textbox
		question_box_option_spacing = 5; //The vertical spacing between each answer
		question_box_option_arrow = spr_gossip_choice_hand; //The sprite for the question box hand
		question_box_option_arrow_speed = 30; //The speed of the question box arrow
		
		question_box_offset = { //The offset for the question box (added to the question box location)
			x: 0,
			y: 3
		};

		question_box_padding = { //The padding for the question box
			left:   18,
			right:  18,
			top:    18,
			bottom: 18
		};
	}
}