include std/ffi.e
include std/os.e

include base.e
include utf8.e

ifdef WINDOWS then
	public constant ALLEGRO_NATIVE_PATH_SEP = "\\"
	public constant ALLEGRO_NATIVE_DRIVE_SEP = ":"
	elsifdef LINUX or FREEBSD then
	public constant ALLEGRO_NATIVE_PATH_SEP = "/"
	public constant ALLEGRO_NATIVE_DRIVE_SEP = "\0"
end ifdef

public constant ALLEGRO_PATH = define_c_struct({C_POINTER})


export constant xal_create_path = define_c_func(all,"+al_create_path",{C_STRING},ALLEGRO_PATH),
				xal_create_path_for_directory = define_c_func(all,"+al_create_path_for_directory",{C_STRING},ALLEGRO_PATH),
				xal_clone_path = define_c_func(all,"+al_clone_path",{ALLEGRO_PATH},ALLEGRO_PATH)
				
public function al_create_path(sequence str)
	return c_func(xal_create_path,{str})
end function

public function al_create_path_for_directory(sequence str)
	return c_func(xal_create_path_for_directory,{str})
end function

public function al_clone_path(sequence path)
	return c_func(xal_clone_path,{path})
end function


export constant xal_get_path_num_components = define_c_func(all,"+al_get_path_num_components",{ALLEGRO_PATH},C_INT),
				xal_get_path_component = define_c_func(all,"+al_get_path_component",{ALLEGRO_PATH,C_INT},C_STRING),
				xal_replace_path_component = define_c_proc(all,"+al_replace_path_component",{ALLEGRO_PATH,C_INT,C_STRING}),
				xal_remove_path_component = define_c_proc(all,"+al_remove_path_component",{ALLEGRO_PATH,C_INT}),
				xal_insert_path_component = define_c_proc(all,"+al_insert_path_component",{ALLEGRO_PATH,C_INT,C_STRING}),
				xal_get_path_tail = define_c_func(all,"+al_get_path_tail",{ALLEGRO_PATH},C_STRING),
				xal_drop_path_tail = define_c_proc(all,"+al_drop_path_tail",{ALLEGRO_PATH}),
				xal_append_path_component = define_c_proc(all,"+al_append_path_component",{ALLEGRO_PATH,C_STRING}),
				xal_join_paths = define_c_func(all,"+al_join_paths",{ALLEGRO_PATH,ALLEGRO_PATH},C_BOOL),
				xal_rebase_path = define_c_func(all,"+al_rebase_path",{ALLEGRO_PATH,ALLEGRO_PATH},C_BOOL),
				xal_path_cstr = define_c_func(all,"+al_path_cstr",{ALLEGRO_PATH,C_CHAR},C_STRING),
				xal_path_ustr = define_c_func(all,"+al_path_ustr",{ALLEGRO_PATH,C_CHAR},ALLEGRO_PATH),
				xal_destroy_path = define_c_proc(all,"+al_destroy_path",{ALLEGRO_PATH})
				
public function al_get_path_num_components(sequence path)
	return c_func(xal_get_path_num_components,{path})
end function

public function al_get_path_component(sequence path,atom i)
	return c_func(xal_get_path_component,{path,i})
end function

public procedure al_replace_path_component(sequence path,atom i,sequence s)
	c_proc(xal_replace_path_component,{path,i,s})
end procedure

public procedure al_remove_path_component(sequence path,atom i)
	c_proc(xal_remove_path_component,{path,i})
end procedure

public procedure al_insert_path_component(sequence path,atom i,sequence s)
	c_proc(xal_insert_path_component,{path,i,s})
end procedure

public function al_get_path_tail(sequence path)
	return c_func(xal_get_path_tail,{path})
end function

public procedure al_drop_path_tail(sequence path)
	c_proc(xal_drop_path_tail,{path})
end procedure

public procedure al_append_path_component(sequence path,sequence s)
	c_proc(xal_append_path_component,{path,s})
end procedure

public function al_join_paths(sequence path,sequence tail)
	return c_func(xal_join_paths,{path,tail})
end function

public function al_rebase_path(sequence head,sequence tail)
	return c_func(xal_rebase_path,{head,tail})
end function

public function al_path_cstr(sequence path,sequence delim)
	return c_func(xal_path_cstr,{path,delim})
end function

public function al_path_ustr(sequence path,sequence delim)
	return c_func(xal_path_ustr,{path,delim})
end function

public procedure al_destroy_path(sequence path)
	c_proc(xal_destroy_path,{path})
end procedure


export constant xal_set_path_drive = define_c_proc(all,"+al_set_path_drive",{ALLEGRO_PATH,C_STRING}),
				xal_get_path_drive = define_c_func(all,"+al_get_path_drive",{ALLEGRO_PATH},C_STRING)
				
public procedure al_set_path_drive(sequence path,sequence drive)
	c_proc(xal_set_path_drive,{path,drive})
end procedure

public function al_get_path_drive(sequence path)
	return c_func(xal_get_path_drive,{path})
end function


export constant xal_set_path_filename = define_c_proc(all,"+al_set_path_filename",{ALLEGRO_PATH,C_STRING}),
				xal_get_path_filename = define_c_func(all,"+al_get_path_filename",{ALLEGRO_PATH},C_STRING)
				
public procedure al_set_path_filename(sequence path, sequence fname)
	c_proc(xal_set_path_filename,{path, fname})
end procedure

public function al_get_path_filename(sequence path)
	return c_func(xal_get_path_filename,{path})
end function


export constant xal_get_path_extension = define_c_func(all,"+al_get_path_extension",{ALLEGRO_PATH},C_STRING),
				xal_set_path_extension = define_c_func(all,"+al_set_path_extension",{ALLEGRO_PATH,C_STRING},C_BOOL),
				xal_get_path_basename = define_c_func(all,"+al_get_path_basename",{ALLEGRO_PATH},C_STRING)
				
public function al_get_path_extension(sequence path)
	return c_func(xal_get_path_extension,{path})
end function

public function al_set_path_extension(sequence path,sequence ext)
	return c_func(xal_set_path_extension,{path,ext})
end function

public function al_get_path_basename(sequence path)
	return c_func(xal_get_path_basename,{path})
end function


export constant xal_make_path_canonical = define_c_func(all,"+al_make_path_canonical",{ALLEGRO_PATH},C_BOOL)

public function al_make_path_canonical(sequence path)
	return c_func(xal_make_path_canonical,{path})
end function
­15.58