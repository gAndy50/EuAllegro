include std/ffi.e
include std/math.e

include base.e
include color.e
include events.e

public constant ALLEGRO_WINDOWED = shift_bits(1,0)
public constant ALLEGRO_FULLSCREEN = shift_bits(1,-1)
public constant ALLEGRO_OPENGL = shift_bits(1,-2)
public constant ALLEGRO_DIRECT3D_INTERNAL = shift_bits(1,-3)
public constant ALLEGRO_RESIZABLE = shift_bits(1,-4)
public constant ALLEGRO_FRAMELESS = shift_bits(1,-5)
public constant ALLEGRO_NOFRAME = ALLEGRO_FRAMELESS
public constant ALLEGRO_GENERATE_EXPOSE_EVENTS = shift_bits(1,-6)
public constant ALLEGRO_OPENGL_3_0 = shift_bits(1,-7)
public constant ALLEGRO_OPENGL_FORWARD_COMPATIBLE = shift_bits(1,-8)
public constant ALLEGRO_FULLSCREEN_WINDOW = shift_bits(1,-9)
public constant ALLEGRO_MINIMIZED = shift_bits(1,-10)
public constant ALLEGRO_PROGRAMMABLE_PIPELINE = shift_bits(1,-11)
public constant ALLEGRO_GTK_TOPLEVEL_INTERNAL = shift_bits(1,-12)
public constant ALLEGRO_MAXIMIZED = shift_bits(1,-13)
public constant ALLEGRO_OPENGL_ES_PROFILE = shift_bits(1,-14)

public enum ALLEGRO_RED_SIZE = 0,
  
 ALLEGRO_GREEN_SIZE = 1,
  
  ALLEGRO_BLUE_SIZE = 2,
  
   ALLEGRO_ALPHA_SIZE = 3,
  
    ALLEGRO_RED_SHIFT = 4,
  
     ALLEGRO_GREEN_SHIFT = 5,
  
      ALLEGRO_BLUE_SHIFT = 6,
  
       ALLEGRO_ALPHA_SHIFT = 7,
  
        ALLEGRO_ACC_RED_SIZE = 8,
  
         ALLEGRO_ACC_GREEN_SIZE = 9,
  
          ALLEGRO_ACC_BLUE_SIZE = 10,
  
           ALLEGRO_ACC_ALPHA_SIZE = 11,
  
            ALLEGRO_STEREO = 12,
  
             ALLEGRO_AUX_BUFFERS = 13,
  
              ALLEGRO_COLOR_SIZE = 14,
  
               ALLEGRO_DEPTH_SIZE = 15,
  
        ALLEGRO_STENCIL_SIZE = 16,
  
        ALLEGRO_SAMPLE_BUFFERS = 17,
  
          ALLEGRO_SAMPLES = 18,
  
          ALLEGRO_RENDER_METHOD = 19,
  
        ALLEGRO_FLOAT_COLOR = 20,
  
             ALLEGRO_FLOAT_DEPTH = 21,
  
          ALLEGRO_SINGLE_BUFFER = 22,
  
             ALLEGRO_SWAP_METHOD = 23,
  
            ALLEGRO_COMPATIBLE_DISPLAY = 24,
  
              ALLEGRO_UPDATE_DISPLAY_REGION = 25,
  
               ALLEGRO_VSYNC = 26,
  
               ALLEGRO_MAX_BITMAP_SIZE = 27,
  
                ALLEGRO_SUPPORT_NPOT_BITMAP = 28,
  
                 ALLEGRO_CAN_DRAW_INTO_BITMAP = 29,
  
                   ALLEGRO_SUPPORT_SEPARATE_ALPHA = 30,
  
                   ALLEGRO_AUTO_CONVERT_BITMAPS = 31,
  
                 ALLEGRO_SUPPORTED_ORIENTATIONS = 32,
  
                     ALLEGRO_OPENGL_MAJOR_VERSION = 33,
  
                      ALLEGRO_OPENGL_MINOR_VERSION = 34,
  
                   ALLEGRO_DISPLAY_OPTIONS_COUNT
                   
public enum ALLEGRO_DONTCARE = 0,
			ALLEGRO_REQUIRE,
			ALLEGRO_SUGGEST
			

