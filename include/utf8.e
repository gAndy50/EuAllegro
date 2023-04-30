include std/ffi.e

include base.e

public constant ALLEGRO_USTR = define_c_struct({C_POINTER})
public constant ALLEGRO_USTR_INFO = define_c_struct({C_POINTER})

public constant _al_tabstring = define_c_struct({
	C_INT, --mlen
	C_INT, --slen
	C_POINTER --data
})

export constant xal_ustr_new = define_c_func(all,"+al_ustr_new",{C_STRING},ALLEGRO_USTR),
				xal_ustr_new_from_buffer = define_c_func(all,"+al_ustr_new_from_buffer",{C_STRING,C_SIZE_T},ALLEGRO_USTR),
				xal_ustr_newf = define_c_func(all,"+al_ustr_newf",{C_STRING,C_POINTER},ALLEGRO_USTR),
				xal_ustr_free = define_c_proc(all,"+al_ustr_free",{ALLEGRO_USTR}),
				xal_cstr = define_c_func(all,"+al_cstr",{ALLEGRO_USTR},C_STRING),
				xal_ustr_to_buffer = define_c_proc(all,"+al_ustr_to_buffer",{ALLEGRO_USTR,C_POINTER,C_SIZE_T}),
				xal_cstr_dup = define_c_func(all,"+al_cstr_dup",{ALLEGRO_USTR},C_POINTER),
				xal_ustr_dup = define_c_func(all,"+al_ustr_dup",{ALLEGRO_USTR},ALLEGRO_USTR),
				xal_ustr_dup_substr = define_c_func(all,"+al_ustr_dup_substr",{ALLEGRO_USTR,C_INT,C_INT},ALLEGRO_USTR)

public function al_ustr_new(sequence s)
	return c_func(xal_ustr_new,{s})
end function

public function al_ustr_new_from_buffer(sequence s,atom size)
	return c_func(xal_ustr_new_from_buffer,{s,size})
end function

public function al_ustr_newf(sequence fmt,atom x)
	return c_func(xal_ustr_newf,{fmt,x}) --x is whatever variable is needed, it can be 0 or null if not needed
end function

public procedure al_ustr_free(atom us)
	c_proc(xal_ustr_free,{us})
end procedure

public function al_cstr(atom us)
	return c_func(xal_cstr,{us})
end function

public procedure al_ustr_to_buffer(atom us,object buffer,atom size)
	c_proc(xal_ustr_to_buffer,{us,buffer,size})
end procedure

public function al_cstr_dup(atom us)
	return c_func(xal_cstr_dup,{us})
end function

public function al_ustr_dup(atom us)
	return c_func(xal_ustr_dup,{us})
end function

public function al_ustr_dup_substr(atom us,atom start_pos,atom end_pos)
	return c_func(xal_ustr_dup_substr,{us,start_pos,end_pos})
end function


export constant xal_ustr_empty_string = define_c_func(all,"+al_ustr_empty_string",{},ALLEGRO_USTR)

public function al_ustr_empty_string()
	return c_func(xal_ustr_empty_string,{})
end function


export constant xal_ref_cstr = define_c_func(all,"+al_ref_cstr",{ALLEGRO_USTR_INFO,C_STRING},ALLEGRO_USTR),
				xal_ref_buffer = define_c_func(all,"+al_ref_buffer",{ALLEGRO_USTR_INFO,C_STRING,C_SIZE_T},ALLEGRO_USTR),
				xal_ref_ustr = define_c_func(all,"+al_ref_ustr",{ALLEGRO_USTR_INFO,ALLEGRO_USTR,C_INT,C_INT},ALLEGRO_USTR)
				
public function al_ref_cstr(atom info,sequence s)
	return c_func(xal_ref_cstr,{info,s})
end function

public function al_ref_buffer(atom info,sequence s,atom size)
	return c_func(xal_ref_buffer,{info,s,size})
end function

public function al_ref_ustr(atom info,atom us,atom start_pos,atom end_pos)
	return c_func(xal_ref_ustr,{info,us,start_pos,end_pos})
