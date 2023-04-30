--Allegro TTF addon
--Written by Icy_Viking

include std/ffi.e
include std/machine.e
include std/os.e

public atom ttf = 0

include allegro.e
include allegro_font.e

ifdef WINDOWS then
	  ttf = open_dll("allegro_ttf-5.2.dll")
	elsifdef LINUX or FREEBSD then
	  ttf = open_dll("liballegro_ttf-5.2.dll.so")
end ifdef

public constant ALLEGRO_TTF_NO_KERNING = 1,
				ALLEGRO_TTF_MONOCHROME = 2,
				ALLEGRO_TTF_NO_AUTOHINT = 4

export constant xal_load_ttf_font = define_c_func(ttf,"+al_load_ttf_font",{C_STRING,C_INT,C_INT},C_POINTER),
				xal_load_ttf_font_f = define_c_func(ttf,"+al_load_ttf_font_f",{C_POINTER,C_STRING,C_INT,C_INT},C_POINTER),
				xal_load_ttf_font_stretch = define_c_func(ttf,"+al_load_ttf_font_stretch",{C_STRING,C_INT,C_INT,C_INT},C_POINTER),
				xal_load_ttf_font_stretch_f = define_c_func(ttf,"+al_load_ttf_font_stretch_f",{C_POINTER,C_STRING,C_INT,C_INT,C_INT},C_POINTER),
				xal_init_ttf_addon = define_c_func(ttf,"+al_init_ttf_addon",{},C_BOOL),
				xal_is_ttf_addon_initialized = define_c_func(ttf,"+al_is_ttf_addon_initialized",{},C_BOOL),
				xal_shutdown_ttf_addon = define_c_proc(ttf,"+al_shutdown_ttf_addon",{}),
				xal_get_allegro_ttf_version = define_c_func(ttf,"+al_get_allegro_ttf_version",{},C_UINT)
				
public function al_load_ttf_font(sequence fname,atom size,atom flags)
	return c_func(xal_load_ttf_font,{fname,size,flags})
end function

public function al_load_ttf_font_f(atom f,sequence fname,atom size,atom flags)
	return c_func(xal_load_ttf_font_f,{f,fname,size,flags})
end function

public function al_load_ttf_font_stretch(sequence fname,atom w,atom h,atom flags)
	return c_func(xal_load_ttf_font_stretch,{fname,w,h,flags})
end function

public function al_load_ttf_font_stretch_f(atom f,sequence fname,atom w,atom h,atom flags)
	return c_func(xal_load_ttf_font_stretch_f,{f,fname,w,h,flags})
end function

public function al_init_ttf_addon()
	return c_func(xal_init_ttf_addon,{})
end function

public function al_is_ttf_addon_initialized()
	return c_func(xal_is_ttf_addon_initialized,{})
end function

public procedure al_shutdown_ttf_addon()
	c_proc(xal_shutdown_ttf_addon,{})
end procedure

public function al_get_allegro_ttf_version()
	return c_func(xal_get_allegro_ttf_version,{})
end function
­16.22