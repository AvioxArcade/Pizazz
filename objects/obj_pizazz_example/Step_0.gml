/// @description 


switch(page) {

	case 0: {
		//burst
		if mouse_check_button_pressed(mb_left) {	
			create_pizazz(PzParticle.fire).move(mouse_x,mouse_y)
				.size(100,100,ps_shape_ellipse,ps_distr_gaussian)
				.burst(200).finish();
		}
	} break;
	case 1: {
		fire_cursor.move(mouse_x,mouse_y);
		
		if mouse_check_button_pressed(mb_left)
			fire_cursor.pause_resume();
	} break;
	case 2: {
		if mouse_check_button_pressed(mb_left){
			linex2 = mouse_x;
			liney2 = mouse_y;
		}
		if mouse_check_button(mb_left) {
			fire_line.line(mouse_x,mouse_y,linex2,liney2);
			var _len = point_distance(mouse_x,mouse_y,linex2,liney2);
			fire_line.stream(_len/5);
		}
		if mouse_check_button(mb_right) {
			fire_line.stream(0);	
		}
	} break;
	
}

if keyboard_check_pressed(vk_left) {
	change_page(page-1)
}
	
if keyboard_check_pressed(vk_right) {
	change_page(page+1)
}
