/// @function    gossip_select_choice()
/// @description Selects a choice from the option box.
/// @param {real} choice_index The numerical index of the currently selected answer.
function gossip_select_choice(choice_index) {
	with(obj_gossip) {
		var conversation_key = current_message.answers[choice_index].goto;
		var sheet_name = gossip_sheet_index_to_name(current_message.sheet_index);
		current_message = gossip_get_message_from_conversation_key(sheet_name, conversation_key);
	}
}