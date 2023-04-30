--Allegro Font Addon
--Written by Icy_Viking

include std/ffi.e
include std/machine.e
include std/os.e

include allegro.e
public atom font = 0

ifdef WINDOWS then
 font = open_dll("allegro_font-5.2.dll")
 elsifdef LINUX or FREEBSD then
 font = open_dll("liballegro_font-5.2.so")
end ifdef

public constant ALLEGRO_GLYPH = define_c_struct({
	ALLEGRO_BITMAP, --bitmap
	C_INT, --x
	C_INT, --y
	C_INT, --w
	C_INT, --h
	C_INT, --kerning
	C_INT, --offset_x
	C_INT, --ofset_y
	C_INT --advance
})

public enum ALLEGRO_NO_KERNING = -1,
			ALLEGRO_ALIGN_LEFT = 0,
			ALLEGRO_ALIGN_CENTRE = 1,
			ALLEGRO_ALIGN_CENTER = 1,
			ALLEGRO_ALIGN_RIGHT = 2,
			ALLEGRO_ALIGN_INTEGER = 4
			
export constant xal_register_font_loader = define_c_func(font,"+al_register_font_loader",{C_STRING,C_POINTER,C_STRING,C_INT,C_INT},C_BOOL),
				xal_load_bitmap_font = define_c_func(font,"+al_load_bitmap_font",{C_STRING},C_POINTER),
				xal_load_bitmap_font_flags = define_c_func(font,"+al_load_bitmap_font_flags",{C_STRING,C_INT},C_POINTER),
				xal_load_font = define_c_func(font,"+al_load_font",{C_STRING,C_INT,C_INT},C_POINTER)

public function al_register_font_loader(sequence ext,atom font,sequence fname,atom size,atom flags)
	return c_func(xal_register_font_loader,{ext,font,fname,size,flags})
end function

public function al_load_bitmap_font(sequence fname)
	return c_func(xal_load_bitmap_font,{fname})
end function

public function al_load_bitmap_font_flags(sequence fname,atom flags)
	return c_func(xal_load_bitmap_font_flags,{fname,flags})
end function

public function al_load_font(sequence fname,atom size,atom flags)
	return c_func(xal_load_font,{fname,size,flags})
end function

export constant xal_grab_font_from_bitmap = define_c_func(font,"+al_grab_font_from_bitmap",{ALLEGRO_BITMAP,C_INT,C_INT},C_POINTER),
				xal_create_builtin_font = define_c_func(font,"+al_create_builtin_font",{},C_POINTER)
				
public function al_grab_font_from_bitmap(sequence bmp,atom n,atom range)
	return c_func(xal_grab_font_from_bitmap,{bmp,n,range})
end function

public function al_create_builtin_font()
	return c_func(xal_create_builtin_font,{})
end function

export constant xal_draw_ustr = define_c_proc(font,"+al_draw_ustr",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_INT,ALLEGRO_USTR}),
				xal_draw_text = define_c_proc(font,"+al_draw_text",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_INT,C_STRING}),
				xal_draw_justified_text = define_c_proc(font,"+al_draw_justified_text",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_STRING}),
				xal_draw_justified_ustr = define_c_proc(font,"+al_draw_justified_ustr",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,ALLEGRO_USTR}),
				xal_draw_textf = define_c_proc(font,"+al_draw_textf",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_INT,C_STRING}),
				xal_draw_justified_textf = define_c_proc(font,"+al_draw_justified_textf",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_STRING}),
				xal_get_text_width = define_c_func(font,"+al_get_text_width",{C_POINTER,C_STRING},C_INT),
				xal_get_ustr_width = define_c_func(font,"+al_get_ustr_width",{C_POINTER,ALLEGRO_USTR},C_INT),
				xal_get_font_line_height = define_c_func(font,"+al_get_font_line_height",{C_POINTER},C_INT),
				xal_get_font_ascent = define_c_func(font,"+al_get_font_ascent",{C_POINTER},C_INT),
				xal_get_font_descent = define_c_func(font,"+al_get_font_descent",{C_POINTER},C_INT),
				xal_destroy_font = define_c_proc(font,"+al_destroy_font",{C_POINTER}),
				xal_get_ustr_dimensions = define_c_proc(font,"+al_get_ustr_dimensions",{C_POINTER,ALLEGRO_USTR,C_STRING,C_POINTER,C_POINTER,C_POINTER,C_POINTER}),
				xal_get_text_dimensions = define_c_proc(font,"+al_get_text_dimensions",{C_POINTER,C_STRING,C_POINTER,C_POINTER,C_POINTER,C_POINTER}),
				xal_init_font_addon = define_c_func(font,"+al_init_font_addon",{},C_BOOL),
				xal_is_font_addon_initialized = define_c_func(font,"+al_is_font_addon_initialized",{},C_BOOL),
				xal_shutdown_font_addon = define_c_proc(font,"+al_shutdown_font_addon",{}),
				xal_get_allegro_font_version = define_c_func(font,"+al_get_allegro_font_version",{},C_UINT),
				xal_get_font_ranges = define_c_func(font,"+al_get_font_ranges",{C_POINTER,C_INT,C_POINTER},C_INT)
				
