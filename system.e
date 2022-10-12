include std/ffi.e

include base.e
include config.e
include path.e

public constant ALLEGRO_SYSTEM_ID_UNKNOWN = 0,
				ALLEGRO_SYSTEM_ID_XGLX_AL_ID = {'X','G','L','X'},
				ALLEGRO_SYSTEM_ID_WINDOWS = {'W','I','N','D'},
				ALLEGRO_SYSTEM_ID_KMACOSX = {'O','S','X'},
				ALLEGRO_SYSTEM_ID_ANDROID = {'A','N','D','R'},
				ALLEGRO_SYSTEM_ID_IPHONE = {'I','P','H','O'},
				ALLEGRO_SYSTEM_ID_GP2XWIZ = {'W','I','Z'},
				ALLEGRO_SYSTEM_ID_RASPBERRY_PI = {'R','A','S','P'},
				ALLEGRO_SYSTEM_ID_SDL = {'S','D','L','2'}
				

export constant xal_install_system = define_c_func(all,"+al_install_system",{C_INT,C_POINTER},C_BOOL),
				xal_uninstall_system = define_c_proc(all,"+al_uninstall_system",{}),
				xal_is_system_installed = define_c_func(all,"+al_is_system_installed",{},C_BOOL),
				xal_get_system_driver = define_c_func(all,"+al_get_system_driver",{},C_POINTER),
				xal_get_system_config = define_c_func(all,"+al_get_system_config",{},C_POINTER),
				xal_get_system_id = define_c_func(all,"+al_get_system_id",{},C_INT)
				
public function al_install_system(atom ver,sequence ptr)
	return c_func(xal_install_system,{ver,ptr})
end function

public procedure al_uninstall_system()
	c_proc(xal_uninstall_system,{})
end procedure

public function al_is_system_installed()
	return c_func(xal_is_system_installed,{})
end function

public function al_get_system_driver()
	return c_func(xal_get_system_driver,{})
end function

public function al_get_system_config()
	return c_func(xal_get_system_config,{})
end function

public function al_get_system_id()
	return c_func(xal_get_system_id,{})
end function


public enum ALLEGRO_RESOURCES_PATH = 0,
			ALLEGRO_TEMP_PATH,
			ALLEGRO_USER_DATA_PATH,
			ALLEGRO_USER_HOME_PATH,
			ALLEGRO_USER_SETTINGS_PATH,
			ALLEGRO_USER_DOCUMENTS_PATH,
			ALLEGRO_EXENAME_PATH,
			ALLEGRO_LAST_PATH
			

export constant xal_get_standard_path = define_c_func(all,"+al_get_standard_path",{C_INT},C_POINTER),
				xal_set_exe_name = define_c_proc(all,"+al_set_exe_name",{C_STRING})
				
public function al_get_standard_path(atom id)
	return c_func(xal_get_standard_path,{id})
end function

public procedure al_set_exe_name(sequence path)
	c_proc(xal_set_exe_name,{path})
end procedure


export constant xal_set_org_name = define_c_proc(all,"+al_set_org_name",{C_STRING}),
				xal_set_app_name = define_c_proc(all,"+al_set_app_name",{C_STRING}),
				xal_get_org_name = define_c_func(all,"+al_get_org_name",{},C_STRING),
				xal_get_app_name = define_c_func(all,"+al_get_app_name",{},C_STRING)
				
public procedure al_set_org_name(sequence org)
	c_proc(xal_set_org_name,{org})
end procedure

public procedure al_set_app_name(sequence app)
	c_proc(xal_set_app_name,{app})
end procedure

public function al_get_org_name()
	return c_func(xal_get_org_name,{})
end function

public function al_get_app_name()
	return c_func(xal_get_app_name,{})
end function


export constant xal_inhibit_screensaver = define_c_func(all,"+al_inhibit_screensaver",{C_BOOL},C_BOOL)

public function al_inhibit_screensaver(integer in)
	return c_func(xal_inhibit_screensaver,{in})
end function
­97.44