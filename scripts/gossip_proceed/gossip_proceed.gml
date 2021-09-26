/// @function    gossip_proceed()
/// @description Moves gossip onto the next message.
function gossip_proceed(){
	with(obj_gossip) {
		current_message = gossip_get_message_from_row_number(current_message.sheet_index, current_message.row_number + 1);
	}
}