public enum ALLEGRO_DISPLAY_ORIENTATION_UNKNOWN = 0,
  
 ALLEGRO_DISPLAY_ORIENTATION_0_DEGREES = 1,
  
  ALLEGRO_DISPLAY_ORIENTATION_90_DEGREES = 2,
  
   ALLEGRO_DISPLAY_ORIENTATION_180_DEGREES = 4,
  
    ALLEGRO_DISPLAY_ORIENTATION_270_DEGREES = 8,
  
     ALLEGRO_DISPLAY_ORIENTATION_PORTRAIT = 5,
  
      ALLEGRO_DISPLAY_ORIENTATION_LANDSCAPE = 10,
  
       ALLEGRO_DISPLAY_ORIENTATION_ALL = 15,
  
        ALLEGRO_DISPLAY_ORIENTATION_FACE_UP = 16,
  
         ALLEGRO_DISPLAY_ORIENTATION_FACE_DOWN = 32
         
public enum ALLEGRO_PRIM_MAX_USER_ATTR = 10

public constant ALLEGRO_NE_WINDOW_TITLE_MAX_SIZE = 255


export constant xal_set_new_display_refresh_rate = define_c_proc(all,"+al_set_new_display_refresh_rate",{C_INT}),
				xal_set_new_display_flags = define_c_proc(all,"+al_set_new_display_flags",{C_INT}),
				xal_get_new_display_refresh_rate = define_c_func(all,"+al_get_new_display_refresh_rate",{},C_INT),
				xal_get_new_display_flags = define_c_func(all,"+al_get_new_display_flags",{},C_INT)
				
public procedure al_set_new_display_refresh_rate(atom refresh_rate)
	c_proc(xal_set_new_display_refresh_rate,{refresh_rate})
end procedure

public procedure al_set_new_display_flags(atom flags)
	c_proc(xal_set_new_display_flags,{flags})
end procedure

public function al_get_new_display_refresh_rate()
	return c_func(xal_get_new_display_refresh_rate,{})
end function

public function al_get_new_display_flags()
	return c_func(xal_get_new_display_flags,{})
end function


export constant xal_set_new_window_title = define_c_proc(all,"+al_set_new_window_title",{C_STRING}),
				xal_get_new_window_title = define_c_func(all,"+al_get_new_window_title",{},C_STRING)
				
public procedure al_set_new_window_title(sequence title)
	c_proc(xal_set_new_window_title,{title})
end procedure

public function al_get_new_window_title()
	return c_func(xal_get_new_window_title,{})
end function


export constant xal_get_display_width = define_c_func(all,"+al_get_display_width",{C_POINTER},C_INT),
				xal_get_display_height = define_c_func(all,"+al_get_display_height",{C_POINTER},C_INT),
				xal_get_display_format = define_c_func(all,"+al_get_display_format",{C_POINTER},C_INT),
				xal_get_display_refresh_rate = define_c_func(all,"+al_get_display_refresh_rate",{C_POINTER},C_INT),
				xal_get_display_flags = define_c_func(all,"+al_get_display_flags",{C_POINTER},C_INT),
				xal_get_display_orientation = define_c_func(all,"+al_get_display_orientation",{C_POINTER},C_INT),
				xal_set_display_flag = define_c_func(all,"+al_set_display_flag",{C_POINTER,C_INT,C_BOOL},C_BOOL)
				
public function al_get_display_width(atom dis)
	return c_func(xal_get_display_width,{dis})
end function

public function al_get_display_height(atom dis)
	return c_func(xal_get_display_height,{dis})
end function

public function al_get_display_format(atom dis)
	return c_func(xal_get_display_format,{dis})
end function

public function al_get_display_refresh_rate(atom dis)
	return c_func(xal_get_display_refresh_rate,{dis})
end function

public function al_get_display_flags(atom dis)
	return c_func(xal_get_display_flags,{dis})
end function

public function al_get_display_orientation(atom dis)
	return c_func(xal_get_display_orientation,{dis})
end function

public function al_set_display_flag(atom dis,atom flag,atom onoff)
	return c_func(xal_set_display_flag,{dis,flag,onoff})
end function


export constant xal_create_display = define_c_func(all,"+al_create_display",{C_INT,C_INT},C_POINTER),
				xal_destroy_display = define_c_proc(all,"+al_destroy_display",{C_POINTER}),
				xal_get_current_display = define_c_func(all,"+al_get_current_display",{},C_POINTER),
				xal_set_target_bitmap = define_c_proc(all,"+al_set_target_bitmap",{C_POINTER}),
				xal_set_target_backbuffer = define_c_proc(all,"+al_set_target_backbuffer",{C_POINTER}),
				xal_get_backbuffer = define_c_func(all,"+al_get_backbuffer",{C_POINTER},C_POINTER),
				xal_get_target_bitmap = define_c_func(all,"+al_get_target_bitmap",{},C_POINTER)
				
