include std/ffi.e

include base.e

export constant xal_get_cpu_count = define_c_func(all,"+al_get_cpu_count",{},C_INT),
				xal_get_ram_size = define_c_func(all,"+al_get_ram_size",{},C_INT)
				
public function al_get_cpu_count()
	return c_func(xal_get_cpu_count,{})
end function

public function al_get_ram_size()
	return c_func(xal_get_cpu_count,{})
end function
­13.36