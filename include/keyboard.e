include std/ffi.e

include base.e
include events.e
include keycodes.e

public constant ALLEGRO_KEYBOARD_STATE = define_c_type({
	C_POINTER, --struct display
	C_UINT --key_down_internal
})


export constant xal_is_keyboard_installed = define_c_func(all,"+al_is_keyboard_installed",{},C_BOOL),
				xal_install_keyboard = define_c_func(all,"+al_install_keyboard",{},C_BOOL),
				xal_uninstall_keyboard = define_c_proc(all,"+al_uninstall_keyboard",{})
				
public function al_is_keyboard_installed()
	return c_func(xal_is_keyboard_installed,{})
end function

public function al_install_keyboard()
	return c_func(xal_install_keyboard,{})
end function

public procedure al_uninstall_keyboard()
	c_proc(xal_uninstall_keyboard,{})
end procedure


export constant xal_set_keyboard_leds = define_c_func(all,"+al_set_keyboard_leds",{C_INT},C_BOOL)

public function al_set_keyboard_leds(atom leds)
	return c_func(xal_set_keyboard_leds,{leds})
end function


export constant xal_get_keyboard_state = define_c_proc(all,"+al_get_keyboard_state",{ALLEGRO_KEYBOARD_STATE}),
				xal_clear_keyboard_state = define_c_proc(all,"+al_clear_keyboard_state",{C_POINTER}),
				xal_key_down = define_c_func(all,"+al_key_down",{ALLEGRO_KEYBOARD_STATE,C_INT},C_BOOL)
				
public procedure al_get_keyboard_state(sequence ret)
	c_proc(xal_get_keyboard_state,{ret})
end procedure

public procedure al_clear_keyboard_state(atom dis)
	c_proc(xal_clear_keyboard_state,{dis})
end procedure

public function al_key_down(sequence state,atom keycode)
	return c_func(xal_key_down,{state,keycode})
end function


export constant xal_get_keyboard_event_source = define_c_func(all,"+al_get_keyboard_event_source",{},C_POINTER)

public function al_get_keyboard_event_source()
	return c_func(xal_get_keyboard_event_source,{})
end function
­57.48