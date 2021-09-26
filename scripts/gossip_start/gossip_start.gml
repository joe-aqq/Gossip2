/// @function    gossip_start()
/// @description Starts a gossip conversation.
/// @param {real} dialogue_sheet The name of the sheet.
/// @param {real} conversation_key The conversation key to use.
function gossip_start(dialogue_sheet, conversation_key){
	with(obj_gossip) {
		current_alpha = 0;
		current_message = gossip_get_message_from_conversation_key(dialogue_sheet, conversation_key);
		gossip_message_changed();
		textbox_state = gossip_textbox_states.init;
	}
}