include std/ffi.e

include base.e
include path.e
include utf8.e

public constant ALLEGRO_FILE = define_c_struct({C_POINTER})

public enum type ALLEGRO_SEEK
	ALLEGRO_SEEK_SET = 0,
	ALLEGRO_SEEK_CUR,
	ALLEGRO_SEEK_END
end type

export constant ALLEGRO_FILE_INTERFACE = define_c_struct({
	C_POINTER, --void fi_open
	C_POINTER, --bool fi_close
	C_POINTER, --size_t fi_read
	C_POINTER, --size_t fi_write
	C_POINTER, --bool fi_fflush
	C_POINTER, --int64 fi_tell
	C_POINTER, --bool fi_seek
	C_POINTER, --bool fi_feof
	C_POINTER, --int fi_ferror
	C_POINTER, --const char fi_ferrmsg
	C_POINTER, --void fi_fclearerr
	C_POINTER, --int fi_fungetc
	C_POINTER --off_t fi_ize
})

function fi_open(sequence path,sequence mode)
	return 0
end function

function fi_fclose(atom handle)
	return 0
end function

function fi_fwrite( atom f, atom ptr, atom size ) 
    return 0 
end function 
 
function fi_fflush( atom f ) 
    return 0 
end function 
 
function fi_ftell( atom f ) 
    return 0 
end function 
 
function fi_fseek( atom f, atom offset, atom whence ) 
    return 0 
end function 
 
function fi_feof( atom f ) 
    return 0 
end function 
 
function fi_ferror( atom f ) 
    return 0 
end function 
 
function fi_ferrmsg( atom f ) 
    return 0 
end function 
 
function fi_fclearerr( atom f ) 
    return 0 
end function 
 
function fi_fungetc( atom f, integer c ) 
    return 0 
end function 
 
function fi_fsize( atom f ) 
    return 0 
end function 

constant C_OFF_T = C_LONG_PTR

constant MY_INTERFACE = allocate_struct( ALLEGRO_FILE_INTERFACE, { 
    call_back( routine_id("fi_fopen"), {C_STRING,C_STRING}, C_POINTER ), 
    call_back( routine_id("fi_fclose"), {C_POINTER}, C_BOOL ), 
    call_back( routine_id("fi_fread"), {C_POINTER,C_POINTER,C_SIZE_T}, C_SIZE_T ), 
    call_back( routine_id("fi_fwrite"), {C_POINTER,C_POINTER,C_SIZE_T}, C_SIZE_T ), 
    call_back( routine_id("fi_fflush"), {C_POINTER}, C_BOOL ), 
    call_back( routine_id("fi_ftell"), {C_POINTER}, C_INT64 ), 
    call_back( routine_id("fi_fseek"), {C_POINTER,C_INT64,C_INT}, C_BOOL ), 
    call_back( routine_id("fi_feof"), {C_POINTER}, C_BOOL ), 
    call_back( routine_id("fi_ferror"), {C_POINTER}, C_INT ), 
    call_back( routine_id("fi_ferrmsg"), {C_POINTER}, C_POINTER ), 
    call_back( routine_id("fi_fclearerr"), {C_POINTER}, C_VOID ), 
    call_back( routine_id("fi_fungetc"), {C_POINTER,C_INT}, C_INT ), 
    call_back( routine_id("fi_fsize"), {C_POINTER}, C_OFF_T ) 
}) 

