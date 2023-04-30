--Allegro Audio add-on
--Euphoria Port Written by Andy P.
include std/ffi.e
include std/machine.e
include std/math.e

include allegro.e

public enum type ALLEGRO_AUDIO_EVENT_TYPE
	_KCM_STREAM_FEEDER_QUIT_EVENT_TYPE = 512,
	ALLEGRO_EVENT_AUDIO_STREAM_FRAGMENT = 513,
	ALLEGRO_EVENT_AUDIO_STREAM_FINISHED = 514,
	ALLEGRO_EVENT_AUDIO_RECORDER_FRAGMENT = 515
end type

public constant ALLEGRO_AUDIO_RECORDER_EVENT = define_c_struct({
	C_POINTER, --internal
	C_POINTER, --buffer
	C_UINT --samples
})

public enum type ALLEGRO_AUDIO_DEPTH
	ALLEGRO_AUDIO_DEPTH_INT8 = 0x00,
	ALLEGRO_AUDIO_DEPTH_INT16 = 0x01,
	ALLEGRO_AUDIO_DEPTH_INT24 = 0x02,
	ALLEGRO_AUDIO_DEPTH_FLOAT32 = 0x03,
	ALLEGRO_AUDIO_DEPTH_UNSIGNED = 0x08
end type

public enum type ALLEGRO_CHANNEL_CONF
 	ALLEGRO_CHANNEL_CONF_1 = 0x10,
 	ALLEGRO_CHANNEL_CONF_2 = 0x20,
 	ALLEGRO_CHANNEL_CONF_3 = 0x30,
 	ALLEGRO_CHANNEL_CONF_4 = 0x40,
 	ALLEGRO_CHANNEL_CONF_5_1 = 0x51,
 	ALLEGRO_CHANNEL_CONF_6_1 = 0x61,
 	ALLEGRO_CHANNEL_CONF_7_1 = 0x71
end type

public constant ALLEGOR_MAX_CHANNELS = 8

public enum type ALLEGRO_PLAYMODE
	ALLEGRO_PLAYMODE_ONCE = 0x100,
	ALLEGRO_PLAYMODE_LOOP = 0x101,
	ALLEGRO_PLAYMODE_BIDIR = 0x102,
	ALLEGRO_PLAYMODE_STREAM_ONCE = 0x103,
	ALLEGRO_PLAYMODE_STREAM_ONEDIR = 0x104
end type

public enum type ALLEGRO_MIXER_QUALITY
	ALLEGRO_MIXER_QUALITY_POINT = 0x110,
	ALLEGRO_MIXER_QUALITY_LINEAR = 0x111,
	ALLEGRO_MIXER_QUALITY_CUBIC = 0x112
end type

public constant ALLEGRO_AUDIO_PAN_NONE = -1000.0

public constant ALLEGRO_SAMPLE_ID = define_c_struct({
	C_INT, --index
	C_INT --id
})

export constant aud = open_dll("allegro_audio-5.2.dll")

export constant xal_create_sample = define_c_func(aud,"+al_create_sample",{C_POINTER,C_UINT,C_UINT,C_INT},C_POINTER),
				xal_destroy_sample = define_c_proc(aud,"+al_destroy_sample",{C_POINTER})
				
public function al_create_sample(atom buf,atom samples,atom freq,ALLEGRO_AUDIO_DEPTH depth)
	return c_func(xal_create_sample,{buf,samples,freq,depth})
end function

public procedure al_destroy_sample(atom spl)
	c_proc(xal_destroy_sample,{spl})
end procedure

export constant xal_create_sample_instance = define_c_func(aud,"+al_create_sample_instance",{C_POINTER},C_POINTER),
				xal_destroy_sample_instance = define_c_proc(aud,"+al_destroy_sample_instance",{C_POINTER})
				
public function al_create_sample_instance(atom data)
	return c_func(xal_create_sample_instance,{data})
end function

public procedure al_destroy_sample_instance(atom spl)
	c_proc(xal_destroy_sample_instance,{spl})
end procedure

export constant xal_get_sample_frequency = define_c_func(aud,"+al_get_sample_frequency",{C_POINTER},C_UINT),
				xal_get_sample_length = define_c_func(aud,"+al_get_sample_length",{C_POINTER},C_UINT),
				xal_get_sample_depth = define_c_func(aud,"+al_get_sample_depth",{C_POINTER},C_INT),
				xal_get_sample_channels = define_c_func(aud,"+al_get_sample_channels",{C_POINTER},C_INT),
				xal_get_sample_data = define_c_func(aud,"+al_get_sample_data",{C_POINTER},C_POINTER)
				
public function al_get_sample_frequency(atom spl)
	return c_func(xal_get_sample_frequency,{spl})
end function

public function al_get_sample_length(atom spl)
	return c_func(xal_get_sample_length,{spl})
end function

public function al_get_sample_depth(atom spl)
	return c_func(xal_get_sample_depth,{spl})
