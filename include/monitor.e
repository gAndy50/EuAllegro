include std/ffi.e

include base.e

public constant ALLEGRO_MONITOR_INFO = define_c_struct({
	C_INT, --x1
	C_INT, --y1
	C_INT, --x2
	C_INT --y2
})

public constant ALLEGRO_DEFAULT_DISPLAY_ADAPTER = -1

export constant xal_get_num_video_adapters = define_c_func(all,"+al_get_num_video_adapters",{},C_INT),
				xal_get_monitor_info = define_c_func(all,"+al_get_monitor_info",{C_INT,ALLEGRO_MONITOR_INFO},C_BOOL),
				xal_get_monitor_dpi = define_c_func(all,"+al_get_monitor_dpi",{C_INT},C_INT)
				
public function al_get_num_video_adapters()
	return c_func(xal_get_num_video_adapters,{})
end function

public function al_get_monitor_info(atom adapter,sequence info)
	return c_func(xal_get_monitor_info,{adapter,info})
end function

public function al_get_monitor_dpi(atom adapter)
	return c_func(xal_get_monitor_dpi,{adapter})
end function
­5.54