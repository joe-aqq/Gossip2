/// @function    __string_clean()
/// @description Cleans a string with bracket commands into a string without commands.\
/// @param {real} str The string to clean.
function __string_clean(str){
	var new_str = str;
	var still_dirty = true;
	while(still_dirty) {
		var next_bracket_pos = string_pos("[", new_str);
		if(next_bracket_pos == 0) {
			still_dirty = false;
		} else {
			var bracket_close_pos = string_pos("]", new_str);
			new_str = string_delete(new_str, next_bracket_pos, bracket_close_pos - next_bracket_pos + 1);
		}
	}
	return new_str;
}