end function

public function al_get_sample_channels(atom spl)
	return c_func(xal_get_sample_channels,{spl})
end function

public function al_get_sample_data(atom spl)
	return c_func(xal_get_sample_data,{spl})
end function

export constant xal_get_sample_instance_frequency = define_c_func(aud,"+al_get_sample_instance_frequency",{C_POINTER},C_UINT),
				xal_get_sample_instance_length = define_c_func(aud,"+al_get_sample_instance_length",{C_POINTER},C_UINT),
				xal_get_sample_instance_position = define_c_func(aud,"+al_get_sample_instance_position",{C_POINTER},C_UINT)
				

export constant	xal_get_sample_instance_speed = define_c_func(aud,"+al_get_sample_instance_speed",{C_POINTER},C_FLOAT),
				xal_get_sample_instance_gain = define_c_func(aud,"+al_get_sample_instance_gain",{C_POINTER},C_FLOAT),
				xal_get_sample_instance_pan = define_c_func(aud,"+al_get_sample_instance_pan",{C_POINTER},C_FLOAT),
				xal_get_sample_instance_time = define_c_func(aud,"+al_get_sample_instance_time",{C_POINTER},C_FLOAT)
				
public function al_get_sample_instance_frequency(atom spl)
	return c_func(xal_get_sample_instance_frequency,{spl})
end function

public function al_get_sample_instance_length(atom spl)
	return c_func(xal_get_sample_instance_length,{spl})
end function

public function al_get_sample_instance_position(atom spl)
	return c_func(xal_get_sample_instance_position,{spl})
end function

public function al_get_sample_instance_speed(atom spl)
	return c_func(xal_get_sample_instance_speed,{spl})
end function

public function al_get_sample_instance_gain(atom spl)
	return c_func(xal_get_sample_instance_gain,{spl})
end function

public function al_get_sample_instance_pan(atom spl)
	return c_func(xal_get_sample_instance_pan,{spl})
end function

public function al_get_sample_instance_time(atom spl)
	return c_func(xal_get_sample_instance_time,{spl})
end function

export constant xal_get_sample_instance_depth = define_c_func(aud,"+al_get_sample_instance_depth",{C_POINTER},C_INT),
				xal_get_sample_instance_channels = define_c_func(aud,"+al_get_sample_instance_channels",{C_POINTER},C_INT),
				xal_get_sample_instance_playmode = define_c_func(aud,"+al_get_sample_instance_playmode",{C_POINTER},C_INT)
				
public function al_get_sample_instance_depth(atom spl)
	return c_func(xal_get_sample_instance_depth,{spl})
end function

public function al_get_sample_instance_channels(atom spl)
	return c_func(xal_get_sample_instance_channels,{spl})
end function

public function al_get_sample_instance_playmode(atom spl)
	return c_func(xal_get_sample_instance_playmode,{spl})
end function

export constant xal_get_sample_instance_playing = define_c_func(aud,"+al_get_sample_instance_playing",{C_POINTER},C_BOOL),
				xal_get_sample_instance_attached = define_c_func(aud,"+al_get_sample_instance_attached",{C_POINTER},C_BOOL)
				
public function al_get_sample_instance_playing(atom spl)
	return c_func(xal_get_sample_instance_playing,{spl})
end function

public function al_get_sample_instance_attached(atom spl)
	return c_func(xal_get_sample_instance_attached,{spl})
end function

export constant xal_set_sample_instance_position = define_c_func(aud,"+al_set_sample_instance_position",{C_POINTER,C_UINT},C_BOOL),
				xal_set_sample_instance_length = define_c_func(aud,"+al_set_sample_instance_length",{C_POINTER,C_UINT},C_BOOL)
				
public function al_set_sample_instance_position(atom spl,atom val)
	return c_func(xal_set_sample_instance_position,{spl,val})
end function

public function al_set_sample_instance_length(atom spl,atom val)
	return c_func(xal_set_sample_instance_length,{spl,val})
end function

export constant xal_set_sample_instance_speed = define_c_func(aud,"+al_set_sample_instance_speed",{C_POINTER,C_FLOAT},C_BOOL),
				xal_set_sample_instance_gain = define_c_func(aud,"+al_set_sample_instance_gain",{C_POINTER,C_FLOAT},C_BOOL),
				xal_set_sample_instance_pan = define_c_func(aud,"+al_set_sample_instance_pan",{C_POINTER,C_FLOAT},C_BOOL)
				
public function al_set_sample_instance_speed(atom spl,atom val)
	return c_func(xal_set_sample_instance_speed,{spl,val})
end function

public function al_set_sample_instance_gain(atom spl,atom val)
	return c_func(xal_set_sample_instance_gain,{spl,val})
end function

public function al_set_sample_instance_pan(atom spl,atom val)
	return c_func(xal_set_sample_instance_pan,{spl,val})
end function

