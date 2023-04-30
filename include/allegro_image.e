--Allegro Image Addon
--Wrapper by Icy Viking
include std/ffi.e
include std/machine.e
include std/os.e

include allegro.e

atom img = 0

ifdef WINDOWS then
	img = open_dll("allegro_image-5.2.dll")
	elsifdef LINUX or FREEBSD then
	img = open_dll("liballegro_image-5.2.so")
end ifdef

export constant xal_init_image_addon = define_c_func(img,"+al_init_image_addon",{},C_BOOL),
				xal_is_image_addon_initialized = define_c_func(img,"+al_is_image_addon_initialized",{},C_BOOL),
				xal_shutdown_image_addon = define_c_proc(img,"+al_shutdown_image_addon",{}),
				xal_get_allegro_image_version = define_c_func(img,"+al_get_allegro_image_version",{},C_UINT)
				
public function al_init_image_addon()
	return c_func(xal_init_image_addon,{})
end function

public function al_is_image_addon_initialized()
	return c_func(xal_is_image_addon_initialized,{})
end function

public procedure al_shutdown_image_addon()
	c_proc(xal_shutdown_image_addon,{})
end procedure

public function al_get_allegro_image_version()
	return c_func(xal_get_allegro_image_version,{})
end function
­14.20