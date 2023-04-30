include std/ffi.e

include base.e

public constant ALLEGRO_DISPLAY_MODE = define_c_struct({
	C_INT, --width
	C_INT, --height
	C_INT, --format
	C_INT --refresh_rate
})

export constant xal_get_num_display_modes = define_c_func(all,"+al_get_num_display_modes",{},C_INT),
				xal_get_display_mode = define_c_func(all,"+al_get_display_mode",{C_INT,ALLEGRO_DISPLAY_MODE},ALLEGRO_DISPLAY_MODE)
				
public function al_get_num_display_modes()
	return c_func(xal_get_num_display_modes,{})
end function

public function al_get_display_mode(atom index,sequence mode)
	return c_func(xal_get_display_mode,{index,mode})
end function
­5.54