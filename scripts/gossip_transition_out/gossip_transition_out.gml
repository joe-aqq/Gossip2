/// @function    gossip_transition_out()
/// @description The transition-out phase for gossip.
function gossip_transition_out() {
	
	//If the animation is 99% done, snap it and call it complete
	var animation_thresh = .99;
	
	switch(textbox_transition_out) {
		
		#region Fade out
			
		case(gossip_transitions.fade_out):
			
			current_alpha = lerp(current_alpha, 0, textbox_dt * textbox_transition_speed);
				
			if(current_alpha < 1 - animation_thresh) {
				current_alpha = 0;
				textbox_state = gossip_textbox_states.closed;
			}
			
		break;
		
		#endregion
		
		#region Sweep left
			
		case(gossip_transitions.sweep_left):
			
			current_alpha = lerp(current_alpha, 0, textbox_dt * textbox_transition_speed);
			current_offset.x = lerp(current_offset.x, -textbox_dimensions.width, textbox_dt * textbox_transition_speed);
				
			if(current_alpha < 1 - animation_thresh) {
				current_alpha = 0;
				current_offset.x = -textbox_dimensions.width;
				textbox_state = gossip_textbox_states.closed;
			}
			
		break;
		
		#endregion
		
		#region Sweep right
			
		case(gossip_transitions.sweep_right):
			
			current_alpha = lerp(current_alpha, 0, textbox_dt * textbox_transition_speed);
			current_offset.x = lerp(current_offset.x, textbox_dimensions.width, textbox_dt * textbox_transition_speed);
				
			if(current_alpha < 1 - animation_thresh) {
				current_alpha = 0;
				current_offset.x = textbox_dimensions.width;
				textbox_state = gossip_textbox_states.closed;
			}
			
		break;
		
		#endregion
		
		#region Sweep down
			
		case(gossip_transitions.sweep_down):
			
			current_alpha = lerp(current_alpha, 0, textbox_dt * textbox_transition_speed);
			current_offset.y = lerp(current_offset.y, textbox_dimensions.height, textbox_dt * textbox_transition_speed);
				
			if(current_alpha < 1 - animation_thresh) {
				current_alpha = 0;
				current_offset.y = textbox_dimensions.height;
				textbox_state = gossip_textbox_states.closed;
			}
			
		break;
		
		#endregion
		
		#region Sweep up
			
		case(gossip_transitions.sweep_up):
			
			current_alpha = lerp(current_alpha, 0, textbox_dt * textbox_transition_speed);
			current_offset.y = lerp(current_offset.y, -textbox_dimensions.height, textbox_dt * textbox_transition_speed);
				
			if(current_alpha < 1 - animation_thresh) {
				current_alpha = 0;
				current_offset.y = -textbox_dimensions.height;
				textbox_state = gossip_textbox_states.closed;
			}
			
		break;
		
		#endregion
		
		#region None
			
		default:
			
			textbox_state = gossip_textbox_states.closed;
			
		break;
		
		#endregion
	
	}
	
}