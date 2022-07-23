# ✨ Pizazz ✨

**Pizazz** is a library/wrapper for working with GM's built-in particle systems.

It simplifies working with basic paricle systems by storing relevant data in structs and dynamically doing a lot of work for you.

The only major setup required is creating/defining your particles in pizazz_particles.
Afterward, Pizazz can use those particles and assign them to particle systems and emitters as requested.

- ### [Download the YYPMS](https://github.com/AvioxArcade/Pizazz/releases)
- ### [View the Pizazz Wiki](https://github.com/AvioxArcade/Pizazz/wiki)

## Examples 
### Quick Setup
Traditionally, to create a particle system and immediately use it, your code would look something like this:
	  
```gml
//traditional method
ps = part_system_create();
em1 = part_emitter_create(ps);
part_emitter_region(ps,em1,x-5,x+5,y-5,y+5,ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(ps,em1,global.fire_particle,6);
```
		
With Pizazz, the same result could be coded as:

 ```gml
 //with Pizazz
 pz_fire = create_pizazz(PzParticle.fire).burst(6)
 ```
### Quick Destroy
Or how about destroying particle systems? 
Does this look familiar?
```gml
//traditional method
part_emitter_stream(ps,em1,global.fire_particle,0);
if (part_particles_count(ps)) == 0 {
    part_system_destroy(system);
}
```

Pizazz can  destroy particle systems automatically as soon as an effect is done, so one-time-use 
effects are possible in just one line of code:
```gml
//with Pizazz
create_pizazz(PzParticle.fire).move(x,y).burst(10).finish();
```

For more information on using Pizazz, please check out the [the Wiki](https://github.com/AvioxArcade/Pizazz/wiki)
