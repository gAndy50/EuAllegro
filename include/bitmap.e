include std/ffi.e

include base.e
include color.e

public constant ALLEGRO_BITMAP = define_c_type(C_POINTER)

public enum ALLEGRO_MEMORY_BITMAP = 0x0001,
			ALLEGRO_KEEP_BITMAP_FORMAT = 0x0002,
			ALLEGRO_FORCE_LOCKING = 0x0004,
			ALLEGRO_NO_PRESERVE_TEXTURE = 0x0008,
			ALLEGRO_ALPHA_TEST = 0x0010,
			ALLEGRO_INTERNAL_OPENGL = 0x0020,
			ALLEGRO_MIN_LINEAR = 0x0040,
			ALLEGRO_MAG_LINEAR = 0x0080,
			ALLEGRO_MIPMAP = 0x01000,
			ALLEGRO_NO_PREMULTIPLIED_ALPHA = 0x0200,
			ALLEGRO_VIDEO_BITMAP = 0x0400,
			ALLEGRO_CONVERT_BITMAP = 0x1000
			
export constant xal_set_new_bitmap_format = define_c_proc(all,"+al_set_new_bitmap_format",{C_INT}),
				xal_set_new_bitmap_flags = define_c_proc(all,"+al_set_new_bitmap_flags",{C_INT}),
				xal_get_new_bitmap_format = define_c_func(all,"+al_get_new_bitmap_format",{},C_INT),
				xal_get_new_bitmap_flags = define_c_func(all,"+al_get_new_bitmap_flags",{},C_INT),
				xal_add_new_bitmap_flag = define_c_proc(all,"+al_add_new_bitmap_flag",{C_INT})

public procedure al_set_new_bitmap_format(atom format)
	c_proc(xal_set_new_bitmap_format,{format})
end procedure

public procedure al_set_new_bitmap_flags(atom flags)
	c_proc(xal_set_new_bitmap_flags,{flags})
end procedure

public function al_get_new_bitmap_format()
	return c_func(xal_get_new_bitmap_format,{})
end function

public function al_get_new_bitmap_flags()
	return c_func(xal_get_new_bitmap_flags,{})
end function

public procedure al_add_new_bitmap_flag(atom flag)
	c_proc(xal_add_new_bitmap_flag,{flag})
end procedure


export constant xal_get_new_bitmap_depth = define_c_func(all,"+al_get_new_bitmap_depth",{},C_INT),
				xal_set_new_bitmap_depth = define_c_proc(all,"+al_set_new_bitmap_depth",{C_INT}),
				xal_get_new_bitmap_samples = define_c_func(all,"+al_get_new_bitmap_samples",{},C_INT),
				xal_set_new_bitmap_samples = define_c_proc(all,"+al_set_new_bitmap_samples",{C_INT})

public function al_get_new_bitmap_depth()
	return c_func(xal_get_new_bitmap_depth,{})
end function

public procedure al_set_new_bitmap_depth(atom depth)
	c_proc(xal_set_new_bitmap_depth,{depth})
end procedure

public function al_get_new_bitmap_samples()
	return c_func(xal_get_new_bitmap_samples,{})
end function

public procedure al_set_new_bitmap_samples(atom samples)
	c_proc(xal_set_new_bitmap_samples,{samples})
end procedure


export constant xal_get_bitmap_width = define_c_func(all,"+al_get_bitmap_width",{ALLEGRO_BITMAP},C_INT),
				xal_get_bitmap_height = define_c_func(all,"+al_get_bitmap_height",{ALLEGRO_BITMAP},C_INT),
				xal_get_bitmap_format = define_c_func(all,"+al_get_bitmap_format",{ALLEGRO_BITMAP},C_INT),
				xal_get_bitmap_flags = define_c_func(all,"+al_get_bitmap_flags",{ALLEGRO_BITMAP},C_INT)

public function al_get_bitmap_width(atom bitmap)
	return c_func(xal_get_bitmap_width,{bitmap})
end function

public function al_get_bitmap_height(atom bitmap)
	return c_func(xal_get_bitmap_height,{bitmap})
end function

public function al_get_bitmap_format(atom bitmap)
	return c_func(xal_get_bitmap_format,{bitmap})
end function

public function al_get_bitmap_flags(atom bitmap)
	return c_func(xal_get_bitmap_flags,{bitmap})