export constant xal_set_sample_instance_playmode = define_c_func(aud,"+al_set_sample_instance_playmode",{C_POINTER,C_INT},C_BOOL)

public function al_set_sample_instance_playmode(atom spl,atom val)
	return c_func(xal_set_sample_instance_playmode,{spl,val})
end function

export constant xal_set_sample_instance_playing = define_c_func(aud,"+al_set_sample_instance_playing",{C_POINTER,C_BOOL},C_BOOL),
				xal_detach_sample_instance = define_c_func(aud,"+al_detach_sample_instance",{C_POINTER},C_BOOL)
				
public function al_set_sample_instance_playing(atom spl,atom val)
	return c_func(xal_set_sample_instance_playing,{spl,val})
end function

public function al_detach_sample_instance(atom spl)
	return c_func(xal_detach_sample_instance,{spl})
end function

export constant xal_set_sample = define_c_func(aud,"+al_set_sample",{C_POINTER,C_POINTER},C_BOOL),
				xal_get_sample = define_c_func(aud,"+al_get_sample",{C_POINTER},C_POINTER),
				xal_play_sample_instance = define_c_func(aud,"+al_play_sample_instance",{C_POINTER},C_BOOL),
				xal_stop_sample_instance = define_c_func(aud,"+al_stop_sample_instance",{C_POINTER},C_BOOL),
				xal_set_sample_instance_channel_matrix = define_c_func(aud,"+al_set_sample_instance_channel_matrix",{C_POINTER,C_POINTER},C_BOOL)
				
public function al_set_sample(atom spl,atom data)
	return c_func(xal_set_sample,{spl,data})
end function

public function al_get_sample(atom spl)
	return c_func(xal_get_sample,{spl})
end function

public function al_play_sample_instance(atom spl)
	return c_func(xal_play_sample_instance,{spl})
end function

public function al_stop_sample_instance(atom spl)
	return c_func(xal_stop_sample_instance,{spl})
end function

public function al_set_sample_instance_channel_matrix(atom spl,atom matrix)
	return c_func(xal_set_sample_instance_channel_matrix,{spl,matrix})
end function

export constant xal_create_audio_stream = define_c_func(aud,"+al_create_audio_stream",{C_SIZE_T,C_UINT,C_UINT,C_INT,C_INT},C_POINTER),
				xal_destroy_audio_stream = define_c_proc(aud,"+al_destroy_audio_stream",{C_POINTER}),
				xal_drain_audio_stream = define_c_proc(aud,"+al_drain_audio_stream",{C_POINTER})
				
public function al_create_audio_stream(atom buffer_count,atom samples,atom freq,ALLEGRO_AUDIO_DEPTH depth,ALLEGRO_CHANNEL_CONF conf)
	return c_func(xal_create_audio_stream,{buffer_count,samples,freq,depth,conf})
end function

public procedure al_destroy_audio_stream(atom str)
	c_proc(xal_destroy_audio_stream,{str})
end procedure

public procedure al_drain_audio_stream(atom str)
	c_proc(xal_drain_audio_stream,{str})
end procedure

export constant xal_get_audio_stream_frequency = define_c_func(aud,"+al_get_audio_stream_frequency",{C_POINTER},C_UINT),
				xal_get_audio_stream_length = define_c_func(aud,"+al_get_audio_stream_length",{C_POINTER},C_UINT),
				xal_get_audio_stream_fragments = define_c_func(aud,"+al_get_audio_stream_fragments",{C_POINTER},C_UINT),
				xal_get_available_audio_stream_fragments = define_c_func(aud,"+al_get_available_audio_stream_fragments",{C_POINTER},C_UINT)
				
public function al_get_audio_stream_frequency(atom str)
	return c_func(xal_get_audio_stream_frequency,{str})
end function

public function al_get_audio_stream_length(atom str)
	return c_func(xal_get_audio_stream_length,{str})
end function

public function al_get_audio_stream_fragments(atom str)
	return c_func(xal_get_audio_stream_fragments,{str})
end function

public function al_get_available_audio_stream_fragments(atom str)
	return c_func(xal_get_available_audio_stream_fragments,{str})
end function

export constant xal_get_audio_stream_speed = define_c_func(aud,"+al_get_audio_stream_speed",{C_POINTER},C_FLOAT),
				xal_get_audio_stream_gain = define_c_func(aud,"+al_get_audio_stream_gain",{C_POINTER},C_FLOAT),
				xal_get_audio_stream_pan = define_c_func(aud,"+al_get_audio_stream_pan",{C_POINTER},C_FLOAT)
				
public function al_get_audio_stream_speed(atom str)
	return c_func(xal_get_audio_stream_speed,{str})
end function

public function al_get_audio_stream_gain(atom str)
	return c_func(xal_get_audio_stream_gain,{str})
end function

public function al_get_audio_stream_pan(atom str)
	return c_func(xal_get_audio_stream_pan,{str})
end function

