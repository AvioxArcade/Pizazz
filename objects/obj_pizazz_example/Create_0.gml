/// @description 

//version 1
fire_trail = create_pizazz(PzParticle.fire,3)
fire_trail.add_emitter(PzParticle.fire_spark,-10);
fire_trail.move(mouse_x,mouse_y).stream();
//*/

/*/version 2
fire_trail = create_pizazz(PzParticle.fire)
fire_trail.add_emitter(PzParticle.fire_spark).emit_factor(.05);
fire_trail.move(mouse_x,mouse_y).stream(3);
//*/
