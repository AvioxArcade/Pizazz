# Pizazz

Pizazz is a library/wrapper for working with GM's built-in particle systems.

It is meant to simplify working with basic paricle systems in a way that stores most of the system's
variables inside struct elements to simplify what you need to provide for each interaction.

The only major setup required is creating/defining your particles in pizazz_particles. 
Afterward, Pizazz can use those particles and assign them to particle systems and emitters as requested.
Additionally, you may set some default values in pizazz_config

TRADITIONALLY, to create a particle system and immediately use them, your code would look something like this:
	  
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

## Example Usage

The following example will create a new effect with two different emitters/particles. The first
emitter will use `PzParticle.fire` and be given a default stream/burst amount of `3`. 

The second emitter will use `PzParticle.spark` and be given a default stream/burst amount of `-10` (1/10 chance per frame).
Then the whole sytem will then be moved to the given location and begin streaming from each emitter
at the provided emit defaults.
```gml
fire = create_pizazz(PzParticle.fire,3);
fire.add_emitter(PzParticle.fire_spark,-10);
fire.move(x,y).stream();
```
When using multiple emitters, another option instead of using emit defaults is to set an "emit factor" 
for each emitter.
The following code will create a similar setup as above, except the emit factors will be set to 1 and .5, 
which will override any set emit defaults.
the third line of code will then move the emitters, burst 12 particles from the `PzParticle.fire` 
emitter and 6 particles from `PzParticle.spark` emitter (because of the `.5` emit factor), then queue
the system to be automatically destroyed after all particles are gone.
```gml
fire = create_pizazz(PzParticle.fire).emit_factor(1)
fire.add_emitter(PzParticle.spark).emit_factor(.5)
fire.move(x,y).burst(12).finish();
```
