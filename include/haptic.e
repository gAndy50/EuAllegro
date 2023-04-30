include std/ffi.e

include std/math.e --for shift_bits()

include base.e
include display.e
include events.e
include joystick.e
include keyboard.e
include mouse.e
include touch_input.e

public constant ALLEGRO_HAPTIC_RUMBLE = shift_bits(1,0),
				ALLEGRO_HAPTIC_PERIODIC = shift_bits(1,-1),
				ALLEGRO_HAPTIC_CONSTANT = shift_bits(1,-2),
				ALLEGRO_HAPTIC_SPRING = shift_bits(1,-3),
				ALLEGRO_HAPTIC_FRICTION = shift_bits(1,-4),
				ALLEGRO_HAPTIC_DAMPER = shift_bits(1,-5),
				ALLEGRO_HAPTIC_INERTIA = shift_bits(1,-6),
				ALLEGRO_HAPTIC_RAMP = shift_bits(1,-7),
				ALLEGRO_HAPTIC_SQURE = shift_bits(1,-8),
				ALLEGRO_HAPTIC_TRIANGLE = shift_bits(1,-9),
				ALLEGRO_HAPTIC_SINE = shift_bits(1,-10),
				ALLEGRO_HAPTIC_SAW_UP = shift_bits(1,-11),
				ALLEGRO_HAPTIC_SAW_DOWN = shift_bits(1,-12),
				ALLEGRO_HAPTIC_CUSTOM = shift_bits(1,-13),
				ALLEGRO_HAPTIC_GAIN = shift_bits(1,-14),
				ALLEGRO_HAPTIC_ANGLE = shift_bits(1,-15),
				ALLEGRO_HAPTIC_RADIUS = shift_bits(1,-16),
				ALLEGRO_HAPTIC_AZIMUTH = shift_bits(1,-17),
				ALLEGRO_HAPTIC_AUTOCENTER = shift_bits(1,-18)
				
public constant ALLEGRO_HAPTIC_DIRECTION = define_c_struct({
	C_DOUBLE, --angle
	C_DOUBLE, --radius
	C_DOUBLE --azimuth
})

public constant ALLEGRO_HAPTIC_REPLAY = define_c_struct({
	C_DOUBLE, --length
	C_DOUBLE --delay
})

public constant ALLEGRO_HAPTIC_ENVELOPE = define_c_struct({
	C_DOUBLE, --attack_length
	C_DOUBLE, --attack_level
	C_DOUBLE, --fade_length
	C_DOUBLE --fade_level
})

public constant ALLEGRO_HAPTIC_CONSTANT_EFFECT = define_c_struct({
	C_DOUBLE, --level
	ALLEGRO_HAPTIC_ENVELOPE --envelope
})

public constant ALLEGRO_HAPTIC_RAMP_EFFECT = define_c_struct({
	C_DOUBLE, --start_level
	C_DOUBLE, --end_level
	ALLEGRO_HAPTIC_ENVELOPE --envelope
})

public constant ALLEGRO_HAPTIC_CONDITION_EFFECT = define_c_struct({
	C_DOUBLE, --right_saturation
	C_DOUBLE, --left_saturation
	C_DOUBLE, --right_coeff
	C_DOUBLE, --left_coeff
	C_DOUBLE, --deadband
	C_DOUBLE --center
})

public constant ALLEGRO_HAPTIC_PERIODIC_EFFECT = define_c_struct({
	C_INT, --waveform
	C_DOUBLE, --period
	C_DOUBLE, --magnitude
	C_DOUBLE, --offset
	C_DOUBLE, --phase
	ALLEGRO_HAPTIC_ENVELOPE, --envelope
	C_INT, --custom_len
	C_POINTER --custom_data
})

public constant ALLEGRO_HAPTIC_RUMBLE_EFFECT = define_c_struct({
	C_DOUBLE, --strong_magnitude
	C_DOUBLE --weak magnitude
})

public constant ALLEGRO_HAPTIC_EFFECT_UNION = define_c_struct({
	ALLEGRO_HAPTIC_CONSTANT_EFFECT,
	ALLEGRO_HAPTIC_RAMP_EFFECT,
	ALLEGRO_HAPTIC_PERIODIC_EFFECT,
	ALLEGRO_HAPTIC_CONDITION_EFFECT,
	ALLEGRO_HAPTIC_RUMBLE_EFFECT
})

public constant ALLEGRO_HAPTIC_EFFECT = define_c_struct({
	C_INT, --type
	ALLEGRO_HAPTIC_DIRECTION,
	ALLEGRO_HAPTIC_REPLAY,
	ALLEGRO_HAPTIC_EFFECT_UNION
})

public constant ALLEGRO_HAPTIC_EFFECT_ID = define_c_struct({
	C_POINTER, --haptic
	C_INT, --id
	C_INT, --handle
	C_POINTER, --pointer
	C_DOUBLE, --effect_duration
	C_BOOL, --playing
	C_DOUBLE, --start_time
	C_DOUBLE, --end_time
	C_POINTER --driver
})


export constant xal_install_haptic = define_c_func(all,"+al_install_haptic",{},C_BOOL),
				xal_uninstall_haptic = define_c_proc(all,"+al_uninstall_haptic",{}),
				xal_is_haptic_installed = define_c_func(all,"+al_is_haptic_installed",{},C_BOOL)
				
public function al_install_haptic()
	return c_func(xal_install_haptic,{})
end function

public procedure al_uninstall_haptic()
	c_proc(xal_uninstall_haptic,{})
end procedure

public function al_is_haptic_installed()
	return c_func(xal_is_haptic_installed,{})
end function


