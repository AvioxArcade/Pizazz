/// @description 


fire_trail.move(mouse_x,mouse_y);

if mouse_check_button_pressed(mb_left) {
	create_pizazz(PzParticle.fire).move(mouse_x,mouse_y).
			size(100,100,ps_shape_ellipse,ps_distr_gaussian).burst(200).finish();
}
	