public function al_create_display(atom w,atom h)
	return c_func(xal_create_display,{w,h})
end function

public procedure al_destroy_display(atom dis)
	c_proc(xal_destroy_display,{dis})
end procedure

public function al_get_current_display()
	return c_func(xal_get_current_display,{})
end function

public procedure al_set_target_bitmap(sequence bitmap)
	c_proc(xal_set_target_bitmap,{bitmap})
end procedure

public procedure al_set_target_backbuffer(atom dis)
	c_proc(xal_set_target_backbuffer,{dis})
end procedure

public function al_get_backbuffer(atom dis)
	return c_func(xal_get_backbuffer,{dis})
end function

public function al_get_target_bitmap()
	return c_func(xal_get_target_bitmap,{})
end function


export constant xal_acknowledge_resize = define_c_func(all,"+al_acknowledge_resize",{C_POINTER},C_BOOL),
				xal_resize_display = define_c_func(all,"+al_resize_display",{C_POINTER,C_INT,C_INT},C_BOOL),
				xal_flip_display = define_c_proc(all,"+al_flip_display",{}),
				xal_update_display_region = define_c_proc(all,"+al_update_display_region",{C_INT,C_INT,C_INT,C_INT}),
				xal_is_compatible_bitmap = define_c_func(all,"+al_is_compatbile_bitmap",{C_POINTER},C_BOOL)
				
public function al_acknowledge_resize(atom dis)
	return c_func(xal_acknowledge_resize,{dis})
end function

public function al_resize_display(atom dis,atom w,atom h)
	return c_func(xal_resize_display,{dis,w,h})
end function

public procedure al_flip_display()
	c_proc(xal_flip_display,{})
end procedure

public procedure al_update_display_region(atom x,atom y,atom w,atom h)
	c_proc(xal_update_display_region,{x,y,w,h})
end procedure

public function al_is_compatible_bitmap(sequence bitmap)
	return c_func(xal_is_compatible_bitmap,{bitmap})
end function


export constant xal_wait_for_vsync = define_c_func(all,"+al_wait_for_vsync",{},C_BOOL)

public function al_wait_for_vsync()
	return c_func(xal_wait_for_vsync,{})
end function


export constant xal_get_display_event_source = define_c_func(all,"+al_get_display_event_source",{C_POINTER},C_POINTER)

public function al_get_display_event_source(atom dis)
	return c_func(xal_get_display_event_source,{dis})
end function


export constant xal_set_display_icon = define_c_proc(all,"+al_set_display_icon",{C_POINTER,C_POINTER}),
				xal_set_display_icons = define_c_proc(all,"+al_set_display_icons",{C_POINTER,C_INT,C_POINTER})
				
public procedure al_set_display_icon(atom dis,sequence icon)
	c_proc(xal_set_display_icon,{dis,icon})
end procedure

public procedure al_set_display_icons(atom dis,atom num,sequence icons)
	c_proc(xal_set_display_icons,{dis,num,icons})
end procedure


export constant xal_get_new_display_adapter = define_c_func(all,"+al_get_new_display_adapter",{},C_INT),
				xal_set_new_display_adapter = define_c_proc(all,"+al_set_new_display_adapter",{C_INT}),
				xal_set_new_window_position = define_c_proc(all,"+al_set_new_window_position",{C_INT,C_INT}),
				xal_get_new_window_position = define_c_proc(all,"+al_get_new_window_position",{C_POINTER,C_POINTER}),
				xal_set_window_position = define_c_proc(all,"+al_set_window_position",{C_POINTER,C_INT,C_INT}),
				xal_get_window_position = define_c_proc(all,"+al_get_window_position",{C_POINTER,C_POINTER,C_POINTER}),
				xal_set_window_constraints = define_c_func(all,"+al_set_window_constraints",{C_POINTER,C_INT,C_INT,C_INT,C_INT},C_BOOL),
				xal_get_window_constraints = define_c_func(all,"+al_get_window_constraints",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL),
				xal_apply_window_constraints = define_c_proc(all,"+al_apply_window_constraints",{C_POINTER,C_BOOL})
				
