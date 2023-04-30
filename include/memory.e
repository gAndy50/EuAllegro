include std/ffi.e

include base.e

export constant ALLEGRO_MEMORY_INTERFACE = define_c_struct({
	C_POINTER, --mi_malloc
	C_POINTER, --mi_free
	C_POINTER, --mi_realloc
	C_POINTER --mi_calloc
})

public function mi_malloc(atom n, integer line,sequence file,sequence func)
	return 0
end function

public function mi_free(atom ptr, integer line, sequence file,sequence func)
	return 0
end function

public function mi_realloc(atom ptr,atom n,integer line,sequence file,sequence func)
	return 0
end function

public function mi_calloc(atom count,atom n,integer line,sequence file,sequence func)
	return 0
end function

public constant MY_MEMORY = allocate_struct(ALLEGRO_MEMORY_INTERFACE, {
	call_back(routine_id("mi_malloc"), {C_SIZE_T,C_INT,C_STRING,C_STRING}, C_POINTER),
	call_back(routine_id("mi_free"),{C_POINTER,C_INT,C_STRING,C_STRING}, C_POINTER),
	call_back(routine_id("mi_realloc"),{C_POINTER,C_SIZE_T,C_INT,C_STRING,C_STRING},C_POINTER),
	call_back(routine_id("mi_calloc"),{C_SIZE_T,C_SIZE_T,C_INT,C_STRING,C_STRING},C_POINTER)
})


export constant xal_set_memory_interface = define_c_proc(all,"+al_set_memory_interface",{ALLEGRO_MEMORY_INTERFACE})

public procedure al_set_memory_interface(sequence iface)
	c_proc(xal_set_memory_interface,{iface})
end procedure


export constant xal_malloc_with_context = define_c_func(all,"+al_malloc_with_context",{C_SIZE_T,C_INT,C_STRING,C_STRING},C_POINTER),
				xal_free_with_context = define_c_proc(all,"+al_free_with_context",{C_POINTER,C_INT,C_STRING,C_STRING}),
				xal_realloc_with_context = define_c_func(all,"+al_realloc_with_context",{C_POINTER,C_SIZE_T,C_INT,C_STRING,C_STRING},C_POINTER),
				xal_calloc_with_context = define_c_func(all,"+al_calloc_with_context",{C_SIZE_T,C_SIZE_T,C_INT,C_STRING,C_STRING},C_POINTER)

public function al_malloc_with_context(atom n,atom line,sequence file,sequence func)
	return c_func(xal_malloc_with_context,{n,line,file,func})
end function

public procedure al_free_with_context(atom ptr,atom line,sequence file,sequence func)
	c_proc(xal_free_with_context,{ptr,line,file,func})
end procedure

public function al_realloc_with_context(atom ptr,atom n,atom line,sequence file,sequence func)
	return c_func(xal_realloc_with_context,{ptr,n,line,file,func})
end function

public function al_calloc_with_context(atom count,atom n,atom line,sequence file,sequence func)
	return c_func(xal_calloc_with_context,{count,n,line,file,func})
end function
­5.58