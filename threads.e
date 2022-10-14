include std/ffi.e

include base.e
include altime.e

export constant xal_create_thread = define_c_func(all,"+al_create_thread",{C_POINTER,C_POINTER,C_POINTER},C_POINTER),
				xal_create_thread_with_stacksize = define_c_func(all,"+al_create_thread_with_stacksize",{C_POINTER,C_POINTER,C_POINTER,C_SIZE_T},C_POINTER)
				

public function al_create_thread(atom thread,atom arg,atom arg2)
	return c_func(xal_create_thread,{thread,arg,arg2})
end function
			
public function al_create_thread_with_stacksize(atom thread,atom arg,atom arg2,atom size)
	return c_func(xal_create_thread_with_stacksize,{thread,arg,arg2,size})
end function

	
export constant xal_start_thread = define_c_proc(all,"+al_start_thread",{C_POINTER}),
				xal_join_thread = define_c_proc(all,"+al_join_thread",{C_POINTER,C_POINTER}),
				xal_set_thread_should_stop = define_c_proc(all,"+al_set_thread_should_stop",{C_POINTER}),
				xal_get_thread_should_stop = define_c_proc(all,"+al_get_thread_should_stop",{C_POINTER}),
				xal_destroy_thread = define_c_proc(all,"+al_destroy_thread",{C_POINTER}),
				xal_run_detached_thread = define_c_proc(all,"+al_run_detached_thread",{C_POINTER,C_POINTER,C_POINTER})
				
public procedure al_start_thread(atom outer)
	c_proc(xal_start_thread,{outer})
end procedure

public procedure al_join_thread(atom outer,atom ret)
	c_proc(xal_join_thread,{outer,ret})
end procedure

public procedure al_set_thread_should_stop(atom outer)
	c_proc(xal_set_thread_should_stop,{outer})
end procedure

public procedure al_get_thread_should_stop(atom outer)
	c_proc(xal_get_thread_should_stop,{outer})
end procedure

public procedure al_destroy_thread(atom t)
	c_proc(xal_destroy_thread,{t})
end procedure

public procedure al_run_detached_thread(atom proc,atom arg,atom arg2)
	c_proc(xal_run_detached_thread,{proc,arg,arg2})
end procedure


export constant xal_create_mutex = define_c_func(all,"+al_create_mutex",{},C_POINTER),
				xal_create_mutex_recursive = define_c_func(all,"+al_create_mutex_recursive",{},C_POINTER),
				xal_lock_mutex = define_c_proc(all,"+al_lock_mutex",{C_POINTER}),
				xal_unlock_mutex = define_c_proc(all,"+al_unlock_mutex",{C_POINTER}),
				xal_destroy_mutex = define_c_proc(all,"+al_destroy_mutex",{C_POINTER})
				
public function al_create_mutex()
	return c_func(xal_create_mutex,{})
end function

public function al_create_mutex_recursive()
	return c_func(xal_create_mutex_recursive,{})
end function

public procedure al_lock_mutex(atom mut)
	c_proc(xal_lock_mutex,{mut})
end procedure

public procedure al_unlock_mutex(atom mut)
	c_proc(xal_unlock_mutex,{mut})
end procedure

public procedure al_destroy_mutex(atom mut)
	c_proc(xal_destroy_mutex,{mut})
end procedure


export constant xal_create_cond = define_c_func(all,"+al_create_cond",{},C_POINTER),
				xal_destroy_cond = define_c_proc(all,"+al_destroy_cond",{C_POINTER}),
				xal_wait_cond = define_c_proc(all,"+al_wait_cond",{C_POINTER,C_POINTER}),
				xal_wait_cond_until = define_c_func(all,"+al_wait_cond_until",{C_POINTER,C_POINTER,C_POINTER},C_INT),
				xal_broadcast_cond = define_c_proc(all,"+al_broadcast_cond",{C_POINTER}),
				xal_signal_cond = define_c_proc(all,"+al_signal_cond",{C_POINTER})
				
public function al_create_cond()
	return c_func(xal_create_cond,{})
end function

public procedure al_destroy_cond(atom con)
	c_proc(xal_destroy_cond,{con})
end procedure

public procedure al_wait_cond(atom cond,atom mut)
	c_proc(xal_wait_cond,{cond,mut})
end procedure

public function al_wait_cond_until(atom cond,atom mut,atom tout)
	return c_func(xal_wait_cond_until,{cond,mut,tout})
end function

public procedure al_broadcast_cond(atom cond)
	c_proc(xal_broadcast_cond,{cond})
end procedure

public procedure al_signal_cond(atom con)
	c_proc(xal_signal_cond,{con})
end procedure
­106.30