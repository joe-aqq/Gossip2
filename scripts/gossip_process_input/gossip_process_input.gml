/// @function    gossip_process_input()
/// @description Processes input for gossip every frame. Set up your controls here.
function gossip_process_input() {
	with(obj_gossip) {
		input_holding = keyboard_check(ord("Z"));
		input_proceed = keyboard_check_pressed(ord("Z"));
		input_proceed_release = keyboard_check_released(ord("Z"));
		input_skip = keyboard_check_pressed(ord("X"));
		input_up = keyboard_check_pressed(vk_up);
		input_down = keyboard_check_pressed(vk_down);
	}
}