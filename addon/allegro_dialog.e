--Allegro Dialog
--Written by Icy_Viking
include std/ffi.e
include std/machine.e
include std/math.e
include std/os.e

include allegro.e

atom dia = 0

ifdef WINDOWS then
	dia = open_dll("allegro_dialog-5.2.dll")
	elsifdef LINUX or FREEBSD then
	dia = open_dll("liballegro_dialog-5.2.so")
end ifdef

public constant ALLEGRO_MENU_INFO = define_c_struct({
	C_STRING, --cpation
	C_UINT, --id
	C_INT, --flags
	ALLEGRO_BITMAP --icon
})

sequence myMenu = {0,0,0,0}

public sequence ALLEGRO_MENU_SEPARATOR = {NULL,-1,0,NULL}
public sequence ALLEGRO_START_OF_MENU = {myMenu[1] = "->",myMenu[2],0,NULL}
public sequence ALLEGRO_END_OF_MENU = {NULL,0,0,NULL}

export constant xal_init_native_dialog_addon = define_c_func(dia,"+al_init_native_dialog_addon",{},C_BOOL),
				xal_is_native_dialog_addon_initialized = define_c_func(dia,"+al_is_native_dialog_addon_initialized",{},C_BOOL),
				xal_shutdown_native_dialog_addon = define_c_proc(dia,"+al_shutdown_native_dialog_addon",{})
				
public function al_init_native_dialog_addon()
	return c_func(xal_init_native_dialog_addon,{})
end function

public function al_is_native_dialog_addon_initialized()
	return c_func(xal_is_native_dialog_addon_initialized,{})
end function

public procedure al_shutdown_native_dialog_addon()
	c_proc(xal_shutdown_native_dialog_addon,{})
end procedure

export constant xal_create_native_file_dialog = define_c_func(dia,"+al_create_native_file_dialog",{C_STRING,C_STRING,C_STRING,C_INT},C_POINTER),
				xal_show_native_file_dialog = define_c_func(dia,"+al_show_native_file_dialog",{C_POINTER,C_POINTER},C_BOOL),
				xal_get_native_file_dialog_count = define_c_func(dia,"+al_get_native_file_dialog_count",{C_POINTER},C_INT),
				xal_get_native_file_dialog_path = define_c_func(dia,"+al_get_native_file_dialog_path",{C_POINTER,C_SIZE_T},C_STRING),
				xal_destroy_native_file_dialog = define_c_proc(dia,"+al_destroy_native_file_dialog",{C_POINTER})
				
public function al_create_native_file_dialog(sequence inital_path,sequence title,sequence patterns,atom mode)
	return c_func(xal_create_native_file_dialog,{inital_path,title,patterns,mode})
end function

public function al_show_native_file_dialog(sequence display,sequence dialog)
	return c_func(xal_show_native_file_dialog,{display,dialog})
end function

public function al_get_native_file_dialog_count(sequence dialog)
	return c_func(xal_get_native_file_dialog_count,{dialog})
end function

public function al_get_native_file_dialog_path(sequence dialog,atom index)
	return c_func(xal_get_native_file_dialog_path,{dialog,index})
end function

public procedure al_destroy_native_file_dialog(sequence dialog)
	c_proc(xal_destroy_native_file_dialog,{dialog})
end procedure

export constant xal_show_native_message_box = define_c_func(dia,"+al_show_native_message_box",{C_POINTER,C_STRING,C_STRING,C_STRING,C_STRING,C_INT},C_INT)

public function al_show_native_message_box(sequence display,sequence title,sequence heading,sequence text,sequence buttons,atom flags)
	return c_func(xal_show_native_message_box,{display,title,heading,text,buttons,flags})
end function

export constant xal_open_native_text_log = define_c_func(dia,"+al_open_native_text_log",{C_STRING,C_INT},C_POINTER),
				xal_close_native_text_log = define_c_proc(dia,"+al_close_native_text_log",{C_POINTER}),
				xal_append_native_text_log = define_c_proc(dia,"+al_append_native_text_log",{C_POINTER,C_STRING}),
				xal_get_native_text_log_event_source = define_c_func(dia,"+al_get_native_text_log_event_source",{C_POINTER},C_POINTER)
				
public function al_open_native_text_log(sequence title,atom flags)
	return c_func(xal_open_native_text_log,{title,flags})
end function

public procedure al_close_native_text_log(atom tl)
	c_proc(xal_close_native_text_log,{tl})
end procedure