end function


export constant xal_ustr_size = define_c_func(all,"+al_ustr_size",{ALLEGRO_USTR},C_SIZE_T),
				xal_ustr_length = define_c_func(all,"+al_ustr_length",{ALLEGRO_USTR},C_SIZE_T),
				xal_ustr_offset = define_c_func(all,"+al_ustr_offset",{ALLEGRO_USTR,C_INT},C_INT),
				xal_ustr_next = define_c_func(all,"+al_ustr_next",{ALLEGRO_USTR,C_POINTER},C_BOOL),
				xal_ustr_prev = define_c_func(all,"+al_ustr_prev",{ALLEGRO_USTR,C_POINTER},C_BOOL)
				
public function al_ustr_size(atom us)
	return c_func(xal_ustr_size,{us})
end function

public function al_ustr_length(atom us)
	return c_func(xal_ustr_length,{us})
end function

public function al_ustr_offset(atom us,atom index)
	return c_func(xal_ustr_offset,{us,index})
end function

public function al_ustr_next(atom us,atom pos)
	return c_func(xal_ustr_next,{us,pos})
end function

public function al_ustr_prev(atom us,atom pos)
	return c_func(xal_ustr_prev,{us,pos})
end function


export constant xal_ustr_get = define_c_func(all,"+al_ustr_get",{ALLEGRO_USTR,C_INT},C_INT),
				xal_ustr_get_next = define_c_func(all,"+al_ustr_get_next",{ALLEGRO_USTR,C_POINTER},C_INT),
				xal_ustr_prev_get = define_c_func(all,"+al_ustr_prev_get",{ALLEGRO_USTR,C_POINTER},C_INT)
				
public function al_ustr_get(atom us,atom pos)
	return c_func(xal_ustr_get,{us,pos})
end function

public function al_ustr_get_next(atom us,atom pos)
	return c_func(xal_ustr_get_next,{us,pos})
end function

public function al_ustr_prev_get(atom us,atom pos)
	return c_func(xal_ustr_prev_get,{us,pos})
end function


export constant xal_ustr_insert = define_c_func(all,"+al_ustr_insert",{ALLEGRO_USTR,C_INT,ALLEGRO_USTR},C_BOOL),
				xal_ustr_insert_cstr = define_c_func(all,"+al_ustr_insert_cstr",{ALLEGRO_USTR,C_INT,C_STRING},C_BOOL),
				xal_ustr_insert_chr = define_c_func(all,"+al_ustr_insert_chr",{ALLEGRO_USTR,C_INT,C_INT},C_SIZE_T)
				
public function al_ustr_insert(atom us,atom pos,atom us2)
	return c_func(xal_ustr_insert,{us,pos,us2})
end function

public function al_ustr_insert_cstr(atom us,atom pos,sequence us2)
	return c_func(xal_ustr_insert_cstr,{us,pos,us2})
end function

public function al_ustr_insert_chr(atom us,atom pos,atom c)
	return c_func(xal_ustr_insert_chr,{us,pos,c})
end function


export constant xal_ustr_append = define_c_func(all,"+al_ustr_append",{ALLEGRO_USTR,ALLEGRO_USTR},C_BOOL),
				xal_ustr_append_cstr = define_c_func(all,"+al_ustr_append_cstr",{ALLEGRO_USTR,C_STRING},C_BOOL),
				xal_ustr_append_chr = define_c_func(all,"+al_ustr_append_chr",{ALLEGRO_USTR,C_INT},C_SIZE_T),
				xal_ustr_appendf = define_c_func(all,"+al_ustr_appendf",{ALLEGRO_USTR,C_STRING},C_BOOL),
				xal_ustr_vappendf = define_c_func(all,"+al_ustr_vappendf",{ALLEGRO_USTR,C_STRING,C_POINTER},C_BOOL)
				
public function al_ustr_append(atom us,atom us2)
	return c_func(xal_ustr_append,{us,us2})
end function

public function al_ustr_append_cstr(atom us,sequence s)
	return c_func(xal_ustr_append_cstr,{us,s})
