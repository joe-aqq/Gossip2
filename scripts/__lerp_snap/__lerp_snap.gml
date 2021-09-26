/// @function    __lerp_snap()
/// @description interpolates a value between two points, if the result is over the goal point, snap it to that point.
/// @param {real} from The value to lerp from.
/// @param {real} to The value to lerp to.
/// @param {real} amt The interpolation value.
function __lerp_snap(from, to, lerp_amt){
	var result = lerp(from, to, lerp_amt);
	if(abs(result - to) <= .01) {
		result = to;	
	} else {
		if(from < to) {
			if(result > to) result = to;
		} else if(from > to) {
			if(result < to) result = to;	
		}
	}
	return result;
}