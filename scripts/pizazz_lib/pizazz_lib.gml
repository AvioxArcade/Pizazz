#region init

	#macro __pizazz_version			"1.0.3 Alpha"
	#macro __pizazz_version_date	"July 22, 2022"

	__pizazz_echo("Welcome to Pizazz by LionArc! This is version" + __pizazz_version + " - " + __pizazz_version_date);

#endregion

#region public functions

	function create_pizazz(_particle=noone, _emit_default = __pizazz_emit_default){
		///@arg PzParticle.p
		///@arg [emit_default]
		var struct = new __pizazz_element()
		
		if _particle != noone
			struct.add_emitter(_particle, _emit_default)
			
		return struct
	}

#endregion

#region private functions

	function __pizazz_echo()
	{
	    var _string = "Pizazz: ";
    
	    var _i = 0
	    repeat(argument_count)
	    {
	        if (is_real(argument[_i]))
	        {
	            _string += string_format(argument[_i], 0, 4);
	        }
	        else
	        {
	            _string += string(argument[_i]);
	        }
        
	        ++_i;
	    }
    
	    show_debug_message(_string);
	}

	function __pizazz_element() constructor {
		system = part_system_create();
		xMid	= __pizazz_default_x;
		yMid	= __pizazz_default_y;
		xOff	= 0
		yOff	= 0
		z		= __pizazz_default_z;
		autoUpdate_depth = __pizazz_option_autoUpdateDepth;
		
		height	= __pizazz_default_em_width;
		width	= __pizazz_default_em_height;
		shape	= __pizazz_default_em_shape;
		distr	= __pizazz_default_em_distr;
		emitter = []
		emitter_qty = 0;
		time_source = noone;
		
		__update_depth();
		
		#region Emitter & Internal methods
		
			static __update_depth = function(_depth = __pizazz_depth_formula){
				part_system_depth(system,_depth);
			}
		
			__emitter_element = function(_particle, _emit_default, _pizazz_struct) constructor {
			
				parent			= _pizazz_struct
				system			= parent.system;
				ind				= part_emitter_create(system);
				
				particle		= __pizzaz_get_particle(_particle);
				emitter_factor	= 1;
				default_burst	= _emit_default;
				default_stream	= _emit_default;
				
				xMid			= parent.xMid;
				yMid			= parent.yMid;
				xOff			= parent.xOff;
				yOff			= parent.yOff;
				z				= parent.z;
				
				width = parent.width;
				height = parent.height;
				shape = parent.shape;
				distr = parent.distr;

				size(parent.width,parent.height);
				
				#region internal emitter methods
				
					static __update_region = function() {
						var _xx = (xMid+xOff)
						var _yy = (yMid+yOff)-z
						var _hw = width/2;
						var _hh = height/2;
						part_emitter_region(system,ind,_xx-_hw,_xx+_hw,_yy-_hw,_yy+_hw,shape,distr);
					}
					
				#endregion
				
				#region public emitter methods
				
					static size = function(_w,_h, _shape=shape, _distr=distr) {
					
						width = _w;
						height = _h;
						shape = _shape;
						distr = _distr;
					
						__update_region();
					
						return self;
					}
				
					static move = function(_x=xMid,_y=yMid,_z=z){
					
						xMid = _x;
						yMid = _y;
						z = _z;
						
						__update_region();
					
						return self;
					}
				
				
					static offsets = function(_xOff = xOff ,_yOff = yOff) {
						xOff = _xOff;
						yOff = _yOff;
						__update_region();
						return self;
					}
				
					static change_particle = function(__particle){
						particle = __pizzaz_get_particle(__particle);
						return self;
					}
				
					static burst = function(_amount=default_burst){
						
						if default_burst == 0 { //using emit_factor instead of defaults
							if _amount == 0
								__pizazz_echo(
									"Warning. trying to burst 0 particles from an emitter. ",
									"Make sure emit standards are set correctly."
								)
							_amount = _amount >= 0 ? _amount*emitter_factor : _amount/emitter_factor
							if _amount < 1 && _amount > 0
								_amount = -(1/_amount)
						}
						
						part_emitter_burst(system,ind,particle,_amount)	
						return self;
					}
				
					static stream = function(_amount=default_stream){
						
						if default_stream == 0 {
							_amount = _amount >= 0 ? _amount*emitter_factor : _amount/emitter_factor
							if _amount < 1 && _amount > 0
								_amount = -(1/_amount)
						}
												
						part_emitter_stream(system,ind,particle,_amount)	
						return self;
					}
					
					static emit_defaults = function(_burst_amount=default_burst,_stream_amount=default_stream){
						default_burst = _burst_amount;
						default_stream = _stream_amount;
						emitter_factor = 1;
						return self
					}
					
					static emit_factor = function(_factor = 1){
						emitter_factor = _factor;
						default_burst = 0;
						default_stream = 0;
						return self;
					}
					
				
				#endregion
				
			}
		
		#endregion
		
		static add_emitter = function(_particle, _emit_default = __pizazz_emit_default) {
			var new_emitter = new __emitter_element(_particle, _emit_default, self);
			emitter[emitter_qty] = new_emitter
			emitter_qty++
			return new_emitter;
		}
		
		static burst = function(amount=undefined){
			for (var i = 0; i < emitter_qty; ++i) {
			    var _emitter = emitter[i]
				if is_undefined(amount)
					_emitter.burst();
				else _emitter.burst(amount);
			}
			return self;
		}
		
		static stream = function(amount) {
			for (var i = 0; i < emitter_qty; ++i) {
			    var _emitter = emitter[i]
				if is_undefined(amount)
					_emitter.stream();
				else _emitter.stream(amount);
			}
			return self;
		}
		
		static move = function(_x=xMid,_y=yMid,_z=z, update_emitters=true, update_depth=autoUpdate_depth) {
			xMid = _x;
			yMid = _y;
			z = _z;
			
			if (update_depth)
				__update_depth();
			
			if update_emitters {
				var _ex = xMid;
				var _ey = yMid - z;
				for (var i = 0; i < emitter_qty; ++i) {
				    var _emitter = emitter[i];
					_emitter.xMid = xMid;
					_emitter.yMid = yMid;
					_emitter.z = z;
					
					_emitter.__update_region()
				}
			}
			
			return self;
			
		}
		
		static set_depth = function(_depth, auto_update = autoUpdate_depth){
			__update_depth(_depth);
			autoUpdate_depth = auto_update;
			return self;
		}
		
		static offsets = function(_xOff = xOff ,_yOff = yOff, update_emitters = true) {
			xOff = _xOff;
			yOff = _yOff;
			if update_emitters {
				for (var i = 0; i < emitter_qty; ++i) {
				    var _emitter = emitter[i];
					_emitter.xOff = xOff;
					_emitter.yOff = yOff;
					
					_emitter.__update_region()
				}
			}
			return self;
		}
		
		static size = function(_w,_h, _shape=shape, _distr=distr, _override = true) {
					
			width = _w;
			height = _h;
			shape = _shape;
			distr = _distr;
			
			if _override {
				for (var i = 0; i < emitter_qty; ++i) {
				    var _emitter = emitter[i];
					_emitter.size(width,height,shape,distr)
				}
			}
			
			return self;
		}
		
		static finish = function() {
			//stops all emitters, once all particles are gone, destroys the effect.
			if time_source == noone {
				var killcheck = function(){
					if part_particles_count(system) == 0{
						time_source_destroy(time_source)
						destroy()
					}	
				}
			
				time_source = time_source_create(time_source_global,1,time_source_units_frames,killcheck,[],-1)
			
				stream(0);
			
				time_source_start(time_source);
			} else __pizazz_echo("Trying to kill an effect that's already in process of being killed")
			
			return self
		}
		
		static destroy = function(){
			//instantly destroys effect, regardless of particles existing or not
			part_system_destroy(system);
			for (var i = 0; i < emitter_qty; ++i) {
				var _emitter = emitter[i]
			    delete _emitter;
			}
			var me = self;
			delete me;
		}
		
		static get_emitter_ind = function(ind){
			if array_length(emitter) > ind && ind >= 0 {
				return emitter[ind]	
			} 
			return noone;
		}
		
		static get_part_emitter = function(_particle){
			for (var i = 0; i < emitter_qty; ++i) {
			    var _emitter = emitter[i];
				if (_emitter.particle == _particle)
					return _emitter
			}	
			return noone;
		}
	}

#endregion