public procedure al_draw_ustr(atom font,sequence col,atom x,atom y,atom flags,sequence ustr)
	c_proc(xal_draw_ustr,{font,col,x,y,flags,ustr})
end procedure

public procedure al_draw_text(atom font,sequence col,atom x,atom y,atom flags,sequence text)
	c_proc(xal_draw_text,{font,col,x,y,flags,text})
end procedure

public procedure al_draw_justified_text(atom font,sequence col,atom x,atom x2,atom y,atom diff,atom flags,sequence text)
	c_proc(xal_draw_justified_text,{font,col,x,x2,y,diff,flags,text})
end procedure

public procedure al_draw_justified_ustr(atom font,sequence col,atom x,atom x2,atom y,atom diff,atom flags,sequence text)
	c_proc(xal_draw_justified_ustr,{font,col,x,x2,y,diff,flags,text})
end procedure

public procedure al_draw_textf(atom font,sequence col,atom x,atom y,atom flags,sequence format)
	c_proc(xal_draw_textf,{font,col,x,y,flags,format})
end procedure

public procedure al_draw_justified_textf(atom font,sequence col,atom x,atom x2,atom y,atom diff,atom flags,sequence format)
	c_proc(xal_draw_justified_textf,{font,col,x,x2,y,diff,flags,format})
end procedure

public function al_get_text_width(atom f,sequence str)
	return c_func(xal_get_text_width,{f,str})
end function

public function al_get_ustr_width(atom f,sequence ustr)
	return c_func(xal_get_ustr_width,{f,ustr})
end function

public function al_get_font_line_height(atom f)
	return c_func(xal_get_font_line_height,{f})
end function

public function al_get_font_ascent(atom f)
	return c_func(xal_get_font_ascent,{f})
end function

public function al_get_font_descent(atom f)
	return c_func(xal_get_font_descent,{f})
end function

public procedure al_destroy_font(atom f)
	c_proc(xal_destroy_font,{f})
end procedure

public procedure al_get_ustr_dimensions(atom f,sequence text,atom bbx,atom bby,atom bbw,atom bbh)
	c_proc(xal_get_ustr_dimensions,{f,text,bbx,bby,bbw,bbh})
end procedure

public procedure al_get_text_dimensions(atom f,sequence text,atom bbx,atom bby,atom bbw,atom bbh)
	c_proc(xal_get_text_dimensions,{f,text,bbx,bby,bbw,bbh})
end procedure

public function al_init_font_addon()
	return c_func(xal_init_font_addon,{})
end function

public function al_is_font_addon_initialized()
	return c_func(xal_is_font_addon_initialized,{})
end function

public procedure al_shutdown_font_addon()
	c_proc(xal_shutdown_font_addon,{})
end procedure

public function al_get_allegro_font_version()
	return c_func(xal_get_allegro_font_version,{})
end function

public function al_get_font_ranges(atom font,atom count,atom ranges)
	return c_func(xal_get_font_ranges,{font,count,ranges})
end function

