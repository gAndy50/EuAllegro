include std/ffi.e

include base.e
include transformations.e

public enum type ALLEGRO_SHADER_TYPE
	ALLEGRO_VERTEX_SHADER = 1,
	ALLEGRO_PIXEL_SHADER = 2
end type

public enum type ALLEGRO_SHADER_PLATFORM
	ALLEGRO_SHADER_AUTO = 0,
	ALLEGRO_SHADER_GLSL,
	ALLEGRO_SHADER_HLSL
end type

public constant ALLEGRO_SHADER_VAR_COLOR = "al_color",
				ALLEGRO_SHADER_VAR_POS = "al_pos",
				ALLEGRO_SHADER_VAR_PROJVIEW_MATRIX = "al_projview_matrix",
				ALLEGRO_SHADER_VAR_TEX = "al_tex",
				ALLEGRO_SHADER_TEXCOORD = "al_texcoord",
				ALLEGRO_SHADER_VAR_TEX_MATRIX = "al_tex_matrix",
				ALLEGRO_SHADER_VAR_USER_ATTR = "al_user_attr_",
				ALLEGRO_SHADER_VAR_USE_TEX = "al_use_tex",
				ALLEGRO_SHADER_VAR_USE_TEX_MATRIX = "al_use_tex_matrix",
				ALLEGRO_SHADER_VAR_ALPHA_TEST = "al_alpha_test",
				ALLEGRO_SHADER_VAR_ALPHA_FUNCTION = "al_alpha_func",
				ALLEGRO_SHADER_VAR_ALPHA_TEST_VALUE = "al_alpha_test_val"
				

export constant xal_create_shader = define_c_func(all,"+al_create_shader",{C_INT},C_POINTER),
				xal_attach_shader_source = define_c_func(all,"+al_attach_shader_source",{C_POINTER,C_INT,C_STRING},C_BOOL),
				xal_attach_shader_source_file = define_c_func(all,"+al_attach_shader_source_file",{C_POINTER,C_INT,C_STRING},C_BOOL),
				xal_build_shader = define_c_func(all,"+al_build_shader",{C_POINTER},C_BOOL),
				xal_get_shader_log = define_c_func(all,"+al_get_shader_log",{C_POINTER},C_STRING),
				xal_get_shader_platform = define_c_func(all,"+al_get_shader_platform",{C_POINTER},C_INT),
				xal_use_shader = define_c_func(all,"+al_use_shader",{C_POINTER},C_BOOL),
				xal_destroy_shader = define_c_proc(all,"+al_destroy_shader",{C_POINTER})
				
public function al_create_shader(ALLEGRO_SHADER_PLATFORM platform)
	return c_func(xal_create_shader,{platform})
end function

public function al_attach_shader_source(atom shader,ALLEGRO_SHADER_TYPE atype,sequence source)
	return c_func(xal_attach_shader_source,{shader,atype,source})
end function

public function al_attach_shader_source_file(atom shader,ALLEGRO_SHADER_TYPE atype,sequence fname)
	return c_func(xal_attach_shader_source_file,{shader,atype,fname})
end function

public function al_build_shader(atom shader)
	return c_func(xal_build_shader,{shader})
end function

public function al_get_shader_log(atom shader)
	return c_func(xal_get_shader_log,{shader})
end function

public function al_get_shader_platform(atom shader)
	return c_func(xal_get_shader_platform,{shader})
end function

public function al_use_shader(atom shader)
	return c_func(xal_use_shader,{shader})
end function

public procedure al_destroy_shader(atom shader)
	c_proc(xal_destroy_shader,{shader})
end procedure


export constant xal_set_shader_sampler = define_c_func(all,"+al_set_shader_sampler",{C_STRING,C_POINTER,C_INT},C_BOOL),
				xal_set_shader_matrix = define_c_func(all,"+al_set_shader_matrix",{C_STRING,ALLEGRO_TRANSFORM},C_BOOL),
				xal_set_shader_int = define_c_func(all,"+al_set_shader_int",{C_STRING,C_INT},C_BOOL),
				xal_set_shader_float = define_c_func(all,"+al_set_shader_float",{C_STRING,C_FLOAT},C_BOOL),
				xal_set_shader_int_vector = define_c_func(all,"+al_set_shader_int_vector",{C_STRING,C_INT,C_POINTER,C_INT},C_BOOL),
				xal_set_shader_float_vector = define_c_func(all,"+al_set_shader_float_vector",{C_STRING,C_INT,C_POINTER,C_INT},C_BOOL),
				xal_set_shader_bool = define_c_func(all,"+al_set_shader_bool",{C_STRING,C_BOOL},C_BOOL)
				
public function al_set_shader_sampler(sequence name,sequence bitmap,atom unit)
	return c_func(xal_set_shader_sampler,{name,bitmap,unit})
end function

public function al_set_shader_matrix(sequence name,sequence matrix)
	return c_func(xal_set_shader_matrix,{name,matrix})
end function

public function al_set_shader_int(sequence name,atom i)
	return c_func(xal_set_shader_int,{name,i})
end function

public function al_set_shader_float(sequence name,atom f)
	return c_func(xal_set_shader_float,{name,f})
end function

public function al_set_shader_int_vector(sequence name,atom num,atom i,atom num_ele)
	return c_func(xal_set_shader_int_vector,{name,num,i,num_ele})
end function

public function al_set_shader_float_vector(sequence name,atom num,atom f,atom num_ele)
	return c_func(xal_set_shader_float_vector,{name,num,f,num_ele})
end function


export constant xal_get_default_shader_source = define_c_func(all,"+al_get_default_shader_source",{C_INT,C_INT},C_STRING)

public function al_get_default_shader_source(ALLEGRO_SHADER_PLATFORM platform,ALLEGRO_SHADER_TYPE atype)
	return c_func(xal_get_default_shader_source,{platform,atype})
end function
­109.62