
//default values

#macro __pizazz_default_x				other.x
#macro __pizazz_default_y				other.y
#macro __pizazz_default_z				0
#macro __pizazz_default_em_width		5
#macro __pizazz_default_em_height		5
#macro __pizazz_default_em_shape		ps_shape_ellipse
#macro __pizazz_default_em_distr		ps_distr_linear
#macro __pizazz_emit_default			1					//the default burst/stream amount for each emitter if an amount isn't provided.


#macro __pizazz_option_autoUpdateDepth	true				//if the particle system depth should automatically be updated to the following formula when moved
#macro __pizazz_depth_formula			-yMid				//yMid is the y coordinate of the element's base y value.