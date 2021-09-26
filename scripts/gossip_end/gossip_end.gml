/// @function    gossip_end()
/// @description Ends the current gossip message.
function gossip_end(){
	with(obj_gossip) {
		current_message = gossip_get_empty_message();
		textbox_state = gossip_textbox_states.closing;
	}
}