export constant xal_get_audio_stream_channels = define_c_func(aud,"+al_get_audio_stream_channels",{C_POINTER},C_INT),
				xal_get_audio_stream_depth = define_c_func(aud,"+al_get_audio_stream_depth",{C_POINTER},C_INT),
				xal_get_audio_stream_playmode = define_c_func(aud,"+al_get_audio_stream_playmode",{C_POINTER},C_INT)
				
public function al_get_audio_stream_channels(atom str)
	return c_func(xal_get_audio_stream_channels,{str})
end function

public function al_get_audio_stream_depth(atom str)
	return c_func(xal_get_audio_stream_depth,{str})
end function

public function al_get_audio_stream_playmode(atom str)
	return c_func(xal_get_audio_stream_playmode,{str})
end function

export constant xal_get_audio_stream_playing = define_c_func(aud,"+al_get_audio_stream_playing",{C_POINTER},C_BOOL),
				xal_get_audio_stream_attached = define_c_func(aud,"+al_get_audio_stream_attached",{C_POINTER},C_BOOL),
				xal_get_audio_stream_played_samples = define_c_func(aud,"+al_get_audio_stream_played_samples",{C_POINTER},C_LONG)
				
public function al_get_audio_stream_playing(atom spl)
	return c_func(xal_get_audio_stream_playing,{spl})
end function

public function al_get_audio_stream_attached(atom spl)
	return c_func(xal_get_audio_stream_attached,{spl})
end function

public function al_get_audio_stream_played_samples(atom spl)
	return c_func(xal_get_audio_stream_played_samples,{spl})
end function

export constant xal_get_audio_stream_fragment = define_c_func(aud,"+al_get_audio_stream_fragment",{C_POINTER},C_POINTER)

public function al_get_audio_stream_fragment(atom str)
	return c_func(xal_get_audio_stream_fragment,{str})
end function

export constant xal_set_audio_stream_speed = define_c_func(aud,"+al_set_audio_stream_speed",{C_POINTER,C_FLOAT},C_BOOL),
				xal_set_audio_stream_gain = define_c_func(aud,"+al_set_audio_stream_gain",{C_POINTER,C_FLOAT},C_BOOL),
				xal_set_audio_stream_pan = define_c_func(aud,"+al_set_audio_stream_pan",{C_POINTER,C_FLOAT},C_BOOL)
				
public function al_set_audio_stream_speed(atom str,atom val)
	return c_func(xal_set_audio_stream_speed,{str,val})
end function

public function al_set_audio_stream_gain(atom str,atom val)
	return c_func(xal_set_audio_stream_gain,{str,val})
end function

public function al_set_audio_stream_pan(atom str,atom val)
	return c_func(xal_set_audio_stream_pan,{str,val})
end function

export constant xal_set_audio_stream_playmode = define_c_func(aud,"+al_set_audio_stream_playmode",{C_POINTER,C_INT},C_BOOL)

public function al_set_audio_stream_playmode(atom str,ALLEGRO_PLAYMODE mode)
	return c_func(xal_set_audio_stream_playmode,{str,mode})
end function

export constant xal_set_audio_stream_playing = define_c_func(aud,"+al_set_audio_stream_playing",{C_POINTER,C_BOOL},C_BOOL),
				xal_detach_audio_stream = define_c_func(aud,"+al_detach_audio_stream",{C_POINTER},C_BOOL),
				xal_set_audio_stream_fragment = define_c_func(aud,"+al_set_audio_stream_fragment",{C_POINTER,C_POINTER},C_BOOL)
				
public function al_set_audio_stream_playing(atom str,atom val)
	return c_func(xal_set_audio_stream_playing,{str,val})
end function

public function al_detach_audio_stream(atom str)
	return c_func(xal_detach_audio_stream,{str})
end function

public function al_set_audio_stream_fragment(atom str,atom val)
	return c_func(xal_set_audio_stream_fragment,{str,val})
end function

export constant xal_rewind_audio_stream = define_c_func(aud,"+al_rewind_audio_stream",{C_POINTER},C_BOOL),
				xal_seek_audio_stream_secs = define_c_func(aud,"+al_seek_audio_stream_secs",{C_POINTER,C_DOUBLE},C_BOOL),
				xal_get_audio_stream_position_secs = define_c_func(aud,"+al_get_audio_stream_position_secs",{C_POINTER},C_DOUBLE),
				xal_get_audio_stream_length_secs = define_c_func(aud,"+al_get_audio_stream_length_secs",{C_POINTER},C_DOUBLE),
				xal_set_audio_stream_loop_secs = define_c_func(aud,"+al_set_audio_stream_loop_secs",{C_POINTER,C_DOUBLE,C_DOUBLE},C_BOOL)
				
public function al_rewind_audio_stream(atom str)
	return c_func(xal_rewind_audio_stream,{str})
end function

