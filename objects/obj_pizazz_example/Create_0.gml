/// @description 

pz_warp = create_pizazz(ps_warp)

//normal fire
fire_cursor = create_pizazz(PzParticle.fire,3)
fire_cursor.add_emitter(PzParticle.fire_ember,-10).offsets(0,-10)
fire_cursor.stream().pause_resume();

///fire line
linex2 = room_width/2
liney2 = room_height/2
fire_line = create_pizazz(PzParticle.fire,10).line(0,0,linex2,liney2)