end function


export constant xal_get_bitmap_depth = define_c_func(all,"+al_get_bitmap_depth",{ALLEGRO_BITMAP},C_INT),
				xal_get_bitmap_samples = define_c_func(all,"+al_get_bitmap_samples",{ALLEGRO_BITMAP},C_INT)
				
public function al_get_bitmap_depth(atom bitmap)
	return c_func(xal_get_bitmap_depth,{bitmap})
end function

public function al_get_bitmap_samples(atom bitmap)
	return c_func(xal_get_bitmap_samples,{bitmap})
end function


export constant xal_create_bitmap = define_c_func(all,"+al_create_bitmap",{C_INT,C_INT},ALLEGRO_BITMAP),
				xal_destroy_bitmap = define_c_proc(all,"+al_destroy_bitmap",{ALLEGRO_BITMAP})
				
public function al_create_bitmap(atom w,atom h)
	return c_func(xal_create_bitmap,{w,h})
end function

public procedure al_destroy_bitmap(atom bitmap)
	c_proc(xal_destroy_bitmap,{bitmap})
end procedure


export constant xal_put_pixel = define_c_proc(all,"+al_put_pixel",{C_INT,C_INT,ALLEGRO_COLOR}),
				xal_put_blended_pixel = define_c_proc(all,"+al_put_blended_pixel",{C_INT,C_INT,ALLEGRO_COLOR}),
				xal_get_pixel = define_c_func(all,"+al_get_pixel",{ALLEGRO_BITMAP,C_INT,C_INT},ALLEGRO_COLOR)
				
public procedure al_put_pixel(atom x,atom y, sequence color)
	c_proc(xal_put_pixel,{x,y,color})
end procedure

public procedure al_put_blended_pixel(atom x,atom y,sequence color)
	c_proc(xal_put_blended_pixel,{x,y,color})
end procedure

public function al_get_pixel(atom bitmap,atom x,atom y)
	return c_func(xal_get_pixel,{bitmap,x,y})
end function


export constant xal_convert_mask_to_alpha = define_c_proc(all,"+al_convert_mask_to_alpha",{ALLEGRO_BITMAP,ALLEGRO_COLOR})

public procedure al_convert_mask_to_alpha(atom bitmap,sequence mask_color)
	c_proc(xal_convert_mask_to_alpha,{bitmap,mask_color})
end procedure


export constant xal_get_bitmap_blend_color = define_c_func(all,"+al_get_bitmap_blend_color",{},ALLEGRO_COLOR),
				xal_get_bitmap_blender = define_c_proc(all,"+al_get_bitmap_blender",{C_POINTER,C_POINTER,C_POINTER}),
				xal_get_separate_bitmap_blender = define_c_proc(all,"+al_get_separate_bitmap_blender",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER}),
				xal_set_bitmap_blend_color = define_c_proc(all,"+al_set_bitmap_blend_color",{ALLEGRO_COLOR}),
				xal_set_bitmap_blender = define_c_proc(all,"+al_set_bitmap_blender",{C_INT,C_INT,C_INT}),
				xal_set_separate_bitmap_blender = define_c_proc(all,"+al_set_separate_bitmap_blender",{C_INT,C_INT,C_INT,C_INT,C_INT,C_INT}),
				xal_reset_bitmap_blender = define_c_proc(all,"+al_reset_bitmap_blender",{})
				
public function al_get_bitmap_blend_color()
	return c_func(xal_get_bitmap_blend_color,{})
end function

public procedure al_get_bitmap_blender(atom op,atom src,atom dst)
	c_proc(xal_get_bitmap_blender,{op,src,dst})
end procedure

public procedure al_get_separate_bitmap_blender(atom op,atom src,atom dst,atom alpha_op,atom alpha_src,atom alpha_dst)
	c_proc(xal_get_separate_bitmap_blender,{op,src,dst,alpha_op,alpha_src,alpha_dst})
end procedure

public procedure al_set_bitmap_blend_color(sequence color)
	c_proc(xal_set_bitmap_blend_color,{color})
end procedure

public procedure al_set_bitmap_blender(atom op,atom src,atom dst)
	c_proc(xal_set_bitmap_blender,{op,src,dst})
end procedure

