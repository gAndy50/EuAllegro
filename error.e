include std/ffi.e

include base.e

export constant xal_get_errno = define_c_func(all,"+al_get_errno",{},C_INT),
				xal_set_errno = define_c_proc(all,"+al_set_errno",{C_INT})
				
public function al_get_errno()
	return c_func(xal_get_errno,{})
end function

public procedure al_set_errno(atom err)
	c_proc(xal_set_errno,{err})
end procedure
­13.28