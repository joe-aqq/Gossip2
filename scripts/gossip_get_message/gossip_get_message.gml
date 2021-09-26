/// @function    gossip_get_empty_message()
/// @description Returns an empty message struct.
function gossip_get_empty_message() {
	return {
		name: "",
		text: "",
		portrait: noone,
		sounds: noone,
		end_flag: false,
		question_flag: false,
		answers: [],
		option: "",
		goto: "",
		commands: "",
		conversation_key: "",
		sheet_index: 0,
		row_number: 0
	};
}

/// @function    gossip_get_message_from_conversation_key()
/// @description Gets a message given a sheet name and conversation key.
/// @param {real} sheet_name The name of the sheet.
/// @param {real} conversation_key The conversation key on the sheet.
function gossip_get_message_from_conversation_key(sheet_name, conversation_key) {

	//Get sheet index and row number of conversation index
	var sheet_index = global.gossip_dialogue_sheet_indexes[? sheet_name];
	
	if(is_undefined(sheet_index)) {
		show_error("Gossip Error! Dialogue sheet with name \"" + sheet_name + "\" does not exist.", false);	
		return;
	}
	
	var row_number = global.gossip_dialogue_sheet_lookup_tables[|sheet_index][? conversation_key];
	
	if(row_number > ds_grid_height(global.gossip_dialogue_sheets[|sheet_index])) {
		show_error("Gossip Error! Row number \"" + row_number + "\" out of bounds for dialogue sheet \"" + sheet_name + "\".", false);	
		return;
	}
	
	return gossip_get_message_from_row_number(sheet_index, row_number);
}

/// @function    gossip_get_message_from_row_number()
/// @description Gets a message given a sheet index and a row number.
/// @param {real} sheet_index The numerical index of the dialogue sheet.
/// @param {real} row_number The row number for the message.
function gossip_get_message_from_row_number(sheet_index, row_number) {
	
	//Create new empty message
	var msg = gossip_get_empty_message();
	
	//Get sheet index and row number of conversation index
	msg.sheet_index = sheet_index;
	msg.row_number = row_number;
	
	#region Set properties
	
	#region Name
	
	msg.name = ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.name,
		row_number
	);
	
	#endregion
	
	#region Text
	
	msg.text = ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.text,
		row_number
	);
	
	#endregion
	
	#region Portrait
	
	var portrait_name = ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.portrait,
		row_number
	);
	
	msg.portrait = asset_get_index(portrait_name);
	
	#endregion
	
	#region Sounds
	
	var sound_names = ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.sounds,
		row_number
	);
	
	msg.sounds = sound_names != "" ? __string_array_to_asset_array(__string_split(sound_names, ",")) : noone;
	
	#endregion
	
	#region End flag
	
	msg.end_flag = string_lower(ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.end_flag,
		row_number
	)) == "y";
	
	#endregion
	
	#region Question flag & answers
	
	msg.question_flag = string_lower(ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.question_flag,
		row_number
	)) == "y";
	
	if(msg.question_flag) {
		
		var end_reached = false;
		var check_row = row_number + 1;
		
		while(!end_reached) {
			
			var next_msg = gossip_get_message_from_row_number(sheet_index, check_row++);
			var option   = next_msg.option;
			var goto     = next_msg.goto;
			
			if(option != "") {
				
				array_push(msg.answers, 
				{
					option: option,
					goto: goto
				});
				
			} else {
				
				end_reached = true;
			}
		}
	}
	
	#endregion
	
	#region Option
	
	msg.option = ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.option,
		row_number
	);
	
	#endregion
	
	#region Goto
	
	msg.goto = ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.goto,
		row_number
	);
	
	#endregion
	
	#region Commands
	
	msg.commands = ds_grid_get
	(
		global.gossip_dialogue_sheets[|msg.sheet_index], 
		gossip_dialogue_sheet_columns.commands,
		row_number
	);
	
	#endregion
	
	#endregion
	
	return msg;
}