export constant xal_draw_glyph = define_c_proc(font,"+al_draw_glyph",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_INT}),
				xal_get_glyph_width = define_c_func(font,"+al_get_glyph_width",{C_POINTER,C_INT},C_INT),
				xal_get_glyph_dimensions = define_c_func(font,"+al_get_glyph_dimensions",{C_POINTER,C_INT,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT),
				xal_get_glyph_advance = define_c_func(font,"+al_get_glyph_advance",{C_POINTER,C_INT,C_INT},C_INT),
				xal_get_glyph = define_c_func(font,"+al_get_glyph",{C_POINTER,C_INT,C_INT,ALLEGRO_GLYPH},C_BOOL)
				
public procedure al_draw_glyph(atom font,sequence col,atom x,atom y,atom cp)
	c_proc(xal_draw_glyph,{font,col,x,y,cp})
end procedure

public function al_get_glyph_width(atom font,atom cp)
	return c_func(xal_get_glyph_width,{font,cp})
end function

public function al_get_glyph_dimensions(atom f,atom cp,atom bbx,atom bby,atom bbw,atom bbh)
	return c_func(xal_get_glyph_dimensions,{f,cp,bbx,bby,bbw,bbh})
end function

public function al_get_glyph_advance(atom f,atom cp,atom cp2)
	return c_func(xal_get_glyph_advance,{f,cp,cp2})
end function

public function al_get_glyph(atom f,atom prev_cp,atom cp,sequence glyph)
	return c_func(xal_get_glyph,{f,prev_cp,cp,glyph})
end function

export constant xal_draw_multiline_text = define_c_proc(font,"+al_draw_multiline_text",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_STRING}),
				xal_draw_multiline_textf = define_c_proc(font,"+al_draw_multiline_textf",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_STRING}),
				xal_draw_multiline_ustr = define_c_proc(font,"+al_draw_multiline_ustr",{C_POINTER,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_STRING})
				
public procedure al_draw_multiline_text(atom f,sequence col,atom x,atom y,atom mw,atom lh,atom flags,sequence text)
	c_proc(xal_draw_multiline_text,{f,col,x,y,mw,lh,flags,text})
end procedure

public procedure al_draw_multiline_textf(atom f,sequence col,atom x,atom y,atom mw,atom lh,atom flags,sequence format)
	c_proc(xal_draw_multiline_textf,{f,col,x,y,mw,lh,flags,format})
end procedure

public procedure al_draw_multiline_ustr(atom f,sequence col,atom x,atom y,atom mw,atom lh,atom flags,sequence text)
	c_proc(xal_draw_multiline_ustr,{f,col,x,y,mw,lh,flags,text})
end procedure

export constant xal_do_multiline_text = define_c_proc(font,"+al_do_multiline_text",{C_POINTER,C_FLOAT,C_STRING,C_POINTER,C_INT,C_STRING,C_INT,C_POINTER,C_POINTER})

public procedure al_do_multiline_text(atom f,atom mw,sequence text,atom cb,atom line_num,sequence line,atom size,atom ext,atom ext2)
	c_proc(xal_do_multiline_text,{f,mw,text,cb,line_num,size,ext,ext2})
end procedure

export constant xal_do_multiline_ustr = define_c_proc(font,"+al_do_multiline_ustr",{C_POINTER,C_FLOAT,ALLEGRO_USTR,C_POINTER,C_INT,ALLEGRO_USTR,C_POINTER,C_POINTER})

public procedure al_do_multiline_ustr(atom f,atom mw,sequence ustr,atom cb,atom line_num,sequence line,atom ext,atom ext2)
	c_proc(xal_do_multiline_ustr,{f,mw,ustr,cb,line_num,line,ext,ext2})
end procedure

export constant xal_set_fallback_font = define_c_proc(font,"+al_set_fallback_font",{C_POINTER,C_POINTER})

public procedure al_set_fallback_font(atom f,atom cb)
	c_proc(xal_set_fallback_font,{f,cb})
end procedure

export constant xal_get_fallback_font = define_c_func(font,"+al_get_fallback_font",{C_POINTER},C_POINTER)

public function al_get_fallback_font(atom f)
	return c_func(xal_get_fallback_font,{f})
end function
­14.21