export constant xal_is_mouse_haptic = define_c_func(all,"+al_is_mouse_haptic",{C_POINTER},C_BOOL),
				xal_is_joystick_haptic = define_c_func(all,"+al_is_joystick_haptic",{C_POINTER},C_BOOL),
				xal_is_keyboard_haptic = define_c_func(all,"+al_is_keyboard_haptic",{C_POINTER},C_BOOL),
				xal_is_display_haptic = define_c_func(all,"+al_is_display_haptic",{C_POINTER},C_BOOL),
				xal_is_touch_input_haptic = define_c_func(all,"+al_is_touch_input_haptic",{C_POINTER},C_BOOL)
				
public function al_is_mouse_haptic(atom mouse)
	return c_func(xal_is_mouse_haptic,{mouse})
end function

public function al_is_joystick_haptic(atom joy)
	return c_func(xal_is_joystick_haptic,{joy})
end function

public function al_is_keyboard_haptic(atom key)
	return c_func(xal_is_keyboard_haptic,{key})
end function

public function al_is_display_haptic(atom dis)
	return c_func(xal_is_display_haptic,{dis})
end function

public function al_is_touch_input_haptic(atom ti)
	return c_func(xal_is_touch_input_haptic,{ti})
end function

export constant xal_release_haptic = define_c_func(all,"+al_release_haptic",{C_POINTER},C_BOOL)

public function al_release_haptic(atom h)
	return c_func(xal_release_haptic,{h})
end function


export constant xal_is_haptic_active = define_c_func(all,"+al_is_haptic_active",{C_POINTER},C_BOOL),
				xal_get_haptic_capabilities = define_c_func(all,"+al_get_haptic_capabilities",{C_POINTER},C_INT),
				xal_is_haptic_capable = define_c_func(all,"+al_is_haptic_capable",{C_POINTER,C_INT},C_BOOL)
				
public function al_is_haptic_active(atom h)
	return c_func(xal_is_haptic_active,{h})
end function

public function al_get_haptic_capabilities(atom h)
	return c_func(xal_get_haptic_capabilities,{h})
end function

public function al_is_haptic_capable(atom h,atom x)
	return c_func(xal_is_haptic_capable,{h,x})
end function


export constant xal_set_haptic_gain = define_c_func(all,"+al_set_haptic_gain",{C_POINTER,C_DOUBLE},C_BOOL),
				xal_get_haptic_autocenter = define_c_func(all,"+al_get_haptic_autocenter",{C_POINTER},C_DOUBLE)
				
public function al_set_haptic_gain(atom h,atom x)
	return c_func(xal_set_haptic_gain,{h,x})
end function

public function al_get_haptic_autocenter(atom h)
	return c_func(xal_get_haptic_autocenter,{h})
end function


export constant xal_get_max_haptic_effects = define_c_func(all,"+al_get_max_haptic_effects",{C_POINTER},C_INT),
				xal_is_haptic_effect_ok = define_c_func(all,"+al_is_haptic_effect_ok",{C_POINTER,C_POINTER},C_BOOL),
				xal_upload_haptic_effect = define_c_func(all,"+al_upload_haptic_effect",{C_POINTER,C_POINTER,C_POINTER},C_BOOL),
				xal_play_haptic_effect = define_c_func(all,"+al_play_haptic_effect",{C_POINTER,C_INT},C_BOOL),
				xal_upload_and_play_haptic_effect = define_c_func(all,"+al_upload_and_play_haptic_effect",{C_POINTER,C_POINTER,C_POINTER,C_INT},C_BOOL),
				xal_stop_haptic_effect = define_c_func(all,"+al_stop_haptic_effect",{C_POINTER},C_BOOL),
				xal_is_haptic_effect_playing = define_c_func(all,"+al_is_haptic_effect_playing",{C_POINTER},C_BOOL),
				xal_release_haptic_effect = define_c_func(all,"+al_release_haptic_effect",{C_POINTER},C_BOOL),
				xal_get_haptic_effect_duration = define_c_func(all,"+al_get_haptic_effect_duration",{C_POINTER},C_DOUBLE),
				xal_rumble_haptic = define_c_func(all,"+al_rumble_haptic",{C_POINTER,C_DOUBLE,C_DOUBLE,C_POINTER},C_BOOL)
				
public function al_get_max_haptic_effects(atom h)
	return c_func(xal_get_max_haptic_effects,{h})
end function

public function al_is_haptic_effect_ok(atom h,atom h2)
	return c_func(xal_is_haptic_effect_ok,{h,h2})
end function

public function al_upload_haptic_effect(atom h,atom h2,atom id)
	return c_func(xal_upload_haptic_effect,{h,h2,id})
end function

public function al_play_haptic_effect(atom h,atom x)
	return c_func(xal_play_haptic_effect,{h,x})
end function

public function al_upload_and_play_haptic_effect(atom h,atom h2,atom id,atom x)
	return c_func(xal_upload_and_play_haptic_effect,{h,h2,id,x})
end function

public function al_stop_haptic_effect(atom id)
	return c_func(xal_stop_haptic_effect,{id})
end function

public function al_is_haptic_effect_playing(atom id)
	return c_func(xal_is_haptic_effect_playing,{id})
end function

public function al_release_haptic_effect(atom id)
	return c_func(xal_release_haptic_effect,{id})
end function

public function al_get_haptic_effect_duration(atom h)
	return c_func(xal_get_haptic_effect_duration,{h})
end function

public function al_rumble_haptic(atom h,atom d,atom d2,atom id)
	return c_func(xal_rumble_haptic,{h,d,d2,id})
end function

--For testing shift_bits values				
--printf(1,"%d",{ALLEGRO_HAPTIC_ANGLE})
­102.58