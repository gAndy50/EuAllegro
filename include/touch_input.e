include std/ffi.e

include base.e
include events.e

public constant ALLEGRO_TOUCH_INPUT_MAX_TOUCH_COUNT = 16

public constant ALLEGRO_TOUCH_STATE = define_c_struct({
	C_INT, --id
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --dx
	C_FLOAT, --dy
	C_BOOL, --primary
	C_POINTER --display struct
})

public constant ALLEGRO_TOUCH_INPUT_STATE = define_c_struct({
	{ALLEGRO_TOUCH_STATE,ALLEGRO_TOUCH_INPUT_MAX_TOUCH_COUNT}
})

public enum type ALLEGRO_MOUSE_EMULATION_MODE
	ALLEGRO_MOUSE_EMULATION_NONE = 0,
	ALLEGRO_MOUSE_EMULATION_TRANSPARENT,
	ALLEGRO_MOUSE_EMULATION_INCLUSIVE,
	ALLEGRO_MOUSE_EMULATION_EXCLUSIVE,
	ALLEGRO_MOUSE_EMULATION_5_0_x,
	ALLWGRO_MOUSE_EMULATION_MODE
end type


export constant xal_is_touch_input_installed = define_c_func(all,"+al_is_touch_input_installed",{},C_BOOL),
				xal_install_touch_input = define_c_func(all,"+al_install_touch_input",{},C_BOOL),
				xal_uninstall_touch_input = define_c_proc(all,"+al_uninstall_touch_input",{}),
				xal_get_touch_input_state = define_c_proc(all,"+al_get_touch_input_state",{ALLEGRO_TOUCH_INPUT_STATE}),
				xal_get_touch_input_event_source = define_c_func(all,"+al_get_touch_input_event_source",{},C_POINTER)
				
public function al_is_touch_input_installed()
	return c_func(xal_is_touch_input_installed,{})
end function

public function al_install_touch_input()
	return c_func(xal_install_touch_input,{})
end function

public procedure al_uninstall_touch_input()
	c_proc(xal_uninstall_touch_input,{})
end procedure

public procedure al_get_touch_input_state(sequence ret)
	c_proc(xal_get_touch_input_state,{ret})
end procedure

public function al_get_touch_input_event_source()
	return c_func(xal_get_touch_input_event_source,{})
end function


export constant xal_set_mouse_emulation_mode = define_c_proc(all,"+al_set_mouse_emulation_mode",{C_INT}),
				xal_get_mouse_emulation_mode = define_c_func(all,"+al_get_mouse_emulation_mode",{},C_INT),
				xal_get_touch_input_mouse_emulation_event_source = define_c_func(all,"+al_get_touch_input_mouse_emulation_event_source",{},C_POINTER)
				
public procedure al_set_mouse_emulation_mode(atom mode)
	c_proc(xal_set_mouse_emulation_mode,{mode})
end procedure

public function al_get_mouse_emulation_mode()
	return c_func(xal_get_mouse_emulation_mode,{})
end function

public function al_get_touch_input_mouse_emulation_event_source()
	return c_func(xal_get_touch_input_mouse_emulation_event_source,{})
end function
­18.59