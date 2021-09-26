/// @function    gossip_init_transition()
/// @description Initializes gossip's transition phase.
function gossip_init_transition() {
	
	//Check the transition type
	switch(textbox_transition_in) {
			
		#region Fade-in
		
		case(gossip_transitions.fade_in):

			current_alpha = 0;
			current_dimensions.width = 1;
			current_dimensions.height = 1;
			current_offset.x = 0;
			current_offset.y = 0;

		break;
		
		#endregion
		
		#region Sweep left
			
		case(gossip_transitions.sweep_left):
			
			current_alpha = 0;
			current_dimensions.width = 1;
			current_dimensions.height = 1;
			current_offset.x = -textbox_dimensions.width;
			current_offset.y = 0;
			
		break;
		
		#endregion
		
		#region Sweep right
			
		case(gossip_transitions.sweep_right):
			
			current_alpha = 0;
			current_dimensions.width = 1;
			current_dimensions.height = 1;
			current_offset.x = textbox_dimensions.width;
			current_offset.y = 0;
			
		break;
		
		#endregion
		
		#region Sweep down
			
		case(gossip_transitions.sweep_down):
			
			current_alpha = 0;
			current_dimensions.width = 1;
			current_dimensions.height = 1;
			current_offset.x = 0;
			current_offset.y = -textbox_dimensions.height;
			
		break;
		
		#endregion
		
		#region Sweep up
			
		case(gossip_transitions.sweep_up):
			
			current_alpha = 0;
			current_dimensions.width = 1;
			current_dimensions.height = 1;
			current_offset.x = 0;
			current_offset.y = textbox_dimensions.height;
			
		break;
		
		#endregion
		
		#region None
			
		default:
			
			current_alpha = 1;
			current_dimensions.width = 1;
			current_dimensions.height = 1;
			current_offset.x = 0;
			current_offset.y = 0;
			
		break;
		
		#endregion
			
	}
	
	//Finish initializing, go to opening state (transition phase)
	textbox_state = gossip_textbox_states.opening;
}