include std/ffi.e

include base.e
include events.e


export constant xal_create_timer = define_c_func(all,"+al_create_timer",{C_DOUBLE},C_POINTER),
				xal_destroy_timer = define_c_proc(all,"+al_destroy_timer",{C_POINTER}),
				xal_start_timer = define_c_proc(all,"+al_start_timer",{C_POINTER}),
				xal_stop_timer = define_c_proc(all,"+al_stop_timer",{C_POINTER}),
				xal_resume_timer = define_c_proc(all,"+al_resume_timer",{C_POINTER}),
				xal_get_timer_started = define_c_func(all,"+al_get_timer_started",{C_POINTER},C_BOOL),
				xal_get_timer_speed = define_c_func(all,"+al_get_timer_speed",{C_POINTER},C_DOUBLE),
				xal_set_timer_speed = define_c_proc(all,"+al_set_timer_speed",{C_POINTER,C_DOUBLE}),
				xal_get_timer_count = define_c_func(all,"+al_get_timer_count",{C_POINTER,C_LONG},C_LONG),
				xal_set_timer_count = define_c_proc(all,"+al_set_timer_count",{C_POINTER,C_LONG}),
				xal_add_timer_count = define_c_proc(all,"+al_add_timer_count",{C_POINTER,C_LONG}),
				xal_get_timer_event_source = define_c_func(all,"+al_get_timer_event_source",{C_POINTER},C_POINTER)
				
public function al_create_timer(atom secs)
	return c_func(xal_create_timer,{secs})
end function

public procedure al_destroy_timer(atom t)
	c_proc(xal_destroy_timer,{t})
end procedure

public procedure al_start_timer(atom t)
	c_proc(xal_start_timer,{t})
end procedure

public procedure al_stop_timer(atom t)
	c_proc(xal_stop_timer,{t})
end procedure

public procedure al_resume_timer(atom t)
	c_proc(xal_resume_timer,{t})
end procedure

public function al_get_timer_started(atom t)
	return c_func(xal_get_timer_started,{t})
end function

public function al_get_timer_speed(atom t)
	return c_func(xal_get_timer_speed,{t})
end function

public procedure al_set_timer_speed(atom t,atom secs)
	c_proc(xal_set_timer_speed,{t,secs})
end procedure

public function al_get_timer_count(atom t)
	return c_func(xal_get_timer_count,{t})
end function

public procedure al_set_timer_count(atom t,atom count)
	c_proc(xal_set_timer_count,{t,count})
end procedure

public procedure al_add_timer_count(atom t,atom diff)
	c_proc(xal_add_timer_count,{t,diff})
end procedure

public function al_get_timer_event_source(atom t)
	return c_func(xal_get_timer_event_source,{t})
end function
­65.46