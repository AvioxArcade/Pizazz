/// Edit these values to your liking!
///
/// N.B. This script is executed on boot. You never need to run this script yourself!

#macro __pizazz_default_x				other.x				//starting x location (centered) of newly created pizazz elements
#macro __pizazz_default_y				other.y				//starting y location (centered) of newly created pizazz elements
#macro __pizazz_default_z				0					//starting z (height not considered by depth) of newly created pizazz elements.
#macro __pizazz_default_em_width		5					//default region width of newly created pizazz emitter elements.
#macro __pizazz_default_em_height		5					//default region height of newly created pizazz emitter elements.
#macro __pizazz_default_em_shape		ps_shape_ellipse	//default emitter shape fo newly created pizazz emitter elements.
#macro __pizazz_default_em_distr		ps_distr_linear		//default emitter distrobution of newly created pizazz emitter elements.
#macro __pizazz_emit_default			1					//the default burst/stream amount for each emitter if an amount isn't provided.

#macro __pizazz_option_autoUpdateDepth	true				//default setting for if a pizazz element's depth should automatically be updated when moved
#macro __pizazz_depth_formula			-(yMid+yOff)		//the calculation used to update a pizazz element's depth. 'yMid' is the middle of the emitter region
															//...(in case your game is using something other than 'depth = -y')
															//...If you want depth to be the bottom of the emitter, use -(yMid+yoff+(height/2))
