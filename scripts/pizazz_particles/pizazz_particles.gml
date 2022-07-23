
enum PzParticle{
	fire, fire_spark,
}
	
//fire
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
global.__PizzazPart[PzParticle.fire] = p;

//fire_spark
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
global.__PizzazPart[PzParticle.fire_spark] = p;



function __pizzaz_get_particle(p){
	///@arg Particle.p
	return global.__PizzazPart[p];	
}