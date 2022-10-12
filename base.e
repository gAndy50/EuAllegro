include std/ffi.e
include std/math.e
include std/machine.e

public constant ALLEGRO_VERSION = 5,
			    ALLEGRO_SUB_VERSION = 2,
			    ALLEGRO_WIP_VERSION = 6
			    
public constant ALLEGRO_RELEASE_NUMBER = 1

public constant ALLEGRO_UNSTABLE_BIT = -2147483648

public constant ALLEGRO_PI = 3.14159265358979323846

public constant ALLEGRO_VERSION_INT = or_all({ shift_bits(ALLEGRO_VERSION,-24), 
	shift_bits(ALLEGRO_SUB_VERSION,-16), shift_bits(ALLEGRO_WIP_VERSION, -8),
	ALLEGRO_RELEASE_NUMBER,ALLEGRO_UNSTABLE_BIT})
	
export constant all = open_dll("allegro-5.2.dll"),
	xal_get_allegro_version = define_c_func(all,"+al_get_allegro_version",{},C_UINT),
	xal_run_main = define_c_func(all,"+al_run_main",{C_INT,C_POINTER,C_INT,C_INT,C_POINTER},C_INT)
	
public function al_get_allegro_version()
	return c_func(xal_get_allegro_version,{})
end function

public function al_run_main(atom argc,sequence argv,atom x,atom x2,sequence char)
	return c_func(xal_run_main,{argc,argv,x,x2,char})
end function
­17.46