public function al_seek_audio_stream_secs(atom str,atom xtime)
	return c_func(xal_seek_audio_stream_secs,{str,xtime})
end function

public function al_get_audio_stream_position_secs(atom str)
	return c_func(xal_get_audio_stream_position_secs,{str})
end function

public function al_get_audio_stream_length_secs(atom str)
	return c_func(xal_get_audio_stream_length_secs,{str})
end function

public function al_set_audio_stream_loop_secs(atom str,atom start,atom xend)
	return c_func(xal_set_audio_stream_loop_secs,{str,start,xend})
end function

export constant xal_get_audio_stream_event_source = define_c_func(aud,"+al_get_audio_stream_event_source",{C_POINTER},C_POINTER)

public function al_get_audio_stream_event_source(atom str)
	return c_func(xal_get_audio_stream_event_source,{str})
end function

export constant xal_set_audio_stream_channel_matrix = define_c_func(aud,"+al_set_audio_stream_channel_matrix",{C_POINTER,C_POINTER},C_BOOL)

public function al_set_audio_stream_channel_matrix(atom str,atom matrix)
	return c_func(xal_set_audio_stream_channel_matrix,{str,matrix})
end function

export constant xal_create_mixer = define_c_func(aud,"+al_create_mixer",{C_UINT,C_INT,C_INT},C_POINTER),
				xal_destroy_mixer = define_c_proc(aud,"+al_destroy_mixer",{C_POINTER}),
				xal_attach_sample_instance_to_mixer = define_c_func(aud,"+al_attach_sample_instance_to_mixer",{C_POINTER,C_POINTER},C_BOOL),
				xal_attach_audio_stream_to_mixer = define_c_func(aud,"+al_attach_audio_stream_to_mixer",{C_POINTER,C_POINTER},C_BOOL),
				xal_attach_mixer_to_mixer = define_c_func(aud,"+al_attach_mixer_to_mixer",{C_POINTER,C_POINTER},C_BOOL),
				xal_set_mixer_postprocess_callback = define_c_func(aud,"+al_set_mixer_postprocess_callback",{C_POINTER,C_POINTER,C_POINTER,C_UINT,C_POINTER,C_POINTER},C_BOOL)
				
public function al_create_mixer(atom freq,ALLEGRO_AUDIO_DEPTH depth,ALLEGRO_CHANNEL_CONF conf)
	return c_func(xal_create_mixer,{freq,depth,conf})
end function

public procedure al_destroy_mixer(atom mix)
	c_proc(xal_destroy_mixer,{mix})
end procedure

public function al_attach_sample_instance_to_mixer(atom str,atom mix)
	return c_func(xal_attach_sample_instance_to_mixer,{str,mix})
end function

public function al_attach_audio_stream_to_mixer(atom str,atom mix)
	return c_func(xal_attach_audio_stream_to_mixer,{str,mix})
end function

public function al_attach_mixer_to_mixer(atom str,atom mix)
	return c_func(xal_attach_mixer_to_mixer,{str,mix})
end function

public function al_set_mixer_postprocess_callback(atom mix,atom cb,atom buff,atom samples,atom dat,atom dat2)
	return c_func(xal_set_mixer_postprocess_callback,{mix,cb,buff,samples,dat,dat2})
end function

export constant xal_get_mixer_frequency = define_c_func(aud,"+al_get_mixer_frequency",{C_POINTER},C_UINT),
				xal_get_mixer_channels = define_c_func(aud,"+al_get_mixer_channels",{C_POINTER},C_INT),
				xal_get_mixer_depth = define_c_func(aud,"+al_get_mixer_depth",{C_POINTER},C_INT),
				xal_get_mixer_quality = define_c_func(aud,"+al_get_mixer_quality",{C_POINTER},C_INT),
				xal_get_mixer_gain = define_c_func(aud,"+al_get_mixer_gain",{C_POINTER},C_FLOAT),
				xal_get_mixer_playing = define_c_func(aud,"+al_get_mixer_playing",{C_POINTER},C_BOOL),
				xal_get_mixer_attached = define_c_func(aud,"+al_get_mixer_attached",{C_POINTER},C_BOOL),
				xal_set_mixer_frequency = define_c_func(aud,"+al_set_mixer_frequency",{C_POINTER,C_UINT},C_BOOL),
				xal_set_mixer_quality = define_c_func(aud,"+al_set_mixer_quality",{C_POINTER,C_INT},C_BOOL),
				xal_set_mixer_gain = define_c_func(aud,"+al_set_mixer_gain",{C_POINTER,C_FLOAT},C_BOOL),
				xal_set_mixer_playing = define_c_func(aud,"+al_set_mixer_playing",{C_POINTER,C_BOOL},C_BOOL),
				xal_detach_mixer = define_c_func(aud,"+al_detach_mixer",{C_POINTER},C_BOOL)
				
public function al_get_mixer_frequency(atom mix)
	return c_func(xal_get_mixer_frequency,{mix})
