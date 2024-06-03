/// @description 

//fire cursor
if keyboard_check_pressed(vk_space)
	fire_cursor.pause_resume();

fire_cursor.move(mouse_x,mouse_y);

pz_warp.move(mouse_x,mouse_y)

//burst
if mouse_check_button_pressed(mb_left) {	
	create_pizazz(PzParticle.fire).move(mouse_x,mouse_y).
			size(100,100,ps_shape_ellipse,ps_distr_gaussian).burst(200).finish();
}

//line
if mouse_check_button_pressed(mb_right){
	fire_line.stream();
	linex2 = mouse_x;
	liney2 = mouse_y;
}
	
if mouse_check_button(mb_right) {
	fire_line.line(mouse_x,mouse_y,linex2,liney2)
}

if mouse_check_button_released(mb_right){
	fire_line.stream(0);	
}