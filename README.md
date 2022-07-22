# Pizazz

Pizazz is a library/wrapper for working with GM's built-in particle systems.

It is meant to simplify working with basic paricle systems in a way that stores most of the system's
variables inside struct elements to simplify what you need to provide for each interaction.

The only major setup required is creating/defining your particles in pizazz_particles.
Afterward, Pizazz can use those particles and assign them to particle systems and emitters as requested.

- ### [Download the YYPMS](https://github.com/AvioxArcade/Pizazz/releases)
- ### [View the Pizazz Wiki](https://github.com/AvioxArcade/Pizazz/wiki)

## Quickstart
Traditionally, to create a particle system and immediately use them, your code would look something like this:
	  
```gml
ps = part_system_create();
em1 = part_emitter_create(ps);
part_emitter_region(ps,em1,x-5,x+5,y-5,y+5,ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(ps,em1,global.fire_particle,6);
```
		
With Pizazz, the same result could be coded as:

 ```gml
 pz_fire = create_pizazz(PzParticle.fire).burst(6)
 ```

Alternatively, with the same degree of customization (not using default values):
 ```gml
 pz_fire = create_pizazz(PzParticle.fire).move(x,y).size(10,10,ps_shape_ellipse,ps_distr_linear).burst(6);
```
Pizazz can also destroy particle systems automatically as soon as an effect is done, so one-time-use 
effects are possible in just one line of code:
```gml
create_pizazz(PzParticle.fire).move(x,y).burst(10).finish();
```

For more information on using Pizazz, please check out the [the Wiki](https://github.com/AvioxArcade/Pizazz/wiki)