end function

public function al_get_mixer_channels(atom mix)
	return c_func(xal_get_mixer_channels,{mix})
end function

public function al_get_mixer_depth(atom mix)
	return c_func(xal_get_mixer_depth,{mix})
end function

public function al_get_mixer_quality(atom mix)
	return c_func(xal_get_mixer_quality,{mix})
end function

public function al_get_mixer_gain(atom mix)
	return c_func(xal_get_mixer_gain,{mix})
end function

public function al_get_mixer_playing(atom mix)
	return c_func(xal_get_mixer_playing,{mix})
end function

public function al_get_mixer_attached(atom mix)
	return c_func(xal_get_mixer_attached,{mix})
end function

public function al_set_mixer_frequency(atom mix,atom val)
	return c_func(xal_set_mixer_frequency,{mix,val})
end function

public function al_set_mixer_quality(atom mix,ALLEGRO_MIXER_QUALITY val)
	return c_func(xal_set_mixer_quality,{mix,val})
end function

public function al_set_mixer_gain(atom mix,atom gain)
	return c_func(xal_set_mixer_gain,{mix,gain})
end function

public function al_set_mixer_playing(atom mix,atom val)
	return c_func(xal_set_mixer_playing,{mix,val})
end function

public function al_detach_mixer(atom mix)
	return c_func(xal_detach_mixer,{mix})
end function

export constant xal_create_voice = define_c_func(aud,"+al_create_voice",{C_UINT,C_INT,C_INT},C_POINTER),
				xal_destroy_voice = define_c_proc(aud,"+al_destroy_voice",{C_POINTER}),
				xal_attach_sample_instance_to_voice = define_c_func(aud,"+al_attach_sample_instance_to_voice",{C_POINTER,C_POINTER},C_BOOL),
				xal_attach_audio_stream_to_voice = define_c_func(aud,"+al_attach_audio_stream_to_voice",{C_POINTER,C_POINTER},C_BOOL),
				xal_attach_mixer_to_voice = define_c_func(aud,"+al_attach_mixer_to_voice",{C_POINTER,C_POINTER},C_BOOL),
				xal_detach_voice = define_c_proc(aud,"+al_detach_voice",{C_POINTER})
				
public function al_create_voice(atom freq,ALLEGRO_AUDIO_DEPTH depth,ALLEGRO_CHANNEL_CONF conf)
	return c_func(xal_create_voice,{freq,depth,conf})
end function

public procedure al_destroy_voice(atom v)
	c_proc(xal_destroy_voice,{v})
end procedure

public function al_attach_sample_instance_to_voice(atom str,atom v)
	return c_func(xal_attach_sample_instance_to_voice,{str,v})
end function

public function al_attach_audio_stream_to_voice(atom str,atom v)
	return c_func(xal_attach_audio_stream_to_voice,{str,v})
end function

public function al_attach_mixer_to_voice(atom mix,atom v)
	return c_func(xal_attach_mixer_to_voice,{mix,v})
end function

public procedure al_detach_voice(atom v)
	c_proc(xal_detach_voice,{v})
end procedure

export constant xal_get_voice_frequency = define_c_func(aud,"+al_get_voice_frequency",{C_POINTER},C_UINT),
				xal_get_voice_position = define_c_func(aud,"+al_get_voice_position",{C_POINTER},C_UINT),
				xal_get_voice_channels = define_c_func(aud,"+al_get_voice_channels",{C_POINTER},C_INT),
				xal_get_voice_depth = define_c_func(aud,"+al_get_voice_depth",{C_POINTER},C_INT),
				xal_get_voice_playing = define_c_func(aud,"+al_get_voice_playing",{C_POINTER},C_BOOL),
				xal_set_voice_position = define_c_func(aud,"+al_set_voice_position",{C_POINTER,C_UINT},C_BOOL),
				xal_set_voice_playing = define_c_func(aud,"+al_set_voice_playing",{C_POINTER,C_BOOL},C_BOOL)
				
public function al_get_voice_frequency(atom v)
	return c_func(xal_get_voice_frequency,{v})
end function

public function al_get_voice_position(atom v)
	return c_func(xal_get_voice_position,{v})
end function

public function al_get_voice_channels(atom v)
	return c_func(xal_get_voice_channels,{v})
end function

public function al_get_voice_depth(atom v)
	return c_func(xal_get_voice_depth,{v})
end function

public function al_get_voice_playing(atom v)
	return c_func(xal_get_voice_playing,{v})
end function

public function al_set_voice_position(atom v,atom val)
	return c_func(xal_set_voice_position,{v,val})
end function

public function al_set_voice_playing(atom v,atom val)
	return c_func(xal_set_voice_playing,{v,val})
end function

