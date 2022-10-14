include std/ffi.e

include base.e
include file.e
include path.e

include std/math.e --for shift_bits()

public constant ALLEGRO_FS_ENTRY = define_c_type({
	C_POINTER --vtable
})


public constant ALLEGRO_FILEMODE_READ = 1,
				ALLEGRO_FILEMODE_WRITE = shift_bits(1,-1),
				ALLEGRO_FILEMODE_EXECUTE = shift_bits(1,-2),
				ALLEGRO_FILEMODE_HIDDEN = shift_bits(1,-3),
				ALLEGRO_FILEMODE_ISFILE = shift_bits(1,-4),
				ALLEGRO_FILEMODE_ISDIR = shift_bits(1,-5)
				
public constant EOF = -1

public constant ALLEGRO_FS_INTERFACE = define_c_type({
	C_POINTER, --fs_create_entry
	C_POINTER, --fs_destroy_entry
	C_POINTER, --fs_entry_name
	C_POINTER, --fs_update_entry
	C_POINTER, --fs_entry_mode
	C_POINTER, --fs_entry_atime
	C_POINTER, --fs_entry_mtime
	C_POINTER, --fs_entry_ctime
	C_POINTER, --fs_entry_size
	C_POINTER, --fs_entry_exists
	C_POINTER, --fs_remove_entry
	
	C_POINTER, --fs_open_directory
	C_POINTER, --fs_read_directory
	C_POINTER, --fs_close_directory
	C_POINTER, --fs_filename_exists
	C_POINTER, --fs_remove_filename
	C_POINTER, --fs_get_current_directory
	C_POINTER, --fs_change_directory
	C_POINTER, --fs_make_directory,
	
	C_POINTER --fs_open_file
})

public function fs_create_entry(sequence path)
	return 0
end function

public function fs_destroy_entry(atom e)
	return 0
end function

public function fs_entry_name(atom e)
	return 0
end function

public function fs_entry_mode(atom e)
	return 0
end function

public function fs_entry_atime(atom e)
	return 0
end function

public function fs_entry_mtime(atom e)
	return 0
end function

public function fs_entry_ctime(atom e)
	return 0
end function

public function fs_entry_size(atom e)
	return 0
end function

public function fs_entry_exists(atom e)
	return 0
end function

public function fs_remove_entry(atom e)
	return 0
end function

public function fs_open_directory(atom e)
	return 0
end function

public function fs_read_directory(atom e)
	return 0
end function

public function fs_close_directory(atom e)
	return 0
end function

public function fs_filename_exists(sequence path)
	return 0
end function

public function fs_remove_filename(sequence path)
	return 0
end function

public function fs_get_current_directory()
	return 0
end function

public function fs_change_directory(sequence path)
	return 0
end function

public function fs_make_directory(sequence path)
	return 0
end function

public function fs_open_file(atom e,sequence mode)
	return 0
end function


public constant MY_FS_INERFACE = allocate_struct(ALLEGRO_FS_INTERFACE, {
	call_back(routine_id("fs_create_entry"),{C_STRING},C_POINTER),
	call_back(routine_id("fs_destroy_entry"),{C_POINTER}),
	call_back(routine_id("fs_entry_name"),{C_POINTER}, C_STRING),
	call_back(routine_id("fs_update_entry"),{C_POINTER},C_BOOL),
	call_back(routine_id("fs_entry_mode"),{C_POINTER},C_UINT),
	call_back(routine_id("fs_entry_atime"),{C_POINTER},C_LONG),
	call_back(routine_id("fs_entry_mtime"),{C_POINTER},C_LONG),
	call_back(routine_id("fs_entry_ctime"),{C_POINTER},C_LONG),
	call_back(routine_id("fs_entry_size"),{C_POINTER},C_SIZE_T),
	call_back(routine_id("fs_entry_exists"),{C_POINTER},C_BOOL),
	call_back(routine_id("fs_remove_entry"),{C_POINTER},C_BOOL),
	call_back(routine_id("fs_open_directory"),{C_POINTER},C_BOOL),
	call_back(routine_id("fs_read_directory"),{C_POINTER},C_POINTER),
	call_back(routine_id("fs_close_directory"),{C_POINTER},C_BOOL),
	call_back(routine_id("fs_filename_exists"),{C_STRING},C_BOOL),
	call_back(routine_id("fs_remove_filename"),{C_STRING},C_BOOL),
	call_back(routine_id("fs_get_current_directory"),{},C_STRING),
	call_back(routine_id("fs_make_directory"),{C_STRING},C_BOOL),
	call_back(routine_id("fs_open_file"),{C_POINTER,C_STRING},C_POINTER)
})


