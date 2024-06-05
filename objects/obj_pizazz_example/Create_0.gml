
//HTML5 skips the final example, because htlm5 be htlm5
pages = 3;
if os_browser == browser_not_a_browser
	pages = 4;	


page = 0;
page_text = [
	"One-time use Pizazz Elements\n\nLeft-Click - create single-use fire burst",
	"Typical \"stream\" particle system\n\nLeft-Click - toggle off/on",
	"Line emitter\n\nLeft-Click (and drag) - create fire line\nRight-Click - clear line",
	"Create from Particle System Asset (visual editor)"

]

change_page = function(_to_page){
	
	_to_page = _to_page mod pages;
	if (_to_page < 0) _to_page = pages-1;
	
	if page != _to_page {
		//leave page
		switch(page){
			case 1: fire_cursor.finish();	break;
			case 2: fire_line.finish();		break;
			case 3: pz_warp.finish();		break;
		}
		//go to new page
		switch(_to_page){
			case 1: //toggle cursor
				//create
				fire_cursor = create_pizazz(PzParticle.fire,3).move(mouse_x,mouse_y);
				fire_cursor.add_emitter(PzParticle.fire_ember,-10).offsets(0,-10)
				fire_cursor.stream();
			break;
			case 2: //line
				linex2 = 0;
				liney2 = 0;
				fire_line = create_pizazz(PzParticle.fire)
								.line(100,120,200,120).stream(10);				
			break;
			case 3: //asset
				pz_warp = create_pizazz(ps_warp).stream();
			break;
		}
		page = _to_page;
		
	}
}



