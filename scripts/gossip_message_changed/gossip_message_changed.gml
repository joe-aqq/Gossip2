/// @function    gossip_message_changed()
/// @description Runs when the gossip message has changed.
function gossip_message_changed(){
	with(obj_gossip) {
		textbox_scribble = scribble(current_message.text);
		nametag_scribble = scribble(current_message.name);
		gossip_reset_textbox_typewriter();
	}
}