public procedure al_append_native_text_log(atom tl,sequence format)
	c_proc(xal_append_native_text_log,{tl,format})
end procedure

public function al_get_native_text_log_event_source(atom tl)
	return c_func(xal_get_native_text_log_event_source,{tl})
end function

export constant xal_create_menu = define_c_func(dia,"+al_create_menu",{},C_POINTER),
				xal_create_popup_menu = define_c_func(dia,"+al_create_popup_menu",{},C_POINTER),
				xal_build_menu = define_c_func(dia,"+al_build_menu",{ALLEGRO_MENU_INFO},C_POINTER),
				xal_append_menu_item = define_c_func(dia,"+al_append_menu_item",{C_POINTER,C_STRING,C_UINT,C_INT,ALLEGRO_BITMAP,C_POINTER},C_INT),
				xal_insert_menu_item = define_c_func(dia,"+al_insert_menu_item",{C_POINTER,C_INT,C_STRING,C_UINT,C_INT,ALLEGRO_BITMAP,C_POINTER},C_INT),
				xal_remove_menu_item = define_c_func(dia,"+al_remove_menu_item",{C_POINTER,C_INT},C_BOOL),
				xal_clone_menu = define_c_func(dia,"+al_clone_menu",{C_POINTER},C_POINTER),
				xal_clone_menu_for_popup = define_c_func(dia,"+al_clone_menu_for_popup",{C_POINTER},C_POINTER),
				xal_destroy_menu = define_c_proc(dia,"+al_destroy_menu",{C_POINTER})
				
public function al_create_menu()
	return c_func(xal_create_menu,{})
end function

public function al_create_popup_menu()
	return c_func(xal_create_popup_menu,{})
end function

public function al_build_menu(sequence info)
	return c_func(xal_build_menu,{info})
end function

public function al_append_menu_item(atom parent,sequence title,atom id,atom flags,sequence icon,atom submenu)
	return c_func(xal_append_menu_item,{parent,title,id,flags,icon,submenu})
end function

public function al_insert_menu_item(atom parent,atom pos,sequence title,atom id,atom flags,sequence icon,atom submenu)
	return c_func(xal_insert_menu_item,{parent,pos,title,id,flags,icon,submenu})
end function

public function al_remove_menu_item(atom menu,atom pos)
	return c_func(xal_remove_menu_item,{menu,pos})
end function

public function al_clone_menu(atom menu)
	return c_func(xal_clone_menu,{menu})
end function

public function al_clone_menu_for_popup(atom menu)
	return c_func(xal_clone_menu_for_popup,{menu})
end function

public procedure al_destroy_menu(atom menu)
	c_proc(xal_destroy_menu,{menu})
end procedure

export constant xal_get_menu_item_caption = define_c_func(dia,"+al_get_menu_item_caption",{C_POINTER,C_INT},C_STRING),
				xal_set_menu_item_caption = define_c_proc(dia,"+al_set_menu_item_caption",{C_POINTER,C_INT,C_STRING}),
				xal_get_menu_item_flags = define_c_func(dia,"+al_get_menu_item_flags",{C_POINTER,C_INT},C_INT),
				xal_set_menu_item_flags = define_c_proc(dia,"+al_set_menu_item_flags",{C_POINTER,C_INT,C_INT}),
				xal_get_menu_item_icon = define_c_func(dia,"+al_get_menu_item_icon",{C_POINTER,C_INT},ALLEGRO_BITMAP),
				xal_set_menu_item_icon = define_c_proc(dia,"+al_set_menu_item_icon",{C_POINTER,C_INT,ALLEGRO_BITMAP})
				
public function al_get_menu_item_caption(atom menu,atom pos)
	return c_func(xal_get_menu_item_caption,{menu,pos})
end function

public procedure al_set_menu_item_caption(atom menu,atom pos,sequence caption)
	c_proc(xal_set_menu_item_caption,{menu,pos,caption})
end procedure

public function al_get_menu_item_flags(atom menu,atom pos)
	return c_func(xal_get_menu_item_flags,{menu,pos})
end function

public procedure al_set_menu_item_flags(atom menu,atom pos,atom flags)
	c_proc(xal_set_menu_item_flags,{menu,pos,flags})
end procedure

public function al_get_menu_item_icon(atom menu,atom pos)
	return c_func(xal_get_menu_item_icon,{menu,pos})
end function

public procedure al_set_menu_item_icon(atom menu,atom pos,sequence icon)
	c_proc(xal_set_menu_item_icon,{menu,pos,icon})