export constant xal_fopen = define_c_func(all,"+al_fopen",{C_STRING,C_STRING},C_POINTER),
				xal_fopen_interface = define_c_func(all,"+al_fopen_interface",{C_POINTER,C_STRING,C_STRING},C_POINTER),
				xal_create_file_handle = define_c_func(all,"+al_create_file_handle",{C_POINTER,C_POINTER},C_POINTER),
				xal_fclose = define_c_func(all,"+al_fclose",{C_POINTER},C_BOOL),
				xal_fread = define_c_func(all,"+al_fread",{C_POINTER},C_SIZE_T),
				xal_fwrite = define_c_func(all,"+al_fwrite",{C_POINTER,C_POINTER,C_SIZE_T},C_SIZE_T),
				xal_fflush = define_c_func(all,"+al_fflush",{C_POINTER},C_BOOL),
				xal_ftell = define_c_func(all,"+al_ftell",{C_POINTER},C_LONG),
				xal_fseek = define_c_func(all,"+al_fseek",{C_POINTER,C_LONG,C_INT},C_BOOL),
				xal_feof = define_c_func(all,"+al_feof",{C_POINTER},C_BOOL),
				xal_ferror = define_c_func(all,"+al_ferror",{C_POINTER},C_INT),
				xal_ferrmsg = define_c_func(all,"+al_ferrmsg",{C_POINTER},C_STRING),
				xal_fclearerr = define_c_proc(all,"+fclearerr",{C_POINTER}),
				xal_fungetc = define_c_func(all,"+al_ffungetc",{C_POINTER,C_INT},C_INT),
				xal_fsize = define_c_func(all,"+al_fisze",{C_POINTER},C_LONG)

public function al_fopen(sequence path,sequence mode)
	return c_func(xal_fopen,{path,mode})	
end function

public function al_fopen_interface(object vt,sequence path,sequence mode)
	return c_func(xal_fopen_interface,{vt,path,mode})
end function

public function al_create_file_handle(object vt,atom userdata)
	return c_func(xal_create_file_handle,{vt,userdata})
end function

public function al_fclose(atom f)
	return c_func(xal_fclose,{f})
end function

public function al_fread(atom f,atom ptr,atom size)
	return c_func(xal_fread,{f,ptr,size})
end function

public function al_fwrite(atom f,atom ptr,atom size)
	return c_func(xal_fwrite,{f,ptr,size})
end function

public function al_fflush(atom f)
	return c_func(xal_fflush,{f})
end function

public function al_ftell(atom f)
	return c_func(xal_ftell,{f})
end function

public function al_fseek(atom f,atom offset,atom whence)
	return c_func(xal_fseek,{f,offset,whence})
end function

public function al_feof(atom f)
	return c_func(xal_feof,{f})
end function

public function al_ferror(atom f)
	return c_func(xal_ferror,{f})
end function

public function al_ferrmsg(atom f)
	return c_func(xal_ferrmsg,{f})
end function

public procedure al_fclearerr(atom f)
	c_proc(xal_fclearerr,{f})
end procedure

public function al_fungetc(atom f,atom c)
	return c_func(xal_fungetc,{f,c})
end function

public function al_fsize(atom f)
	return c_func(xal_fsize,{f})
end function


export constant xal_fgetc = define_c_func(all,"+al_fgetc",{C_POINTER},C_INT),
				xal_fputc = define_c_func(all,"+al_fputc",{C_POINTER,C_INT},C_INT),
				xal_fread16le = define_c_func(all,"+al_fread16le",{C_POINTER},C_INT),
				xal_fread16be = define_c_func(all,"+al_fread16be",{C_POINTER},C_INT),
				xal_fwrite16le = define_c_func(all,"+al_fwrite16le",{C_POINTER,C_INT},C_SIZE_T),
				xal_fwrite16be = define_c_func(all,"+al_fwrite16be",{C_POINTER,C_INT},C_SIZE_T),
				xal_fread32le = define_c_func(all,"+al_fread32le",{C_POINTER},C_INT),
				xal_fread32be = define_c_func(all,"+al_fread32be",{C_POINTER},C_INT),
				xal_fwrite32le = define_c_func(all,"+al_fwrite32le",{C_POINTER,C_INT},C_SIZE_T),
				xal_fwrite32be = define_c_func(all,"+al_fwrite32be",{C_POINTER,C_INT},C_SIZE_T),
				xal_fgets = define_c_func(all,"+al_fgets",{C_POINTER,C_POINTER,C_SIZE_T},C_POINTER),
				xal_fget_ustr = define_c_func(all,"+al_fget_ustr",{C_POINTER},C_POINTER),
				xal_fputs = define_c_func(all,"+al_fputs",{C_POINTER,C_STRING},C_INT),
				xal_fprintf = define_c_func(all,"+al_fprintf",{C_POINTER,C_STRING},C_INT),
				xal_vfprintf = define_c_func(all,"+al_vfprintf",{C_POINTER,C_STRING,C_POINTER},C_INT)
				