end function

public function al_ustr_append_chr(atom us,atom c)
	return c_func(xal_ustr_append_chr,{us,c})
end function

public function al_ustr_appendf(atom us,sequence fmt)
	return c_func(xal_ustr_appendf,{us,fmt})
end function

public function al_ustr_vappendf(atom us,sequence fmt,object ap)
	return c_func(xal_ustr_vappendf,{us,fmt,ap})
end function


export constant xal_ustr_remove_chr = define_c_func(all,"+al_ustr_remove_chr",{ALLEGRO_USTR,C_INT},C_BOOL),
				xal_ustr_remove_range = define_c_func(all,"+al_ustr_remove_range",{ALLEGRO_USTR,C_INT,C_INT},C_BOOL),
				xal_ustr_truncate = define_c_func(all,"+al_ustr_truncate",{ALLEGRO_USTR,C_INT},C_BOOL),
				xal_ustr_ltrim_ws = define_c_func(all,"+al_ustr_ltrim_ws",{ALLEGRO_USTR},C_BOOL),
				xal_ustr_rtrim_ws = define_c_func(all,"+al_ustr_rtrim_ws",{ALLEGRO_USTR},C_BOOL),
				xal_ustr_trim_ws = define_c_func(all,"+al_ustr_trim_ws",{ALLEGRO_USTR},C_BOOL)
				
public function al_ustr_remove_chr(atom us,atom pos)
	return c_func(xal_ustr_remove_chr,{us,pos})
end function

public function al_ustr_remove_range(atom us,atom start_pos,atom end_pos)
	return c_func(xal_ustr_remove_range,{us,start_pos,end_pos})
end function

public function al_ustr_truncate(atom us,atom start_pos)
	return c_func(xal_ustr_truncate,{us,start_pos})
end function

public function al_ustr_ltrim_ws(atom us)
	return c_func(xal_ustr_ltrim_ws,{us})
end function

public function al_ustr_rtrim_ws(atom us)
	return c_func(xal_ustr_trim_ws,{us})
end function

public function al_ustr_trim_ws(atom us)
	return c_func(xal_ustr_trim_ws,{us})
end function


export constant xal_ustr_assign = define_c_func(all,"+al_ustr_assign",{ALLEGRO_USTR,ALLEGRO_USTR},C_BOOL),
				xal_ustr_assign_substr = define_c_func(all,"+al_ustr_assign_substr",{ALLEGRO_USTR,ALLEGRO_USTR,C_INT,C_INT},C_BOOL),
				xal_ustr_assign_cstr = define_c_func(all,"+al_ustr_assign_cstr",{ALLEGRO_USTR,C_STRING},C_BOOL)
				
public function al_ustr_assign(atom us,atom us2)
	return c_func(xal_ustr_assign,{us,us2})
end function

public function al_ustr_assign_substr(atom us,atom us2,atom start_pos,atom end_pos)
	return c_func(xal_ustr_assign_substr,{us,us2,start_pos,end_pos})
end function

public function al_ustr_assign_cstr(atom us,sequence s)
	return c_func(xal_ustr_assign_cstr,{us,s})
end function


export constant xal_ustr_set_chr = define_c_func(all,"+al_ustr_set_chr",{ALLEGRO_USTR,C_INT,C_INT},C_SIZE_T),
				xal_ustr_replace_range = define_c_func(all,"+al_ustr_replace_range",{ALLEGRO_USTR,C_INT,C_INT,ALLEGRO_USTR},C_BOOL)
				
public function al_ustr_set_chr(atom us,atom pos,atom c)
	return c_func(xal_ustr_set_chr,{us,pos,c})
end function

public function al_ustr_replace_range(atom us,atom start_pos,atom end_pos,atom us2)
	return c_func(xal_ustr_replace_range,{us,start_pos,end_pos,us2})
end function


