include std/ffi.e

include base.e
include file.e


export constant xal_create_config = define_c_func(all,"+al_create_config",{},C_POINTER),
				xal_add_config_section = define_c_proc(all,"+al_add_config_section",{C_POINTER,C_STRING}),
				xal_set_config_value = define_c_proc(all,"+al_set_config_value",{C_POINTER,C_STRING,C_STRING,C_STRING}),
				xal_add_config_comment = define_c_proc(all,"+al_add_config_comment",{C_POINTER,C_STRING,C_STRING}),
				xal_get_config_value = define_c_func(all,"+al_get_config_value",{C_POINTER,C_STRING,C_STRING},C_STRING),
				xal_load_config_file = define_c_func(all,"+al_load_config_file",{C_STRING},C_POINTER),
				xal_load_config_file_f = define_c_func(all,"+al_load_config_file_f",{C_POINTER},C_POINTER),
				xal_save_config_file = define_c_func(all,"+al_save_config_file",{C_STRING,C_POINTER},C_BOOL),
				xal_save_config_file_f = define_c_func(all,"+al_save_config_file_f",{C_POINTER,C_POINTER},C_BOOL),
				xal_merge_config_into = define_c_proc(all,"+al_merge_config_into",{C_POINTER,C_POINTER}),
				xal_merge_config = define_c_func(all,"+al_merge_config",{C_POINTER,C_POINTER},C_POINTER),
				xal_destroy_config = define_c_proc(all,"+al_destroy_config",{C_POINTER}),
				xal_remove_config_section = define_c_func(all,"+al_remove_config_section",{C_POINTER,C_STRING},C_BOOL),
				xal_remove_config_key = define_c_func(all,"+al_remove_config_key",{C_POINTER,C_STRING,C_STRING},C_BOOL)
				
public function al_create_config()
	return c_func(xal_create_config,{})
end function

public procedure al_add_config_section(sequence config,sequence name)
	c_proc(xal_add_config_section,{config,name})
end procedure

public procedure al_set_config_value(sequence config,sequence section,sequence key,sequence val)
	c_proc(xal_set_config_value,{config,section,key,val})
end procedure

public procedure al_add_config_comment(sequence config,sequence section,sequence comment)
	c_proc(xal_add_config_comment,{config,section,comment})
end procedure

public function al_get_config_value(sequence config,sequence section,sequence key)
	return c_func(xal_get_config_value,{config,section,key})
end function

public function al_load_config_file(sequence fname)
	return c_func(xal_load_config_file,{fname})
end function

public function al_load_config_file_f(sequence fname)
	return c_func(xal_load_config_file_f,{fname})
end function

public function al_save_config_file(sequence fname,sequence config)
	return c_func(xal_save_config_file,{fname,config})
end function

public function al_save_config_file_f(sequence file,sequence config)
	return c_func(xal_save_config_file_f,{file,config})
end function

public procedure al_merge_config_into(sequence master,sequence add)
	c_proc(xal_merge_config_into,{master,add})
end procedure

public function al_merge_config(sequence cf1,sequence cf2)
	return c_func(xal_merge_config,{cf1,cf2})
end function

public procedure al_destroy_config(sequence config)
	c_proc(xal_destroy_config,{config})
end procedure

public function al_remove_config_section(sequence config,sequence section)
	return c_func(xal_remove_config_section,{config,section})
end function

public function al_remove_config_key(sequence config,sequence section,sequence key)
	return c_func(xal_remove_config_key,{config,section,key})
end function


export constant xal_get_first_config_section = define_c_func(all,"+al_get_first_config_section",{C_POINTER,C_POINTER},C_STRING),
				xal_get_next_config_section = define_c_func(all,"+al_get_next_config_section",{C_POINTER},C_STRING),
				xal_get_first_config_entry = define_c_func(all,"+al_get_first_config_entry",{C_POINTER,C_STRING,C_POINTER},C_STRING),
				xal_get_next_config_entry = define_c_func(all,"+al_get_next_config_entry",{C_POINTER},C_STRING)
				
public function al_get_first_config_section(sequence config,sequence it)
	return c_func(xal_get_first_config_section,{config,it})
end function

public function al_get_next_config_section(sequence it)
	return c_func(xal_get_next_config_section,{it})
end function

public function al_get_first_config_entry(sequence config,sequence section,sequence it)
	return c_func(xal_get_first_config_entry,{config,section,it})
end function

public function al_get_next_config_entry(sequence it)
	return c_func(xal_get_next_config_entry,{it})
end function
­97.46