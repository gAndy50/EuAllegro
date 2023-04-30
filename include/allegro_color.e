include std/ffi.e
include std/machine.e

include allegro.e

export constant col = open_dll("allegro_color-5.2.dll")

export constant xal_get_allegro_color_version = define_c_func(col,"+al_get_allegro_color_version",{},C_UINT)

public function al_get_allegro_color_version()
	return c_func(xal_get_allegro_color_version,{})
end function

export constant xal_color_hsv_to_rgb = define_c_proc(col,"+al_color_hsv_to_rgb",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_hsv_to_rgb(atom hue,atom sat,atom val,atom r,atom g,atom b)
	c_proc(xal_color_hsv_to_rgb,{hue,sat,val,r,g,b})
end procedure

export constant xal_color_rgb_to_hsl = define_c_proc(col,"+al_color_rgb_to_hsl",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_rgb_to_hsl(atom r,atom g,atom b,atom hue,atom sat,atom light)
	c_proc(xal_color_rgb_to_hsl,{r,g,b,hue,sat,light})
end procedure

export constant xal_color_rgb_to_hsv = define_c_proc(col,"+al_color_rgb_to_hsv",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_rgb_to_hsv(atom r,atom g,atom b,atom hue,atom sat,atom val)
	c_proc(xal_color_rgb_to_hsv,{r,g,b,hue,sat,val})
end procedure

export constant xal_color_hsl_to_rgb = define_c_proc(col,"+al_color_hsl_to_rgb",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_hsl_to_rgb(atom hue,atom sat,atom light,atom r,atom g,atom b)
	c_proc(xal_color_hsl_to_rgb,{hue,sat,light,r,g,b})
end procedure

export constant xal_color_name_to_rgb = define_c_func(col,"+al_color_name_to_rgb",{C_STRING,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function al_color_name_to_rgb(sequence name,atom r,atom g,atom b)
	return c_func(xal_color_name_to_rgb,{name,r,g,b})
end function

export constant xal_color_rgb_to_name = define_c_func(col,"+al_color_rgb_to_name",{C_FLOAT,C_FLOAT,C_FLOAT},C_STRING)

public function al_color_rgb_to_name(atom r,atom g,atom b)
	return c_func(xal_color_rgb_to_name,{r,g,b})
end function

export constant xal_color_cmyk_to_rgb = define_c_proc(col,"+al_color_cmyk_to_rgb",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_cmyk_to_rgb(atom cyan,atom magenta,atom yellow,atom key,atom r,atom g,atom b)
	c_proc(xal_color_cmyk_to_rgb,{cyan,magenta,yellow,key,r,g,b})
end procedure

export constant xal_color_rgb_to_cmyk = define_c_proc(col,"+al_color_rgb_to_cmyk",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_rgb_to_cmyk(atom r,atom g,atom b,atom cyan,atom magenta,atom yellow,atom key)
	c_proc(xal_color_rgb_to_cmyk,{r,g,b,cyan,magenta,yellow,key})
end procedure

export constant xal_color_yuv_to_rgb = define_c_proc(col,"+al_color_yuv_to_rgb",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_yuv_to_rgb(atom y,atom u,atom v,atom r,atom g,atom b)
	c_proc(xal_color_yuv_to_rgb,{y,u,v,r,g,b})
end procedure

export constant xal_color_rgb_to_yuv = define_c_proc(col,"+al_color_rgb_to_yuv",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_rgb_to_yuv(atom r,atom g,atom b,atom y,atom u,atom v)
	c_proc(xal_color_rgb_to_yuv,{r,g,b,y,u,v})
end procedure

export constant xal_color_rgb_to_html = define_c_proc(col,"+al_color_rgb_to_html",{C_FLOAT,C_FLOAT,C_FLOAT,C_STRING})

public procedure al_color_rgb_to_html(atom r,atom g,atom b,sequence str)
	c_proc(xal_color_rgb_to_html,{r,g,b,str})
end procedure

export constant xal_color_html_to_rgb = define_c_func(col,"+al_color_html_to_rgb",{C_STRING,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function al_color_html_to_rgb(sequence str,atom r,atom g,atom b)
	return c_func(xal_color_html_to_rgb,{str,r,g,b})
end function

export constant xal_color_yuv = define_c_func(col,"+al_color_yuv",{C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR),
				xal_color_cmyk = define_c_func(col,"+al_color_cmyk",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR),
				xal_color_hsl = define_c_func(col,"+al_color_hsl",{C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR),
				xal_color_hsv = define_c_func(col,"+al_color_hsv",{C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR),
				xal_color_name = define_c_func(col,"+al_color_name",{C_STRING},ALLEGRO_COLOR)

public function al_color_yuv(atom y,atom u,atom v)
	return c_func(xal_color_yuv,{y,u,v})
end function

public function al_color_cmyk(atom c,atom m,atom y,atom k)
	return c_func(xal_color_cmyk,{c,m,y,k})
end function

public function al_color_hsl(atom h,atom s,atom l)
	return c_func(xal_color_hsl,{h,s,l})
end function

public function al_color_hsv(atom h,atom s,atom v)
	return c_func(xal_color_hsv,{h,s,v})
end function

public function al_color_name(sequence name)
	return c_func(xal_color_name,{name})
end function

export constant xal_color_html = define_c_func(col,"+al_color_html",{C_STRING},ALLEGRO_COLOR)

public function al_color_html(sequence str)
	return c_func(xal_color_html,{str})
end function

export constant xal_color_xyz_to_rgb = define_c_proc(col,"+al_color_xyz_to_rgb",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_xyz_to_rgb(atom x,atom y,atom z,atom r,atom g,atom b)
	c_proc(xal_color_xyz_to_rgb,{x,y,z,r,g,b})
end procedure

export constant xal_color_rgb_to_xyz = define_c_proc(col,"+al_color_rgb_to_xyz",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_rgb_to_xyz(atom r,atom g,atom b,atom x,atom y,atom z)
	c_proc(xal_color_rgb_to_xyz,{r,g,b,x,y,z})
end procedure

export constant xal_color_xyz = define_c_func(col,"+al_color_xyz",{C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR)

public function al_color_xyz(atom x,atom y,atom z)
	return c_func(xal_color_xyz,{x,y,z})
end function

export constant xal_color_lab_to_rgb = define_c_proc(col,"+al_color_lab_to_rgb",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_lab_to_rgb(atom l,atom a,atom b,atom r,atom g,atom bc)
	c_proc(xal_color_lab_to_rgb,{l,a,b,r,g,bc})
end procedure

export constant xal_color_rgb_to_lab = define_c_proc(col,"+al_color_rgb_to_lab",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_rgb_to_lab(atom r,atom g,atom b,atom l,atom a,atom bc)
	c_proc(xal_color_rgb_to_lab,{r,g,b,l,a,bc})
end procedure

export constant xal_color_lab = define_c_func(col,"+al_color_lab",{C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR)

public function al_color_lab(atom l,atom a,atom b)
	return c_func(xal_color_lab,{l,a,b})
end function

export constant xal_color_xyy_to_rgb = define_c_proc(col,"+al_color_xyy_to_rgb",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_xyy_to_rgb(atom x,atom y,atom y2,atom r,atom g,atom b)
	c_proc(xal_color_xyy_to_rgb,{x,y,y2,r,g,b})
end procedure

export constant xal_color_rgb_to_xyy = define_c_proc(col,"+al_color_rgb_to_xyy",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_rgb_to_xyy(atom r,atom g,atom b,atom x,atom y,atom y2)
	c_proc(xal_color_rgb_to_xyy,{r,g,b,x,y,y2})
end procedure

export constant xal_color_xyy = define_c_func(col,"+al_color_xyy",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER},ALLEGRO_COLOR)

public function al_color_xyy(atom x,atom y,atom y2)
	return c_func(xal_color_xyy,{x,y,y2})
end function

export constant xal_color_distance_ciede2000 = define_c_func(col,"+al_color_distance_ciede2000",{ALLEGRO_COLOR,ALLEGRO_COLOR},C_DOUBLE)

public function al_color_distance_ciede2000(sequence c1,sequence c2)
	return c_func(xal_color_distance_ciede2000,{c1,c2})
end function

export constant xal_color_lch_to_rgb = define_c_proc(col,"+al_color_lch_to_rgb",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_lch_to_rgb(atom l,atom c,atom h,atom r,atom g,atom b)
	c_proc(xal_color_lch_to_rgb,{l,c,h,r,g,b})
end procedure

export constant xal_color_rgb_to_lch = define_c_proc(col,"+al_color_rgb_to_lch",{C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_POINTER})

public procedure al_color_rgb_to_lch(atom r,atom g,atom b,atom l,atom c,atom h)
	c_proc(xal_color_rgb_to_lch,{r,g,b,l,c,h})
end procedure

export constant xal_color_lch = define_c_func(col,"+al_color_lch",{C_FLOAT,C_FLOAT,C_FLOAT},ALLEGRO_COLOR)

public function al_color_lch(atom l,atom c,atom h)
	return c_func(xal_color_lch,{l,c,h})
end function

export constant xal_is_color_valid = define_c_func(col,"+al_is_color_valid",{ALLEGRO_COLOR},C_BOOL)

public function al_is_color_valid(sequence col)
	return c_func(xal_is_color_valid,{col})
end function
­145.42