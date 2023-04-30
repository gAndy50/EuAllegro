include std/ffi.e
include std/machine.e

include base.e

public constant ALLEGRO_COLOR = define_c_struct({
	C_FLOAT, --r
	C_FLOAT, --g
	C_FLOAT, --b
	C_FLOAT --a
})

public enum type ALLEGRO_PIXEL_FORMAT
	ALLEGRO_PIXEL_FORMAT_ANY                   = 0,
  
	ALLEGRO_PIXEL_FORMAT_ANY_NO_ALPHA          = 1,
  
	ALLEGRO_PIXEL_FORMAT_ANY_WITH_ALPHA        = 2,
  
	ALLEGRO_PIXEL_FORMAT_ANY_15_NO_ALPHA       = 3,
  
	ALLEGRO_PIXEL_FORMAT_ANY_16_NO_ALPHA       = 4,
  
	ALLEGRO_PIXEL_FORMAT_ANY_16_WITH_ALPHA     = 5,
  
	 ALLEGRO_PIXEL_FORMAT_ANY_24_NO_ALPHA       = 6,
  
	 ALLEGRO_PIXEL_FORMAT_ANY_32_NO_ALPHA       = 7,
  
	  ALLEGRO_PIXEL_FORMAT_ANY_32_WITH_ALPHA     = 8,
  
	   ALLEGRO_PIXEL_FORMAT_ARGB_8888             = 9,
  
	  ALLEGRO_PIXEL_FORMAT_RGBA_8888             = 10,
  
	  ALLEGRO_PIXEL_FORMAT_ARGB_4444             = 11,
  
	   ALLEGRO_PIXEL_FORMAT_RGB_888               = 12, --/* 24 bit format */
  
	    ALLEGRO_PIXEL_FORMAT_RGB_565               = 13,
 
	     ALLEGRO_PIXEL_FORMAT_RGB_555               = 14,
  
	     ALLEGRO_PIXEL_FORMAT_RGBA_5551             = 15,
  
	      ALLEGRO_PIXEL_FORMAT_ARGB_1555             = 16,
  
	        ALLEGRO_PIXEL_FORMAT_ABGR_8888             = 17,
  
	         ALLEGRO_PIXEL_FORMAT_XBGR_8888             = 18,
  
	            ALLEGRO_PIXEL_FORMAT_BGR_888               = 19, --/* 24 bit format */
  
	          ALLEGRO_PIXEL_FORMAT_BGR_565               = 20,
  
	             ALLEGRO_PIXEL_FORMAT_BGR_555               = 21,
  
	           ALLEGRO_PIXEL_FORMAT_RGBX_8888             = 22,
  
	             ALLEGRO_PIXEL_FORMAT_XRGB_8888             = 23,
  
	              ALLEGRO_PIXEL_FORMAT_ABGR_F32              = 24,
  
	               ALLEGRO_PIXEL_FORMAT_ABGR_8888_LE          = 25,
  
	                 ALLEGRO_PIXEL_FORMAT_RGBA_4444             = 26,
  
	                 ALLEGRO_PIXEL_FORMAT_SINGLE_CHANNEL_8      = 27,
  
	                  ALLEGRO_PIXEL_FORMAT_COMPRESSED_RGBA_DXT1  = 28,
  
	                  ALLEGRO_PIXEL_FORMAT_COMPRESSED_RGBA_DXT3  = 29,
  
	                   ALLEGRO_PIXEL_FORMAT_COMPRESSED_RGBA_DXT5  = 30,
  
	                   ALLEGRO_NUM_PIXEL_FORMATS
end type

export constant	xal_map_rgb = define_c_func(all,"+al_map_rgb",{C_UCHAR,C_UCHAR,C_UCHAR},ALLEGRO_COLOR),
	xal_map_rgba = define_c_func(all,"+al_map_rgba",{C_UCHAR,C_UCHAR,C_UCHAR,C_UCHAR},ALLEGRO_COLOR),
	xal_map_rgb_f = define_c_func(all,"+al_map_rgb_f",{C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR),
	xal_map_rgba_f = define_c_func(all,"+al_map_rgba_f",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR),
	xal_premul_rgba = define_c_func(all,"+al_premul_rgba",{C_UCHAR,C_UCHAR,C_UCHAR,C_UCHAR},ALLEGRO_COLOR),
	xal_premul_rgba_f = define_c_func(all,"+al_premul_rgba_f",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR)
	
public function al_map_rgb(integer r,integer g,integer b)
	return c_func(xal_map_rgb,{r,g,b})
end function

public function al_map_rgba(integer r,integer g,integer b,integer a)
	return c_func(xal_map_rgba,{r,g,b,a})
end function

public function al_map_rgb_f(atom r,atom g,atom b)
	return c_func(xal_map_rgb_f,{r,g,b})
end function

public function al_map_rgba_f(atom r,atom g,atom b,atom a)
	return c_func(xal_map_rgba_f,{r,g,b,a})
end function

public function al_premul_rgba(integer r,integer g,integer b,integer a)
	return c_func(xal_premul_rgba,{r,g,b,a})
end function

public function al_premul_rgba_f(atom r,atom g,atom b,atom a)
	return c_func(xal_premul_rgba_f,{r,g,b,a})
end function
­6.47