export constant xal_create_fs_entry = define_c_func(all,"+al_create_fs_entry",{C_STRING},C_POINTER),
				xal_destroy_fs_entry = define_c_proc(all,"+al_destroy_fs_entry",{C_POINTER}),
				xal_get_fs_entry_name = define_c_func(all,"+al_get_fs_entry_name",{C_POINTER},C_STRING),
				xal_update_fs_entry = define_c_func(all,"+al_update_fs_entry",{C_POINTER},C_BOOL),
				xal_get_fs_entry_mode = define_c_func(all,"+al_get_fs_entry_mode",{C_POINTER},C_UINT),
				xal_get_fs_entry_atime = define_c_func(all,"+al_get_fs_entry_atime",{C_POINTER},C_LONG),
				xal_get_fs_entry_mtime = define_c_func(all,"+al_get_fs_entry_mtime",{C_POINTER},C_LONG),
				xal_get_fs_entry_ctime = define_c_func(all,"+al_get_fs_entry_ctime",{C_POINTER},C_LONG),
				xal_get_fs_entry_size = define_c_func(all,"+al_get_fs_entry_size",{C_POINTER},C_SIZE_T),
				xal_fs_entry_exists = define_c_func(all,"+al_fs_entry_exists",{C_POINTER},C_BOOL),
				xal_remove_fs_entry = define_c_func(all,"+al_remove_fs_entry",{C_POINTER},C_BOOL)
				
public function al_create_fs_entry(sequence path)
	return c_func(xal_create_fs_entry,{path})
end function

public procedure al_destroy_fs_entry(atom e)
	c_proc(xal_destroy_fs_entry,{e})
end procedure

public function al_get_fs_entry_name(atom e)
	return c_func(xal_get_fs_entry_name,{e})
end function

public function al_update_fs_entry(atom e)
	return c_func(xal_update_fs_entry,{e})
end function

public function al_get_fs_entry_mode(atom e)
	return c_func(xal_get_fs_entry_mode,{e})
end function

public function al_get_fs_entry_atime(atom e)
	return c_func(xal_get_fs_entry_atime,{e})
end function

public function al_get_fs_entry_mtime(atom e)
	return c_func(xal_get_fs_entry_mtime,{e})
end function

public function al_get_fs_entry_ctime(atom e)
	return c_func(xal_get_fs_entry_ctime,{e})
end function

public function al_get_fs_entry_size(atom e)
	return c_func(xal_get_fs_entry_size,{e})
end function

public function al_fs_entry_exists(atom e)
	return c_func(xal_fs_entry_exists,{e})
end function

public function al_remove_fs_entry(atom e)
	return c_func(xal_remove_fs_entry,{e})
end function


export constant xal_open_directory = define_c_func(all,"+al_open_directory",{C_POINTER},C_BOOL),
				xal_read_directory = define_c_func(all,"+al_read_directory",{C_POINTER},C_POINTER),
				xal_close_directory = define_c_func(all,"+al_close_directory",{C_POINTER},C_BOOL)
				
public function al_open_directory(atom e)
	return c_func(xal_open_directory,{e})
end function

public function al_read_directory(atom e)
	return c_func(xal_read_directory,{e})
end function

public function al_close_directory(atom e)
	return c_func(xal_close_directory,{e})
end function


export constant xal_filename_exists = define_c_func(all,"+al_filename_exists",{C_STRING},C_BOOL),
				xal_remove_filename = define_c_func(all,"+al_remove_filename",{C_STRING},C_BOOL),
				xal_get_current_directory = define_c_func(all,"+al_get_current_directory",{},C_STRING),
				xal_change_directory = define_c_func(all,"+al_change_directory",{C_STRING},C_BOOL),
				xal_make_directory = define_c_func(all,"+al_make_directory",{C_STRING},C_BOOL)
				
public function al_filename_exists(sequence path)
	return c_func(xal_filename_exists,{path})
end function

public function al_remove_filename(sequence path)
	return c_func(xal_remove_filename,{path})
end function

public function al_get_current_directory()
	return c_func(xal_get_current_directory,{})	
end function

public function al_change_directory(sequence path)
	return c_func(xal_change_directory,{path})
end function

public function al_make_directory(sequence path)
	return c_func(xal_make_directory,{path})
end function


export constant xal_open_fs_entry = define_c_func(all,"+al_open_fs_entry",{C_POINTER,C_STRING},C_POINTER)

public function al_open_fs_entry(atom e,sequence mode)
	return c_func(xal_open_fs_entry,{e,mode})
end function

public enum type ALLEGRO_FOR_EACH_FS_ENTRY_RESULT
   ALLEGRO_FOR_EACH_FS_ENTRY_ERROR = -1,
   ALLEGRO_FOR_EACH_FS_ENTRY_OK    =  0,
   ALLEGRO_FOR_EACH_FS_ENTRY_SKIP  =  1,
   ALLEGRO_FOR_EACH_FS_ENTRY_STOP  =  2
end type


export constant xal_for_each_fs_entry = define_c_func(all,"+al_for_each_fs_entry",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function al_for_each_fs_entry(atom xdir,atom cb,atom extra,atom extra2)
	return c_func(xal_for_each_fs_entry,{xdir,cb,extra,extra2})
end function


export constant xal_get_fs_interface = define_c_func(all,"+al_get_fs_interface",{},C_POINTER),
				xal_set_fs_interface = define_c_proc(all,"+al_set_fs_interface",{ALLEGRO_FS_INTERFACE}),
				xal_set_standard_fs_interface = define_c_proc(all,"+al_set_standard_fs_interface",{})
				
public function al_get_fs_interface()
	return c_func(xal_get_fs_interface,{})
end function

public procedure al_set_fs_interface(sequence vtable)
	c_proc(xal_set_fs_interface,{vtable})
end procedure

public procedure al_set_standard_fs_interface()
	c_proc(xal_set_standard_fs_interface,{})
end procedure
­283.41