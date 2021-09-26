/// @function    __string_split()
/// @description Based on YellowAfterLife'str string split script for GMS 2.x
/// @param {real} str The string to split.
/// @param {real} delim The delimiter to split upon.
function __string_split(str, delimiter){
	var rl = ds_list_create();
	var p = string_pos(delimiter, str), o = 1;
	var dl = string_length(delimiter);
	ds_list_clear(rl);
	if (dl) while (p) {
	    ds_list_add(rl, string_copy(str, o, p - o));
	    o = p + dl;
	    p = string_pos_ext(delimiter, str, o);
	}
	ds_list_add(rl, string_delete(str, 1, o - 1));
	// create an array and store results:
	var rn = ds_list_size(rl);
	var rw = array_create(rn);
	for (p = 0; p < rn; p++) rw[p] = rl[|p];
	return rw;
}