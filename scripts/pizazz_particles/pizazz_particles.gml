/// Creates a collection of particles for use with Pizazz
///
/// N.B. This script isn't required. You may delete this from your project
///	and set up your particles elsewhere.


enum PzParticle{
	fire, fire_ember,
}

//Create a particles map if we don't already have one
//We have to do this in case another system function is executed before this one
if (!variable_global_exists("__pizazz_particles")) global.__pizazz_particles = ds_map_create();

//create fire particle
var p = part_type_create();
	part_type_shape(		p, pt_shape_smoke);
	part_type_size(			p, 0.1, 0.20, -0.01, 0);
	part_type_scale(		p, 1, 1);
	part_type_orientation(	p, 0, 360, 0, 0, 0);
	part_type_color3(		p, $000080, $0080ff, $00ffff);
	part_type_alpha3(		p, 1, 1, 0.10);
	part_type_blend(		p, 1);
	part_type_life(			p, 40, 50);
	part_type_speed(		p, 0.25, .4, -.01, 0);
	part_type_direction(	p, 90, 90, 0, 0);
	part_type_gravity(		p, 0.08, 90);

pizazz_add_particle(p,PzParticle.fire);

//create fire ember particle
p = part_type_create();
	part_type_shape(		p, pt_shape_pixel);
	part_type_size(			p, 0.4, 0.4, 0, 0);
	part_type_scale(		p, 1, 1);
	part_type_orientation(	p, 0, 0, 0, 0, 0);
	part_type_color3(		p, $0080FF, $0080FF, $0000FF);
	part_type_alpha3(		p, 1, 1, 0);
	part_type_blend(		p, 1);
	part_type_life(			p, 50, 60);
	part_type_speed(		p, 0.1, .5, 0, 0);
	part_type_direction(	p, 70, 110, 0, 20);
	part_type_gravity(		p, 0.03, 90);

pizazz_add_particle(p,PzParticle.fire_ember);
