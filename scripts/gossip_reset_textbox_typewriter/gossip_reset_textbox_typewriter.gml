/// @function    gossip_reset_textbox_typewriter()
/// @description Resets the textbox typewriter state.
function gossip_reset_textbox_typewriter() {
	with(obj_gossip) {
		textbox_allow_speed_up = true;
		textbox_scribble.typewriter_reset();
		textbox_scribble.typewriter_ease
		(
			textbox_typewriter.ease.ease_method,
			textbox_typewriter.ease.offset.x,
			textbox_typewriter.ease.offset.y,
			textbox_typewriter.ease.scale.x,
			textbox_typewriter.ease.scale.y,
			textbox_typewriter.ease.rotation,
			textbox_typewriter.ease.alpha_duration
		);
	}
}