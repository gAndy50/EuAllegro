include std/ffi.e

include base.e

public enum type ALLEGRO_SYSTEM_MOUSE_CUROSR
	ALLEGRO_SYSTEM_MOUSE_CURSOR_NONE        =  0,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_DEFAULT     =  1,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_ARROW       =  2,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_BUSY        =  3,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_QUESTION    =  4,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_EDIT        =  5,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_MOVE        =  6,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_N    =  7,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_W    =  8,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_S    =  9,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_E    = 10,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_NW   = 11,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_SW   = 12,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_SE   = 13,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_NE   = 14,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_PROGRESS    = 15,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_PRECISION   = 16,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_LINK        = 17,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_ALT_SELECT  = 18,
   ALLEGRO_SYSTEM_MOUSE_CURSOR_UNAVAILABLE = 19,
   ALLEGRO_NUM_SYSTEM_MOUSE_CURSORS
end type


export constant xal_create_mouse_cursor = define_c_func(all,"+al_create_mouse_cursor",{C_POINTER,C_INT,C_INT},C_POINTER),
				xal_destroy_mouse_cursor = define_c_proc(all,"+al_destroy_mouse_cursor",{C_POINTER}),
				xal_set_mouse_cursor = define_c_func(all,"+al_set_mouse_cursor",{C_POINTER,C_POINTER},C_BOOL),
				xal_set_system_mouse_cursor = define_c_func(all,"+al_set_system_mouse_cursor",{C_POINTER,C_INT},C_BOOL),
				xal_show_mouse_cursor = define_c_func(all,"+al_show_mouse_cursor",{C_POINTER},C_BOOL),
				xal_hide_mouse_cursor = define_c_func(all,"+al_hide_mouse_cursor",{C_POINTER},C_BOOL)
				
public function al_create_mouse_cursor(object sprite,atom x,atom y)
	return c_func(xal_create_mouse_cursor,{sprite,x,y})
end function

public procedure al_destroy_mouse_cursor(atom c)
	c_proc(xal_destroy_mouse_cursor,{c})
end procedure

public function al_set_mouse_cursor(object display,object cur)
	return c_func(xal_set_mouse_cursor,{display,cur})
end function

public function al_set_system_mouse_cursor(object dis,atom id)
	return c_func(xal_set_system_mouse_cursor,{dis,id})
end function

public function al_show_mouse_cursor(object dis)
	return c_func(xal_show_mouse_cursor,{dis})
end function

public function al_hide_mouse_cursor(object dis)
	return c_func(xal_hide_mouse_cursor,{dis})
end function
­58.43