public function al_get_new_display_adapter()
	return c_func(xal_get_new_display_adapter,{})
end function

public procedure al_set_new_display_adapter(atom ad)
	c_proc(xal_set_new_display_adapter,{ad})
end procedure

public procedure al_set_new_window_position(atom x,atom y)
	c_proc(xal_set_new_window_position,{x,y})
end procedure

public procedure al_get_new_window_position(atom x,atom y)
	c_proc(xal_get_new_window_position,{x,y})
end procedure

public procedure al_set_window_position(atom dis,atom x,atom y)
	c_proc(xal_set_window_position,{dis,x,y})
end procedure

public procedure al_get_window_position(atom dis,atom x,atom y)
	c_proc(xal_get_window_position,{dis,x,y})
end procedure

public function al_set_window_constraints(atom dis,atom min_w,atom min_h,atom max_w,atom max_h)
	return c_func(xal_set_window_constraints,{dis,min_w,min_h,max_w,max_h})
end function

public function al_get_window_constraints(atom dis,atom min_w,atom min_h,atom max_w,atom max_h)
	return c_func(xal_get_window_constraints,{dis,min_w,min_h,max_w,max_h})
end function

public procedure al_apply_window_constraints(atom dis,atom onoff)
	c_proc(xal_apply_window_constraints,{dis,onoff})
end procedure


export constant xal_set_window_title = define_c_proc(all,"+al_set_window_title",{C_POINTER,C_STRING})

public procedure al_set_window_title(atom dis,sequence title)
	c_proc(xal_set_window_title,{dis,title})
end procedure


export constant xal_set_new_display_option = define_c_proc(all,"+al_set_new_display_option",{C_INT,C_INT,C_INT}),
				xal_get_new_display_option = define_c_func(all,"+al_get_new_display_option",{C_INT,C_POINTER},C_INT),
				xal_reset_new_display_options = define_c_proc(all,"+al_reset_new_display_options",{}),
				xal_set_display_option = define_c_proc(all,"+al_set_display_option",{C_POINTER,C_INT,C_INT}),
				xal_get_display_option = define_c_func(all,"+al_get_display_option",{C_POINTER,C_INT},C_INT)
				
public procedure al_set_new_display_option(atom option,atom val,atom imp)
	c_proc(xal_set_new_display_option,{option,val,imp})
end procedure

public function al_get_new_display_option(atom opt,atom imp)
	return c_func(xal_get_new_display_option,{opt,imp})
end function

public procedure al_reset_new_display_options()
	c_proc(xal_reset_new_display_options,{})	
end procedure

public procedure al_set_display_option(atom dis,atom opt,atom val)
	c_proc(xal_set_display_option,{dis,opt,val})
end procedure

public function al_get_display_option(atom dis,atom opt)
	return c_func(xal_get_display_option,{dis,opt})
end function


export constant xal_hold_bitmap_drawing = define_c_proc(all,"+al_hold_bitmap_drawing",{C_BOOL}),
				xal_is_bitmap_drawing_held = define_c_func(all,"+al_is_bitmap_drawing_held",{},C_BOOL)
				
public procedure al_hold_bitmap_drawing(atom hold)
	c_proc(xal_hold_bitmap_drawing,{hold})
end procedure

public function al_is_bitmap_drawing_held()
	return c_func(xal_is_bitmap_drawing_held,{})
end function


export constant xal_acknowledge_drawing_halt = define_c_proc(all,"+al_acknowledge_drawing_halt",{C_POINTER}),
				xal_acknowledge_drawing_resume = define_c_proc(all,"+al_acknowledge_drawing_resume",{C_POINTER}),
				xal_backup_dirty_bitmaps = define_c_proc(all,"+al_backup_dirty_bitmaps",{C_POINTER})
				
public procedure al_acknowledge_drawing_halt(atom dis)
	c_proc(xal_acknowledge_drawing_halt,{dis})
end procedure

public procedure al_acknowledge_drawing_resume(atom dis)
	c_proc(xal_acknowledge_drawing_resume,{dis})
end procedure

public procedure al_backup_dirty_bitmaps(atom dis)
	c_proc(xal_backup_dirty_bitmaps,{dis})
end procedure

--testing shift_bits values
--printf(1,"%d",{ALLEGRO_MAXIMIZED})
­396.0