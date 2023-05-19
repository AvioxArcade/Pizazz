/// @description 

linex2 = room_width/2
liney2 = room_height/2

//version 1
fire_trail = create_pizazz(PzParticle.fire,3)
fire_trail.add_emitter(PzParticle.fire_ember,-10).offsets(0,-10)
fire_trail.move(mouse_x,mouse_y).stream();

fire_line = create_pizazz(PzParticle.fire,10).line(0,0,linex2,liney2).stream();
//*/

/*/version 2
fire_trail = create_pizazz(PzParticle.fire)
fire_trail.add_emitter(PzParticle.fire_spark).emit_factor(.05);
fire_trail.move(mouse_x,mouse_y).stream(3);
//*/
