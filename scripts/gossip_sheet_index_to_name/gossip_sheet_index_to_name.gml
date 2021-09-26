/// @function    gossip_sheet_index_to_name()
/// @description Converts a gossip sheet index into a sheet name.
/// @param {real} sheet_index the sheet index.
function gossip_sheet_index_to_name(sheet_index) {
	return global.gossip_dialogue_sheet_names[?string(sheet_index)];
}