end procedure

export constant xal_toggle_menu_item_icon = define_c_func(dia,"+al_toggle_menu_item_icon",{C_POINTER,C_INT,C_INT},C_INT)

public function al_toggle_menu_item_icon(atom menu,atom pos,atom flags)
	return c_func(xal_toggle_menu_item_icon,{menu,pos,flags})
end function

export constant xal_find_menu = define_c_func(dia,"+al_find_menu",{C_POINTER,C_UINT},C_POINTER),
				xal_find_menu_item = define_c_func(dia,"+al_find_menu_item",{C_POINTER,C_UINT,C_POINTER,C_POINTER},C_BOOL)
				
public function al_find_menu(atom haystack,atom id)
	return c_func(xal_find_menu,{haystack,id})
end function

public function al_find_menu_item(atom haystack,atom id,atom menu,atom index)
	return c_func(xal_find_menu_item,{haystack,id,menu,index})
end function

export constant xal_get_default_menu_event_source = define_c_func(dia,"+al_get_default_menu_event_source",{},C_POINTER),
				xal_enable_menu_event_source = define_c_func(dia,"+al_enable_menu_event_source",{C_POINTER},C_POINTER),
				xal_disable_menu_event_source = define_c_proc(dia,"+al_disable_menu_event_source",{C_POINTER})
				
public function al_get_default_menu_event_source()
	return c_func(xal_get_default_menu_event_source,{})
end function

public function al_enable_menu_event_source(atom menu)
	return c_func(xal_enable_menu_event_source,{menu})
end function

public procedure al_disable_menu_event_source(atom menu)
	c_proc(xal_disable_menu_event_source,{menu})
end procedure

export constant xal_get_display_menu = define_c_func(dia,"+al_get_display_menu",{C_POINTER},C_POINTER),
				xal_set_display_menu = define_c_func(dia,"+al_set_display_menu",{C_POINTER,C_POINTER},C_BOOL),
				xal_popup_menu = define_c_func(dia,"+al_popup_menu",{C_POINTER,C_POINTER},C_BOOL),
				xal_remove_display_menu = define_c_func(dia,"+al_remove_display_menu",{C_POINTER},C_POINTER)
				
public function al_get_display_menu(atom display)
	return c_func(xal_get_display_menu,{display})
end function

public function al_set_display_menu(atom display,atom menu)
	return c_func(xal_set_display_menu,{display,menu})
end function

public function al_popup_menu(atom p,atom display)
	return c_func(xal_popup_menu,{p,display})
end function

public function al_remove_display_menu(atom display)
	return c_func(xal_remove_display_menu,{display})
end function

export constant xal_get_allegro_native_dialog_version = define_c_func(dia,"+al_get_allegro_native_dialog_version",{},C_UINT)

public function al_get_allegro_native_dialog_version()
	return c_func(xal_get_allegro_native_dialog_version,{})
end function

public enum ALLEGRO_FILECHOOSER_FILE_MUST_EXIST = 1,
		    ALLEGRO_FILECHOOSER_SAVE = 2,
		    ALLEGRO_FILECHOOSER_FOLDER = 4,
		    ALLEGRO_FILECHOOSER_PICTURES = 8,
		    ALLEGRO_FILECHOOSER_SHOW_HIDDEN = 16,
		    ALLEGRO_FILECHOOSER_MULTIPLE = 32
		    
public constant ALLEGRO_MESSAGEBOX_WARN = shift_bits(1,0),
				ALLEGRO_MESSAGEBOX_ERROR = shift_bits(1,-1),
				ALLEGRO_MESSAGEBOX_OK_CANCEL = shift_bits(1,-2),
				ALLEGRO_MESSAGEBOX_YES_NO = shift_bits(1,-3),
				ALLEGRO_MESSAGEBOX_QUESTION = shift_bits(1,-4)
				
public constant ALLEGRO_TEXTLOG_NO_CLOSE = shift_bits(1,0),
				ALLEGRO_TEXTLOG_MONOSPACE = shift_bits(1,-1)
				
public enum ALLEGRO_EVENT_NATIVE_DIALOG_CLOSE = 600,
			ALLEGRO_EVENT_MENU_CLICK
			
public enum ALLEGRO_MENU_ITEM_ENABLED = 0,
			ALLEGRO_MENU_ITEM_CHECKBOX = 1,
			ALLEGRO_MENU_ITEM_CHECKED = 2,
			ALLEGRO_MENU_ITEM_DISABLED = 4
­15.20