export constant xal_install_audio = define_c_func(aud,"+al_install_audio",{},C_BOOL),
				xal_uninstall_audio = define_c_proc(aud,"+al_uninstall_audio",{}),
				xal_is_audio_installed = define_c_func(aud,"+al_is_audio_installed",{},C_BOOL),
				xal_get_allegro_audio_version = define_c_func(aud,"+al_get_allegro_audio_version",{},C_UINT)
				
public function al_install_audio()
	return c_func(xal_install_audio,{})
end function

public procedure al_uninstall_audio()
	c_proc(xal_uninstall_audio,{})
end procedure

public function al_is_audio_installed()
	return c_func(xal_is_audio_installed,{})
end function

public function al_get_allegro_audio_version()
	return c_func(xal_get_allegro_audio_version,{})
end function

export constant xal_get_channel_count = define_c_func(aud,"+al_get_channel_count",{C_INT},C_SIZE_T),
				xal_get_audio_depth_size = define_c_func(aud,"+al_get_audio_depth_size",{C_INT},C_SIZE_T)
				
public function al_get_channel_count(ALLEGRO_CHANNEL_CONF conf)
	return c_func(xal_get_channel_count,{conf})
end function

public function al_get_audio_depth_size(ALLEGRO_AUDIO_DEPTH conf)
	return c_func(xal_get_audio_depth_size,{conf})
end function

export constant xal_fill_silence = define_c_proc(aud,"+al_fill_silence",{C_POINTER,C_UINT,C_INT,C_INT})

public procedure al_fill_silence(atom buf,atom samples,ALLEGRO_AUDIO_DEPTH depth,ALLEGRO_CHANNEL_CONF conf)
	c_proc(xal_fill_silence,{buf,samples,depth,conf})
end procedure

export constant xal_reserve_samples = define_c_func(aud,"+al_reserve_samples",{C_INT},C_BOOL),
				xal_get_default_mixer = define_c_func(aud,"+al_get_default_mixer",{},C_POINTER),
				xal_set_default_mixer = define_c_func(aud,"+al_set_default_mixer",{C_POINTER},C_BOOL),
				xal_restore_default_mixer = define_c_func(aud,"+al_restore_default_mixer",{},C_BOOL),
				xal_play_sample = define_c_func(aud,"+al_play_sample",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_POINTER},C_BOOL),
				xal_stop_sample = define_c_proc(aud,"+al_stop_sample",{C_POINTER}),
				xal_stop_samples = define_c_proc(aud,"+al_stop_samples",{}),
				xal_get_default_voice = define_c_func(aud,"+al_get_default_voice",{},C_POINTER),
				xal_set_default_voice = define_c_proc(aud,"+al_set_default_voice",{C_POINTER})
				
public function al_reserve_samples(atom rs)
	return c_func(xal_reserve_samples,{rs})
end function

public function al_get_default_mixer()
	return c_func(xal_get_default_mixer,{})
end function

public function al_set_default_mixer(atom mix)
	return c_func(xal_set_default_mixer,{mix})
end function

public function al_restore_default_mixer()
	return c_func(xal_restore_default_mixer,{})
end function

public function al_play_sample(atom data,atom gain,atom pan,atom speed,ALLEGRO_PLAYMODE xloop,atom id)
	return c_func(xal_play_sample,{data,gain,pan,speed,xloop,id})
end function

public procedure al_stop_sample(atom id)
	c_proc(xal_stop_sample,{id})
end procedure

public procedure al_stop_samples()
	c_proc(xal_stop_samples,{})
end procedure

public function al_get_default_voice()
	return c_func(xal_get_default_voice,{})
end function

public procedure al_set_default_voice(atom v)
	c_proc(xal_set_default_voice,{v})
end procedure

export constant xal_lock_sample_id = define_c_func(aud,"+al_lock_sample_id",{C_POINTER},C_POINTER),
				xal_unlock_sample_id = define_c_proc(aud,"+al_unlock_sample_id",{C_POINTER})
				
public function al_lock_sample_id(atom id)
	return c_func(xal_lock_sample_id,{id})
end function

public procedure al_unlock_sample_id(atom id)
	c_proc(xal_unlock_sample_id,{id})
end procedure

export constant xal_register_sample_loader = define_c_func(aud,"+al_register_sample_loader",{C_STRING,C_POINTER,C_STRING},C_BOOL),
				xal_register_sample_saver = define_c_func(aud,"+al_register_sample_saver",{C_STRING,C_POINTER,C_STRING,C_POINTER},C_BOOL),
				xal_register_audio_stream_loader = define_c_func(aud,"+al_register_audio_stream_loader",{C_STRING,C_POINTER,C_STRING,C_SIZE_T,C_UINT},C_BOOL)
				
public function al_register_sample_loader(sequence ext,atom load,sequence name)
	return c_func(xal_register_sample_loader,{ext,load,name})
end function

public function al_register_sample_saver(sequence ext,atom saver,sequence name,atom spl)
	return c_func(xal_register_sample_saver,{ext,saver,name,spl})
end function

