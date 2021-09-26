//The columns for dialogue sheets (DO NOT CHANGE ORDER UNLESS YOU ACCOUNT FOR IT IN GOSSIP_GET_MESSAGE()!)
enum gossip_dialogue_sheet_columns {
	conversation_key,
	name, 
	text,
	portrait, 
	sounds,
	end_flag, 
	question_flag,
	option, 
	goto, 
	commands
}

/// @function    gossip_scan_dialogue_sheet()
/// @description Scans and indexes an individual dialogue sheet, adding it as a gossip resource.
function gossip_scan_dialogue_sheet(sheet_name) {
	
	//Concat file extension if it does not exist
	if(string_pos(".csv", sheet_name) == 0) sheet_name = string(sheet_name + ".csv");
	
	var sheet_name_no_ext = string_copy(sheet_name, 0, string_length(sheet_name) - 4);
	
	//Load sheet and add it to the sheet list
	var sheet = load_csv(sheet_name);
	
	if(is_undefined(sheet)) {
		show_error("Gossip Error! Dialogue sheet with name \"" + sheet_name + "\" does not exist.", true);
		return;
	}
	
	//Sets the lookup tables for names -> ids, and ids -> names
	global.gossip_dialogue_sheet_names[? string(ds_list_size(global.gossip_dialogue_sheets))] = sheet_name_no_ext;
	global.gossip_dialogue_sheet_indexes[? sheet_name_no_ext] = ds_list_size(global.gossip_dialogue_sheets);
	
	ds_list_add(global.gossip_dialogue_sheets, sheet);
	
	//Setup conversation key lookup table
	var lookup_table = ds_map_create();
	for(var row = 1; row < ds_grid_height(sheet); row++) {
		var key = sheet[# gossip_dialogue_sheet_columns.conversation_key, row];
		if(key != "") {
			lookup_table[? key] = row;
		}
	}
	
	//Add lookup table to lookup table list
	ds_list_add(global.gossip_dialogue_sheet_lookup_tables, lookup_table);
}