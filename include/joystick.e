include std/ffi.e

include base.e
include events.e

public constant AL_MAX_JOYSTICK_AXES = 3,
				AL_MAX_JOYSTICK_STICKS = 16,
				AL_MAX_JOYSTICK_BUTTONS = 32
				
public constant ALLEGRO_JOYSTICK_STATE = define_c_type({
	{C_FLOAT,AL_MAX_JOYSTICK_AXES}, --axes
	{C_FLOAT,AL_MAX_JOYSTICK_STICKS}, --sticks
	{C_INT,AL_MAX_JOYSTICK_BUTTONS} --buttons
})

public enum type ALLEGRO_JOYFLAGS
	ALLEGRO_JOYFLAG_DIGITAL = 0x01,
	ALLEGRO_JOYFLAG_ANALOGUE = 0x02
end type

export constant xal_install_joystick = define_c_func(all,"+al_install_joystick",{},C_BOOL),
				xal_uninstall_joystick = define_c_proc(all,"+al_uninstall_joystick",{}),
				xal_is_joystick_installed = define_c_func(all,"+al_is_joystick_installed",{},C_BOOL),
				xal_reconfigure_joysticks = define_c_func(all,"+al_reconfigure_joysticks",{},C_BOOL)
				
public function al_install_joystick()
	return c_func(xal_install_joystick,{})
end function

public procedure al_uninstall_joystick()
	c_proc(xal_uninstall_joystick,{})
end procedure

public function al_is_joystick_installed()
	return c_func(xal_is_joystick_installed,{})
end function

public function al_reconfigure_joysticks()
	return c_func(xal_reconfigure_joysticks,{})
end function


export constant xal_get_num_joysticks = define_c_func(all,"+al_get_num_joysticks",{},C_INT),
				xal_get_joystick = define_c_func(all,"+al_get_joystick",{C_INT},C_POINTER),
				xal_release_joystick = define_c_proc(all,"+al_release_joystick",{C_POINTER}),
				xal_get_joystick_active = define_c_func(all,"+al_get_joystick_active",{C_POINTER},C_BOOL),
				xal_get_joystick_name = define_c_func(all,"+al_get_joystick_name",{C_POINTER},C_STRING)
				
public function al_get_num_joysticks()
	return c_func(xal_get_num_joysticks,{})
end function

public function al_get_joystick(atom joy)
	return c_func(xal_get_joystick,{joy})
end function

public procedure al_release_joystick(atom aj)
	c_proc(xal_release_joystick,{aj})
end procedure

public function al_get_joystick_active(atom aj)
	return c_func(xal_get_joystick_active,{aj})
end function

public function al_get_joystick_name(atom aj)
	return c_func(xal_get_joystick_name,{aj})
end function


export constant xal_get_joystick_num_sticks = define_c_func(all,"+al_get_joystick_num_sticks",{C_POINTER},C_INT),
				xal_get_joystick_stick_flags = define_c_func(all,"+al_get_joystick_stick_flags",{C_POINTER,C_INT},C_INT),
				xal_get_joystick_stick_name = define_c_func(all,"+al_get_joystick_name",{C_POINTER,C_INT},C_STRING)
				
public function al_get_joystick_num_sticks(atom aj)
	return c_func(xal_get_joystick_num_sticks,{aj})
end function

public function al_get_joystick_stick_flags(atom aj,atom stick)
	return c_func(xal_get_joystick_stick_flags,{aj,stick})
end function

public function al_get_joystick_stick_name(atom aj,atom stick)
	return c_func(xal_get_joystick_stick_name,{aj,stick})
end function


export constant xal_get_joystick_num_axes = define_c_func(all,"+al_get_joystick_num_axes",{C_POINTER,C_INT},C_INT),
				xal_get_joystick_axis_name = define_c_func(all,"+al_get_joystick_axis_name",{C_POINTER,C_INT,C_INT},C_STRING)
				
public function al_get_joystick_num_axes(atom aj,atom stick)
	return c_func(xal_get_joystick_num_axes,{aj,stick})
end function

public function al_get_joystick_axis_name(atom aj,atom stick,atom axis)
	return c_func(xal_get_joystick_axis_name,{aj,stick,axis})
end function


export constant xal_get_joystick_num_buttons = define_c_func(all,"+al_get_joystick_num_buttons",{C_POINTER},C_INT),
				xal_get_joystick_button_name = define_c_func(all,"+al_get_joystick_button_name",{C_POINTER,C_INT},C_STRING)
				
public function al_get_joystick_num_buttons(atom aj)
	return c_func(xal_get_joystick_num_buttons,{aj})
end function

public function al_get_joystick_button_name(atom aj,atom btn)
	return c_func(xal_get_joystick_button_name,{aj,btn})
end function


export constant xal_get_joystick_state = define_c_proc(all,"+al_get_joystick_state",{C_POINTER,ALLEGRO_JOYSTICK_STATE})

public procedure al_get_joystick_state(atom aj,sequence state)
	c_proc(xal_get_joystick_state,{aj,state})
end procedure


export constant xal_get_joystick_event_source = define_c_func(all,"+al_get_joystick_event_source",{},C_POINTER)

public function al_get_joystick_event_source()
	return c_func(xal_get_joystick_event_source,{})
end function
­82.56