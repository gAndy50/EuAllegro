include std/ffi.e

include base.e
include color.e

public enum type ALLEGRO_BLEND_MODE
	ALLEGRO_ZERO                = 0,
  
	 ALLEGRO_ONE                 = 1,
  
	  ALLEGRO_ALPHA               = 2,
  
	   ALLEGRO_INVERSE_ALPHA       = 3,
  
	    ALLEGRO_SRC_COLOR           = 4,
  
	     ALLEGRO_DEST_COLOR          = 5,
  
	      ALLEGRO_INVERSE_SRC_COLOR   = 6,
  
	       ALLEGRO_INVERSE_DEST_COLOR  = 7,
  
	        ALLEGRO_CONST_COLOR         = 8,
  
	         ALLEGRO_INVERSE_CONST_COLOR = 9,
  
	          ALLEGRO_NUM_BLEND_MODES
end type

public enum type ALLEGRO_BLEND_OPERATIONS
	ALLEGRO_ADD = 0,
	ALLEGRO_SRC_MINUS_DEST = 1,
	ALLEGRO_DEST_MINNUS_SRC = 2,
	ALLEGRO_NUM_BLEND_OPERATIONS
end type

export constant xal_set_blender = define_c_proc(all,"+al_set_blender",{C_INT,C_INT,C_INT}),
				xal_set_blend_color = define_c_proc(all,"+al_set_blend_color",{ALLEGRO_COLOR}),
				xal_get_blender = define_c_proc(all,"+al_get_blender",{C_POINTER,C_POINTER,C_POINTER}),
				xal_get_blend_color = define_c_func(all,"+al_get_blend_color",{},ALLEGRO_COLOR),
				xal_set_separate_blender = define_c_proc(all,"+al_set_separate_blender",{C_INT,C_INT,C_INT,C_INT,C_INT,C_INT}),
				xal_get_separate_blender = define_c_proc(all,"+al_get_separate_blender",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER})
				
public procedure al_set_blender(atom op,atom source,atom dest)
	c_proc(xal_set_blender,{op,source,dest})
end procedure

public procedure al_set_blend_color(sequence color)
	c_proc(xal_set_blend_color,{color})
end procedure

public procedure al_get_blender(atom op,atom source,atom dest)
	c_proc(xal_get_blender,{op,source,dest})
end procedure

public function al_get_blend_color()
	return c_func(xal_get_blend_color,{})
end function

public procedure al_set_separate_blender(atom op,atom source,atom dest,atom alpha_op,atom alpha_source,atom alpha_dest)
	c_proc(xal_set_separate_blender,{op,source,dest,alpha_op,alpha_source,alpha_dest})
end procedure

public procedure al_get_separate_blender(atom op,atom source,atom dest,atom alpha_op,atom alpha_source,atom alpha_dest)
	c_proc(xal_get_separate_blender,{op,source,dest,alpha_op,alpha_source,alpha_dest})
end procedure
­55.83