public function al_register_audio_stream_loader(sequence name,atom load,atom count,atom samples)
	return c_func(xal_register_audio_stream_loader,{name,load,count,samples})
end function

export constant xal_register_sample_loader_f = define_c_func(aud,"+al_register_sample_loader_f",{C_STRING,C_POINTER,C_POINTER},C_BOOL),
				xal_register_sample_saver_f = define_c_func(aud,"+al_register_sample_saver_f",{C_STRING,C_POINTER,C_POINTER,C_POINTER},C_BOOL),
				xal_register_audio_stream_loader_f = define_c_func(aud,"+al_register_audio_stream_loader_f",{C_STRING,C_POINTER,C_POINTER,C_SIZE_T,C_UINT},C_BOOL)
				
public function al_register_sample_loader_f(sequence ext,atom load,atom fp)
	return c_func(xal_register_sample_loader_f,{ext,load,fp})
end function

public function al_register_sample_saver_f(sequence ext,atom saver,atom fp,atom spl)
	return c_func(xal_register_sample_saver_f,{ext,saver,fp,spl})
end function

public function al_register_audio_stream_loader_f(sequence ext,atom load,atom fp,atom count,atom samples)
	return c_func(xal_register_audio_stream_loader_f,{ext,load,fp,count,samples})
end function

export constant xal_load_sample = define_c_func(aud,"+al_load_sample",{C_STRING},C_POINTER),
				xal_save_sample = define_c_func(aud,"+al_save_sample",{C_STRING,C_POINTER},C_BOOL),
				xal_load_audio_stream = define_c_func(aud,"+al_load_audio_stream",{C_STRING,C_SIZE_T,C_UINT},C_POINTER)
				
public function al_load_sample(sequence name)
	return c_func(xal_load_sample,{name})
end function

public function al_save_sample(sequence name,atom spl)
	return c_func(xal_save_sample,{name,spl})
end function

public function al_load_audio_stream(sequence name,atom count,atom samp)
	return c_func(xal_load_audio_stream,{name,count,samp})
end function

export constant xal_load_sample_f = define_c_func(aud,"+al_load_sample_f",{C_POINTER,C_STRING},C_POINTER),
				xal_save_sample_f = define_c_func(aud,"+al_save_sample_f",{C_POINTER,C_STRING,C_POINTER},C_BOOL),
				xal_load_audio_stream_f = define_c_func(aud,"+al_load_audio_stream_f",{C_POINTER,C_STRING,C_SIZE_T,C_UINT},C_POINTER)
				
public function al_load_sample_f(atom fp,sequence id)
	return c_func(xal_load_sample_f,{fp,id})
end function

public function al_save_sample_f(atom fp,sequence id,atom spl)
	return c_func(xal_save_sample_f,{fp,id,spl})
end function

public function al_load_audio_stream_f(atom fp,sequence id,atom count,atom samp)
	return c_func(xal_load_audio_stream_f,{fp,id,count,samp})
end function

export constant xal_create_audio_recorder = define_c_func(aud,"+al_create_audio_recorder",{C_SIZE_T,C_UINT,C_UINT,C_INT,C_INT},C_POINTER),
				xal_start_audio_recorder = define_c_func(aud,"+al_start_audio_recorder",{C_POINTER},C_BOOL),
				xal_stop_audio_recorder = define_c_proc(aud,"+al_stop_audio_recorder",{C_POINTER}),
				xal_is_audio_recorder_recording = define_c_func(aud,"+al_is_audio_recorder_recording",{C_POINTER},C_BOOL),
				xal_get_audio_recorder_event_source = define_c_func(aud,"+al_get_audio_recorder_event_source",{C_POINTER},C_POINTER),
				xal_get_audio_recorder_event = define_c_func(aud,"+al_get_audio_recorder_event",{C_POINTER},C_POINTER),
				xal_destroy_audio_recorder = define_c_proc(aud,"+al_destroy_audio_recorder",{C_POINTER})
				
public function al_create_audio_recorder(atom count,atom samp,atom freq,ALLEGRO_AUDIO_DEPTH depth,ALLEGRO_CHANNEL_CONF conf)
	return c_func(xal_create_audio_recorder,{count,samp,freq,depth,conf})
end function

public function al_start_audio_recorder(atom r)
	return c_func(xal_start_audio_recorder,{r})
end function

public procedure al_stop_audio_recorder(atom r)
	c_proc(xal_stop_audio_recorder,{r})
end procedure

public function al_is_audio_recorder_recording(atom r)
	return c_func(xal_is_audio_recorder_recording,{r})
end function

public function al_get_audio_recorder_event_source(atom r)
	return c_func(xal_get_audio_recorder_event_source,{r})
end function

public function al_get_audio_recorder_event(atom evt)
	return c_func(xal_get_audio_recorder_event,{evt})
end function

public procedure al_destroy_audio_recorder(atom r)
	c_proc(xal_destroy_audio_recorder,{r})
end procedure
­5.18