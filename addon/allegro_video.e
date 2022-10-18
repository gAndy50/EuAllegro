--Allegro Video
--Euphoria Port: Andy P.

include std/ffi.e

include allegro.e
include allegro_audio.e

public enum type ALLEGRO_VIDEO_EVENT_TYPE
	ALLEGRO_EVENT_VIDEO_FRAME_SHOW = 550,
	ALLEGRO_EVENT_VIDEO_FINISHED = 551,
	ALLEGRO_EVENT_VIDEO_SEEK = 552
end type

public enum type ALLEGRO_VIDEO_POSITION_TYPE
	ALLEGRO_VIDEO_POSITION_ACTUAL = 0,
	ALLEGRO_VIDEO_POSITION_VIDEO_DECODE = 1,
	ALLEGRO_VIDEO_POSITION_AUDIO_DECODE = 2
end type

export constant vid = open_dll("allegro_video-5.2.dll")

export constant xal_open_video = define_c_func(vid,"+al_open_video",{C_STRING},C_POINTER),
				xal_close_video = define_c_proc(vid,"+al_close_video",{C_POINTER}),
				xal_start_video = define_c_proc(vid,"+al_start_video",{C_POINTER,C_POINTER}),
				xal_start_video_with_voice = define_c_proc(vid,"+al_start_video_with_voice",{C_POINTER,C_POINTER}),
				xal_get_video_event_source = define_c_func(vid,"+al_get_video_event_source",{C_POINTER},C_POINTER),
				xal_set_video_playing = define_c_proc(vid,"+al_set_video_playing",{C_POINTER,C_BOOL}),
				xal_is_video_playing = define_c_func(vid,"+al_is_video_playing",{C_POINTER},C_BOOL),
				xal_get_video_audio_rate = define_c_func(vid,"+al_get_video_audio_rate",{C_POINTER},C_DOUBLE),
				xal_get_video_fps = define_c_func(vid,"+al_get_video_fps",{C_POINTER},C_DOUBLE),
				xal_get_video_scaled_width = define_c_func(vid,"+al_get_video_scaled_width",{C_POINTER},C_FLOAT),
				xal_get_video_scaled_height = define_c_func(vid,"+al_get_video_scaled_height",{C_POINTER},C_FLOAT),
				xal_get_video_frame = define_c_func(vid,"+al_get_video_frame",{C_POINTER},C_POINTER),
				xal_get_video_position = define_c_func(vid,"+al_get_video_position",{C_POINTER,C_INT},C_DOUBLE),
				xal_seek_video = define_c_func(vid,"+al_seek_video",{C_POINTER,C_DOUBLE},C_BOOL),
				xal_init_video_addon = define_c_func(vid,"+al_init_video_addon",{},C_BOOL),
				xal_is_video_addon_initialized = define_c_func(vid,"+al_is_video_addon_initialized",{},C_BOOL),
				xal_shutdown_video_addon = define_c_proc(vid,"+al_shutdown_video_addon",{}),
				xal_get_allegro_video_version = define_c_func(vid,"+al_get_allegro_video_version",{},C_UINT)
				
public function al_open_video(sequence fname)
	return c_func(xal_open_video,{fname})
end function

public procedure al_close_video(atom vid)
	c_proc(xal_close_video,{vid})
end procedure

public procedure al_start_video(atom vid)
	c_proc(xal_start_video,{vid})
end procedure

public procedure al_start_video_with_voice(atom vid,atom v)
	c_proc(xal_start_video_with_voice,{vid,v})
end procedure

public function al_get_video_event_source(atom vid)
	return c_func(xal_get_video_event_source,{vid})
end function

public procedure al_set_video_playing(atom vid,atom play)
	c_proc(xal_set_video_playing,{vid,play})
end procedure

public function al_is_video_playing(atom vid)
	return c_func(xal_is_video_playing,{vid})
end function

public function al_get_video_audio_rate(atom vid)
	return c_func(xal_get_video_audio_rate,{vid})
end function

public function al_get_video_fps(atom vid)
	return c_func(xal_get_video_fps,{vid})
end function

public function al_get_video_scaled_width(atom vid)
	return c_func(xal_get_video_scaled_width,{vid})
end function

public function al_get_video_scaled_height(atom vid)
	return c_func(xal_get_video_scaled_height,{vid})
end function

public function al_get_video_frame(atom vid)
	return c_func(xal_get_video_frame,{vid})
end function

public function al_get_video_position(atom vid,ALLEGRO_VIDEO_POSITION_TYPE which)
	return c_func(xal_get_video_position,{vid,which})
end function

public function al_seek_video(atom vid,atom pos)
	return c_func(xal_seek_video,{vid,pos})
end function

public function al_init_video_addon()
	return c_func(xal_init_video_addon,{})
end function

public function al_is_video_addon_initialized()
	return c_func(xal_is_video_addon_initialized,{})
end function

public procedure al_shutdown_video_addon()
	c_proc(xal_shutdown_video_addon,{})
end procedure

public function al_get_allegro_video_version()
	return c_func(xal_get_allegro_video_version,{})
end function
­111.48