public function al_fgetc(atom f)
	return c_func(xal_fgetc,{f})
end function

public function al_fputc(atom f,atom c)
	return c_func(xal_fputc,{f,c})
end function

public function al_fread16le(atom f)
	return c_func(xal_fread16le,{f})
end function

public function al_fread16be(atom f)
	return c_func(xal_fread16be,{f})
end function

public function al_fwrite16le(atom f,atom w)
	return c_func(xal_fwrite16le,{f,w})
end function

public function al_fwrite16be(atom f,atom w)
	return c_func(xal_fwrite16be,{f,w})
end function

public function al_fread32le(atom f)
	return c_func(xal_fread32le,{f})
end function

public function al_fread32be(atom f)
	return c_func(xal_fread32be,{f})
end function

public function al_fwrite32le(atom f,atom l)
	return c_func(xal_fwrite32le,{f,l})
end function

public function al_fwrite32be(atom f,atom l)
	return c_func(xal_fwrite32be,{f,l})
end function

public function al_fgets(atom f,sequence p,atom max)
	return c_func(xal_fgets,{f,p,max})
end function

public function al_fget_ustr(atom f)
	return c_func(xal_fget_ustr,{f})
end function

public function al_fputs(atom f,sequence p)
	return c_func(xal_fputs,{f,p})
end function

public function al_fprintf(atom f,sequence format)
	return c_func(xal_fprintf,{f,format})
end function

public function al_vfprintf(atom f,sequence format,object args)
	return c_func(xal_vfprintf,{f,format,args})
end function


export constant xal_fopen_fd = define_c_func(all,"+al_fopen_fd",{C_INT,C_STRING},C_POINTER),
				xal_make_temp_file = define_c_func(all,"+al_make_temp_file",{C_STRING,C_POINTER},C_POINTER)
				
public function al_fopen_fd(atom fd,sequence mode)
	return c_func(xal_fopen_fd,{fd,mode})
end function

public function al_make_temp_file(sequence tmp,object path)
	return c_func(xal_make_temp_file,{tmp,path})
end function


export constant xal_fopen_slice = define_c_func(all,"+al_fopen_slice",{C_POINTER,C_SIZE_T,C_STRING},C_POINTER)

public function al_fopen_slice(atom fp,atom size,sequence mode)
	return c_func(xal_fopen_slice,{fp,size,mode})
end function


export constant xal_get_new_file_interface = define_c_func(all,"+al_get_new_file_interface",{},C_POINTER),
				xal_set_new_file_interface = define_c_proc(all,"+al_set_new_file_interface",{C_POINTER}),
				xal_set_standard_file_interface = define_c_proc(all,"+al_set_standard_file_interface",{})
				

public function al_get_new_file_interface()
	return c_func(xal_get_new_file_interface,{})
end function

public procedure al_set_new_file_interface(object file_interface)
	c_proc(xal_set_new_file_interface,{file_interface})
end procedure

public procedure al_set_standard_file_interface()
	c_proc(xal_set_standard_file_interface,{})
end procedure


export constant xal_get_file_userdata = define_c_func(all,"+al_get_file_userdata",{C_POINTER},C_POINTER)

public function al_get_file_userdata(atom f)
	return c_func(xal_get_file_userdata,{f})
end function
­7.58