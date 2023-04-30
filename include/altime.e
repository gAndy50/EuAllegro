include std/ffi.e

include base.e

public constant ALLEGRO_TIMEOUT = define_c_struct({
	C_LONG, --pad1
	C_LONG --pad2
})

export constant xal_get_time = define_c_func(all,"+al_get_Time",{},C_DOUBLE),
				xal_rest = define_c_proc(all,"+al_rest",{C_DOUBLE}),
				xal_init_timeout = define_c_proc(all,"+al_init_timeout",{ALLEGRO_TIMEOUT,C_DOUBLE})
				
public function al_get_time()
	return c_func(xal_get_time,{})
end function

public procedure al_rest(atom seconds)
	c_proc(xal_rest,{seconds})
end procedure

public procedure al_init_timeout(sequence timeout, atom seconds)
	c_proc(xal_init_timeout,{timeout,seconds})
end procedure
­5.49