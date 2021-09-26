/// @function    __string_array_to_asset_array()
/// @description Turns an array of strings into an array of gamemaker assets.
/// @param {real} str_arry The array of strings. 
function __string_array_to_asset_array(strarr){
	var asset_array = [];
	for(var i = 0; i < array_length(strarr); i++) {
		var asset_name = string(strarr[i]);
		var asset = asset_get_index(asset_name);
		if(asset <= -1) {
			show_error("Gossip Error! Asset \"" + strarr[i] + "\" could not be found.", true);
			return;
		} else {
			array_push(asset_array, asset);	
		}
	}
	return asset_array;
}