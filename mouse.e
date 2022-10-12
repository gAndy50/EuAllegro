include std/ffi.e

include base.e
include events.e

public constant ALLEGRO_MOUSE_MAX_EXTRA_AXES = 4

public constant ALLEGRO_MOUSE_STATE = define_c_type({
	C_INT, --x
	C_INT, --y
	C_INT, --z
	C_INT, --w
	{C_INT,ALLEGRO_MOUSE_MAX_EXTRA_AXES}, --more_axes
	C_INT, --buttons
	C_FLOAT, --pressure
	C_POINTER --pointer struct
})


export constant xal_is_mouse_installed = define_c_func(all,"+al_is_mouse_installed",{},C_BOOL),
				xal_install_mouse = define_c_func(all,"+al_install_mouse",{},C_BOOL),
				xal_uninstall_mouse = define_c_proc(all,"+al_uninstall_mouse",{}),
				xal_get_mouse_num_buttons = define_c_func(all,"+al_get_mouse_num_buttons",{},C_UINT),
				xal_get_mouse_num_axes = define_c_func(all,"+al_get_mouse_num_axes",{},C_UINT),
				xal_set_mouse_xy = define_c_func(all,"+al_set_mouse_xy",{C_POINTER,C_INT,C_INT},C_BOOL),
				xal_set_mouse_z = define_c_func(all,"+al_set_mouse_z",{C_INT},C_BOOL),
				xal_set_mouse_w = define_c_func(all,"+al_set_mouse_w",{C_INT},C_BOOL),
				xal_set_mouse_axis = define_c_func(all,"+al_set_mouse_axis",{C_INT,C_INT},C_BOOL),
				xal_get_mouse_state = define_c_proc(all,"+al_get_mouse_state",{ALLEGRO_MOUSE_STATE}),
				xal_mouse_button_down = define_c_func(all,"+al_mouse_button_down",{C_POINTER,C_INT},C_BOOL),
				xal_get_mouse_state_axis = define_c_func(all,"+al_get_mouse_state_axis",{C_POINTER,C_INT},C_INT),
				xal_get_mouse_cursor_position = define_c_func(all,"+al_get_mouse_cursor_position",{C_POINTER,C_POINTER},C_BOOL),
				xal_grab_mouse = define_c_func(all,"+al_grab_mouse",{C_POINTER},C_BOOL),
				xal_ungrab_mouse = define_c_func(all,"+al_ungrab_mouse",{},C_BOOL),
				xal_set_mouse_wheel_precision = define_c_proc(all,"+al_set_mouse_wheel_precision",{C_INT}),
				xal_get_mouse_wheel_precision = define_c_func(all,"+al_get_mouse_wheel_precision",{},C_INT)
				

export constant xal_get_mouse_event_source = define_c_func(all,"+al_get_mouse_event_source",{},C_POINTER)


public function al_is_mouse_installed()
	return c_func(xal_is_mouse_installed,{})
end function

public function al_install_mouse()
	return c_func(xal_install_mouse,{})
end function

public procedure al_uninstall_mouse()
	c_proc(xal_uninstall_mouse,{})
end procedure

public function al_get_mouse_num_buttons()
	return c_func(xal_get_mouse_num_buttons,{})
end function

public function al_get_mouse_num_axes()
	return c_func(xal_get_mouse_num_axes,{})
end function

public function al_set_mouse_xy(object dis,atom x,atom y)
	return c_func(xal_set_mouse_xy,{dis,x,y})
end function

public function al_set_mouse_z(atom z)
	return c_func(xal_set_mouse_z,{z})
end function

public function al_set_mouse_w(atom w)
	return c_func(xal_set_mouse_w,{w})
end function

public function al_set_mouse_axis(atom axis,atom val)
	return c_func(xal_set_mouse_axis,{axis,val})
end function

public procedure al_get_mouse_state(sequence ret)
	c_proc(xal_get_mouse_state,{ret})
end procedure

public function al_mouse_button_down(sequence st,atom btn)
	return c_func(xal_mouse_button_down,{st,btn})
end function

public function al_get_mouse_state_axis(sequence st,atom axis)
	return c_func(xal_get_mouse_state_axis,{st,axis})
end function

public function al_get_mouse_cursor_position(atom x,atom y)
	return c_func(xal_get_mouse_cursor_position,{x,y})
end function

public function al_grab_mouse(object dis)
	return c_func(xal_grab_mouse,{dis})
end function

public function al_ungrab_mouse()
	return c_func(xal_ungrab_mouse,{})
end function

public procedure al_set_mouse_wheel_precision(atom pre)
	c_proc(xal_set_mouse_wheel_precision,{pre})
end procedure

public function al_get_mouse_wheel_precision()
	return c_func(xal_get_mouse_wheel_precision,{})
end function

public function al_get_mouse_event_source()
	return c_func(xal_get_mouse_event_source,{})
end function
­30.96