export constant xal_ustr_find_chr = define_c_func(all,"+al_ustr_find_chr",{ALLEGRO_USTR,C_INT,C_INT},C_INT),
				xal_ustr_rfind_chr = define_c_func(all,"+al_ustr_rfind_chr",{ALLEGRO_USTR,C_INT,C_INT},C_INT),
				xal_ustr_find_set = define_c_func(all,"+al_ustr_find_set",{ALLEGRO_USTR,C_INT,ALLEGRO_USTR},C_INT),
				xal_ustr_find_set_cstr = define_c_func(all,"+al_ustr_find_set_cstr",{ALLEGRO_USTR,C_INT,C_STRING},C_INT),
				xal_ustr_find_cset = define_c_func(all,"+al_ustr_find_cset",{ALLEGRO_USTR,C_INT,ALLEGRO_USTR},C_INT),
				xal_ustr_find_cset_cstr = define_c_func(all,"+al_ustr_find_cset_cstr",{ALLEGRO_USTR,C_INT,C_STRING},C_INT),
				xal_ustr_find_str = define_c_func(all,"+al_ustr_find_str",{ALLEGRO_USTR,C_INT,ALLEGRO_USTR},C_INT),
				xal_ustr_find_cstr = define_c_func(all,"+al_ustr_find_cstr",{ALLEGRO_USTR,C_INT,C_STRING},C_INT),
				xal_ustr_rfind_str = define_c_func(all,"+al_ustr_rfind_str",{ALLEGRO_USTR,C_INT,ALLEGRO_USTR},C_INT),
				xal_ustr_rfind_cstr = define_c_func(all,"+al_ustr_rfind_cstr",{ALLEGRO_USTR,C_INT,C_STRING},C_INT),
				xal_ustr_find_replace = define_c_func(all,"+al_ustr_find_replace",{ALLEGRO_USTR,C_INT,ALLEGRO_USTR,ALLEGRO_USTR},C_BOOL),
				xal_ustr_find_replace_cstr = define_c_func(all,"+al_ustr_find_replace_cstr",{ALLEGRO_USTR,C_INT,C_STRING,C_STRING},C_BOOL)
				
public function al_ustr_find_chr(atom us,atom start_pos,atom c)
	return c_func(xal_ustr_find_chr,{us,start_pos,c})
end function

public function al_ustr_rfind_chr(atom us,atom start_pos,atom c)
	return c_func(xal_ustr_rfind_chr,{us,start_pos,c})
end function

public function al_ustr_find_set(atom us,atom start_pos,atom accept)
	return c_func(xal_ustr_find_set,{us,start_pos,accept})
end function

public function al_ustr_find_set_cstr(atom us,atom start_pos,sequence accept)
	return c_func(xal_ustr_find_set_cstr,{us,start_pos,accept})
end function

public function al_ustr_find_cset(atom us,atom start_pos,atom reject)
	return c_func(xal_ustr_find_cset,{us,start_pos,reject})
end function

public function al_ustr_find_cset_cstr(atom us,atom start_pos,sequence reject)
	return c_func(xal_ustr_find_cset_cstr,{us,start_pos,reject})
end function

public function al_ustr_find_str(atom haystack,atom start_pos,atom needle)
	return c_func(xal_ustr_find_str,{haystack,start_pos,needle})
end function

public function al_ustr_find_cstr(atom haystack,atom start_pos,sequence needle)
	return c_func(xal_ustr_find_cstr,{haystack,start_pos,needle})
end function

public function al_ustr_rfind_str(atom haystack,atom start_pos,atom needle)
	return c_func(xal_ustr_rfind_str,{haystack,start_pos,needle})
end function

public function al_ustr_rfind_cstr(atom haystack,atom start_pos,sequence needle)
	return c_func(xal_ustr_rfind_cstr,{haystack,start_pos,needle})
end function

public function al_ustr_find_replace(atom us,atom start_pos,atom xfind,atom replace)
	return c_func(xal_ustr_find_replace,{us,start_pos,xfind,replace})
end function

public function al_ustr_find_replace_cstr(atom us,atom start_pos,sequence xfind,sequence replace)
	return c_func(xal_ustr_find_replace_cstr,{us,start_pos,xfind,replace})