public procedure al_set_separate_bitmap_blender(atom op,atom src,atom dst,atom alpha_op,atom alpha_src,atom alpha_dst)
	c_proc(xal_set_separate_bitmap_blender,{op,src,dst,alpha_op,alpha_src,alpha_dst})
end procedure

public procedure al_reset_bitmap_blender()
	c_proc(xal_reset_bitmap_blender,{})
end procedure

export constant xal_create_sub_bitmap = define_c_func(all,"+al_create_sub_bitmap",{ALLEGRO_BITMAP,C_INT,C_INT,C_INT,C_INT},ALLEGRO_BITMAP),
				xal_is_sub_bitmap = define_c_func(all,"+al_is_sub_bitmap",{ALLEGRO_BITMAP},C_BOOL),
				xal_get_parent_bitmap = define_c_func(all,"+al_get_parent_bitmap",{ALLEGRO_BITMAP},ALLEGRO_BITMAP),
				xal_get_bitmap_x = define_c_func(all,"+al_get_bitmap_x",{ALLEGRO_BITMAP},C_INT),
				xal_get_bitmap_y = define_c_func(all,"+al_get_bitmap_y",{ALLEGRO_BITMAP},C_INT),
				xal_reparent_bitmap = define_c_proc(all,"+al_reparent_bitmap",{ALLEGRO_BITMAP,ALLEGRO_BITMAP,C_INT,C_INT,C_INT,C_INT})
				
public function al_create_sub_bitmap(atom x,atom y,atom w,atom h)
	return c_func(xal_create_sub_bitmap,{x,y,w,h})
end function

public function al_is_sub_bitmap(atom bitmap)
	return c_func(xal_is_sub_bitmap,{bitmap})
end function

public function al_get_parent_bitmap(atom bitmap)
	return c_func(xal_get_parent_bitmap,{bitmap})
end function

public function al_get_bitmap_x(atom bitmap)
	return c_func(xal_get_bitmap_x,{bitmap})
end function

public function al_get_bitmap_y(atom bitmap)
	return c_func(xal_get_bitmap_y,{bitmap})
end function

public procedure al_reparent_bitmap(atom bitmap,atom parent,atom x,atom y,atom w,atom h)
	c_proc(xal_reparent_bitmap,{bitmap,parent,x,y,w,h})
end procedure


export constant xal_clone_bitmap = define_c_func(all,"+al_clone_bitmap",{ALLEGRO_BITMAP},ALLEGRO_BITMAP),
				xal_convert_bitmap = define_c_proc(all,"+al_convert_bitmap",{ALLEGRO_BITMAP}),
				xal_convert_memory_bitmaps = define_c_proc(all,"+al_convert_memory_bitmaps",{}),
				xal_backup_dirty_bitmap = define_c_proc(all,"+al_backup_dirty_bitmap",{ALLEGRO_BITMAP})
				
public function al_clone_bitmap(atom bitmap)
	return c_func(xal_clone_bitmap,{bitmap})
end function

public procedure al_convert_bitmap(atom bitmap)
	c_proc(xal_convert_bitmap,{bitmap})
end procedure

public procedure al_convert_memory_bitmaps()
	c_proc(xal_convert_memory_bitmaps,{})
end procedure

public procedure al_backup_dirty_bitmap(atom bitmap)
	c_proc(xal_backup_dirty_bitmap,{bitmap})
end procedure

export constant xal_set_clipping_rectangle = define_c_proc(all,"+al_set_clipping_rectangle",{C_INT,C_INT,C_INT,C_INT}),
				xal_reset_clipping_rectangle = define_c_proc(all,"+al_reset_clipping_rectangle",{}),
				xal_get_clipping_rectangle = define_c_proc(all,"+al_get_clipping_rectangle",{C_POINTER,C_POINTER,C_POINTER,C_POINTER})
				
public procedure al_set_clipping_rectangle(atom x,atom y,atom w,atom h)
	c_proc(xal_set_clipping_rectangle,{x,y,w,h})
end procedure

public procedure al_reset_clipping_rectangle()
	c_proc(xal_reset_clipping_rectangle,{})
end procedure

public procedure al_get_clipping_rectangle(atom x,atom y,atom w,atom h)
	c_proc(xal_get_clipping_rectangle,{x,y,w,h})
end procedure
­242.3