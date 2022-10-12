include std/ffi.e

include base.e
include bitmap.e
include file.e

public enum ALLEGRO_KEEP_BITMAP_FORMAT = 0x0002,
			ALLEGRO_NO_PREMULTIPLIED_ALPHA = 0x0200,
			ALLEGRO_KEEP_INDEX = 0x0800
			
public constant ALLEGRO_IIO_LOADER_FUNCTION = define_c_type({
		C_STRING, --filename
		C_INT --flags
})

public constant ALLEGRO_IIO_FS_LOADER_FUNCTION = define_c_type({
		ALLEGRO_FILE, --*fp
		C_INT --flags
})

public constant ALLEGRO_IIO_SAVER_FUNCTION = define_c_type({
		C_STRING, --filename
		ALLEGRO_BITMAP --bitmap
})

public constant ALLEGRO_IIO_FS_SAVER_FUNCTION = define_c_type({
		ALLEGRO_FILE, --*fp
		ALLEGRO_BITMAP --bitmap
})

public constant ALLEGRO_IIO_IDENTIFIER_FUNCTION = define_c_type(ALLEGRO_FILE)


export constant xal_register_bitmap_loader = define_c_func(all,"+al_register_bitmap_loader",{C_STRING,ALLEGRO_IIO_LOADER_FUNCTION},C_BOOL),
				xal_register_bitmap_saver = define_c_func(all,"+al_register_bitmap_saver",{C_STRING,ALLEGRO_IIO_SAVER_FUNCTION},C_BOOL),
				xal_register_bitmap_loader_f = define_c_func(all,"+al_register_bitmap_loader_f",{C_STRING,ALLEGRO_IIO_FS_LOADER_FUNCTION},C_BOOL),
				xal_register_bitmap_saver_f = define_c_func(all,"+al_register_bitmap_saver_f",{C_STRING,ALLEGRO_IIO_FS_SAVER_FUNCTION},C_BOOL),
				xal_register_bitmap_identifier = define_c_func(all,"+al_register_bitmap_identifier",{C_STRING,ALLEGRO_IIO_IDENTIFIER_FUNCTION},C_BOOL),
				xal_load_bitmap = define_c_func(all,"+al_load_bitmap",{C_STRING},ALLEGRO_BITMAP),
				xal_load_bitmap_flags = define_c_func(all,"+al_load_bitmap_flags",{C_STRING,C_INT},ALLEGRO_BITMAP),
				xal_load_bitmap_f = define_c_func(all,"+al_load_bitmap_f",{ALLEGRO_FILE,C_STRING},ALLEGRO_BITMAP),
				xal_load_bitmap_flags_f = define_c_func(all,"+al_load_bitmap_flags_f",{ALLEGRO_FILE,C_STRING,C_INT},ALLEGRO_BITMAP),
				xal_save_bitmap = define_c_func(all,"+al_save_bitmap",{C_STRING,ALLEGRO_BITMAP},C_BOOL),
				xal_save_bitmap_f = define_c_func(all,"+al_save_bitmap_f",{ALLEGRO_FILE,C_STRING,ALLEGRO_BITMAP},C_BOOL),
				xal_identify_bitmap_f = define_c_func(all,"+al_identify_bitmap_f",{ALLEGRO_FILE},C_STRING),
				xal_identify_bitmap = define_c_func(all,"+al_identify_bitmap",{C_STRING},C_STRING)

public function al_register_bitmap_loader(sequence ext,sequence loader)
	return c_func(xal_register_bitmap_loader,{ext,loader})
end function

public function al_register_bitmap_saver(sequence ext,sequence saver)
	return c_func(xal_register_bitmap_saver,{ext,saver})
end function

public function al_register_bitmap_loader_f(sequence ext,sequence fs_loader)
	return c_func(xal_register_bitmap_loader_f,{ext,fs_loader})
end function

public function al_register_bitmap_saver_f(sequence ext,sequence fs_saver)
	return c_func(xal_register_bitmap_saver_f,{ext,fs_saver})
end function

public function al_register_bitmap_identifier(sequence ext,sequence identifier)
	return c_func(xal_register_bitmap_identifier,{ext,identifier})
end function

public function al_load_bitmap(sequence fname)
	return c_func(xal_load_bitmap,{fname})
end function

public function al_load_bitmap_flags(sequence fname,atom flags)
	return c_func(xal_load_bitmap_flags,{fname,flags})
end function

public function al_load_bitmap_f(sequence fp,sequence ident)
	return c_func(xal_load_bitmap_f,{fp,ident})
end function

public function al_load_bitmap_flags_f(sequence fp,sequence ident,atom flags)
	return c_func(xal_load_bitmap_flags_f,{fp,ident,flags})
end function

public function al_save_bitmap(sequence fname,atom bitmap)
	return c_func(xal_save_bitmap,{fname,bitmap})
end function

public function al_save_bitmap_f(sequence fp,sequence ident,atom bitmap)
	return c_func(xal_save_bitmap_f,{fp,ident,bitmap})
end function

public function al_identify_bitmap_f(sequence fp)
	return c_func(xal_identify_bitmap_f,{fp})
end function

public function al_identify_bitmap(sequence fname)
	return c_func(xal_identify_bitmap,{fname})
end function
­90.12