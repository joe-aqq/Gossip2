/// @function    gossip_transition_in()
/// @description The transition-in phase for gossip.
function gossip_transition_in(){

	//If the animation is 99% done, snap it and call it complete
	var animation_thresh = .99;
	var done = false; //Whether the transition has finished yet
	
	//Check the transition type
	switch(textbox_transition_in) {
		
		#region Fade-in
			
		case(gossip_transitions.fade_in):
			
			current_alpha = lerp(current_alpha, 1, textbox_dt * textbox_transition_speed);
				
			if(current_alpha / 1 > animation_thresh) {
				current_alpha = 1;
				done = true;
			}
			
		break;
		
		#endregion
		
		#region Sweep left
			
		case(gossip_transitions.sweep_left):
			
			current_alpha = lerp(current_alpha, 1, textbox_dt * textbox_transition_speed);
			current_offset.x = lerp(current_offset.x, 0, textbox_dt * textbox_transition_speed);
				
			if(current_alpha / 1 > animation_thresh && textbox_dimensions.width - abs(current_offset.x) / textbox_dimensions.width > animation_thresh) {
				current_alpha = 1;
				current_offset.x = 0;
				done = true;
			}
			
		break;
		
		#endregion
		
		#region Sweep right
			
		case(gossip_transitions.sweep_right):
			
			current_alpha = lerp(current_alpha, 1, textbox_dt * textbox_transition_speed);
			current_offset.x = lerp(current_offset.x, 0, textbox_dt * textbox_transition_speed);
				
			if(current_alpha / 1 > animation_thresh && textbox_dimensions.width - abs(current_offset.x) / textbox_dimensions.width > animation_thresh) {
				current_alpha = 1;
				current_offset.x = 0;
				done = true;
			}
			
		break;
		
		#endregion
		
		#region Sweep down
			
		case(gossip_transitions.sweep_down):
			
			current_alpha = lerp(current_alpha, 1, textbox_dt * textbox_transition_speed);
			current_offset.y = lerp(current_offset.y, 0, textbox_dt * textbox_transition_speed);
				
			if(current_alpha / 1 > animation_thresh && textbox_dimensions.height - abs(current_offset.y) / textbox_dimensions.height > animation_thresh) {
				current_alpha = 1;
				current_offset.y = 0;
				done = true;
			}
			
		break;
		
		#endregion
		
		#region Sweep up
			
		case(gossip_transitions.sweep_up):
			
			current_alpha = lerp(current_alpha, 1, textbox_dt * textbox_transition_speed);
			current_offset.y = lerp(current_offset.y, 0, textbox_dt * textbox_transition_speed);
				
			if(current_alpha / 1 > animation_thresh && textbox_dimensions.height - abs(current_offset.y) / textbox_dimensions.height > animation_thresh) {
				current_alpha = 1;
				current_offset.y = 0;
				done = true;
			}
			
		break;
		
		#endregion
		
		#region None
			
		default:
			
			textbox_state = gossip_textbox_states.open;
			done = true;
			
		break;
		
		#endregion
	}
	
	//If the animation has finished, reset some timers and move on
	if(done) {
		portrait_timer = 0;
		question_box_arrow_timer = 0;
		textbox_state = gossip_textbox_states.open;
	}
	
}