end function


export constant xal_ustr_equal = define_c_func(all,"+al_ustr_equal",{ALLEGRO_USTR,ALLEGRO_USTR},C_BOOL),
				xal_ustr_compare = define_c_func(all,"+al_ustr_compare",{ALLEGRO_USTR,ALLEGRO_USTR},C_INT),
				xal_ustr_ncompare = define_c_func(all,"+al_ustr_ncompare",{ALLEGRO_USTR,ALLEGRO_USTR,C_INT},C_INT),
				xal_ustr_has_prefix = define_c_func(all,"+al_ustr_has_prefix",{ALLEGRO_USTR,ALLEGRO_USTR},C_BOOL),
				xal_ustr_has_prefix_cstr = define_c_func(all,"+al_ustr_has_prefix_cstr",{ALLEGRO_USTR,C_STRING},C_BOOL),
				xal_ustr_has_suffix = define_c_func(all,"+al_ustr_has_suffix",{ALLEGRO_USTR,ALLEGRO_USTR},C_BOOL),
				xal_ustr_has_suffix_cstr = define_c_func(all,"+al_ustr_has_suffix_cstr",{ALLEGRO_USTR,C_STRING},C_BOOL)
				
public function al_ustr_equal(atom us,atom us2)
	return c_func(xal_ustr_equal,{us,us2})
end function

public function al_ustr_compare(atom u,atom v)
	return c_func(xal_ustr_compare,{u,v})
end function

public function al_ustr_ncompare(atom us,atom us2,atom n)
	return c_func(xal_ustr_ncompare,{us,us2,n})
end function

public function al_ustr_has_prefix(atom u,atom v)
	return c_func(xal_ustr_has_prefix,{u,v})
end function

public function al_ustr_has_prefix_cstr(atom u,sequence s)
	return c_func(xal_ustr_has_prefix_cstr,{u,s})
end function

public function al_ustr_has_suffix(atom u,atom v)
	return c_func(xal_ustr_has_suffix,{u,v})
end function

public function al_ustr_has_suffix_cstr(atom us,sequence s)
	return c_func(xal_ustr_has_suffix_cstr,{us,s})
end function


export constant xal_utf8_width = define_c_func(all,"+al_utf8_width",{C_INT},C_SIZE_T),
				xal_utf8_encode = define_c_func(all,"+al_utf8_encode",{C_CHAR,C_INT},C_SIZE_T)
				
public function al_utf8_width(atom c)
	return c_func(xal_utf8_width,{c})
end function

public function al_utf8_encode(sequence s,atom c)
	return c_func(xal_utf8_encode,{s,c})
end function


export constant xal_ustr_new_from_utf16 = define_c_func(all,"+al_ustr_new_from_utf16",{C_POINTER},ALLEGRO_USTR),
				xal_ustr_size_utf16 = define_c_func(all,"+al_ustr_size_utf16",{ALLEGRO_USTR},C_SIZE_T),
				xal_ustr_encode_utf16 = define_c_func(all,"+al_ustr_encode_utf16",{ALLEGRO_USTR,C_POINTER,C_SIZE_T},C_SIZE_T),
				xal_utf16_width = define_c_func(all,"+al_utf16_width",{C_INT},C_SIZE_T),
				xal_utf16_encode = define_c_func(all,"+al_utf16_encode",{C_UINT,C_INT},C_SIZE_T)
				
public function al_ustr_new_from_utf16(atom s)
	return c_func(xal_ustr_new_from_utf16,{s})
end function

public function al_ustr_size_utf16(atom us)
	return c_func(xal_ustr_size_utf16,{us})
end function

public function al_ustr_encode_utf16(atom us,atom s,atom n)
	return c_func(xal_ustr_encode_utf16,{us,s,n})
end function

public function al_utf16_width(atom c)
	return c_func(xal_utf16_width,{c})
end function

public function al_utf16_encode(object s,atom c)
	return c_func(xal_utf16_encode,{s,c})
end function
­6.63