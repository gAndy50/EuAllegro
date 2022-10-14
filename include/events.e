include std/ffi.e

include base.e
include altime.e

public enum ALLEGRO_EVENT_JOYSTICK_AXIS = 1,
  
 ALLEGRO_EVENT_JOYSTICK_BUTTON_DOWN        =  2,
  
  ALLEGRO_EVENT_JOYSTICK_BUTTON_UP          =  3,
  
   ALLEGRO_EVENT_JOYSTICK_CONFIGURATION      =  4,

 
     ALLEGRO_EVENT_KEY_DOWN                    = 10,
  
      ALLEGRO_EVENT_KEY_CHAR                    = 11,
  
       ALLEGRO_EVENT_KEY_UP                      = 12,

 
       ALLEGRO_EVENT_MOUSE_AXES                  = 20,
  
      ALLEGRO_EVENT_MOUSE_BUTTON_DOWN           = 21,
  
       ALLEGRO_EVENT_MOUSE_BUTTON_UP             = 22,
  
       ALLEGRO_EVENT_MOUSE_ENTER_DISPLAY         = 23,
  
       ALLEGRO_EVENT_MOUSE_LEAVE_DISPLAY         = 24,
  
        ALLEGRO_EVENT_MOUSE_WARPED                = 25,

 
         ALLEGRO_EVENT_TIMER                       = 30,

 
             ALLEGRO_EVENT_DISPLAY_EXPOSE              = 40,
  
            ALLEGRO_EVENT_DISPLAY_RESIZE              = 41,
  
           ALLEGRO_EVENT_DISPLAY_CLOSE               = 42,
  
         ALLEGRO_EVENT_DISPLAY_LOST                = 43,
  
            ALLEGRO_EVENT_DISPLAY_FOUND               = 44,
  
           ALLEGRO_EVENT_DISPLAY_SWITCH_IN           = 45,
  
               ALLEGRO_EVENT_DISPLAY_SWITCH_OUT          = 46,
  
         ALLEGRO_EVENT_DISPLAY_ORIENTATION         = 47,
  
               ALLEGRO_EVENT_DISPLAY_HALT_DRAWING        = 48,
  
            ALLEGRO_EVENT_DISPLAY_RESUME_DRAWING      = 49,

 
           ALLEGRO_EVENT_TOUCH_BEGIN                 = 50,
  
         ALLEGRO_EVENT_TOUCH_END                   = 51,
  
          ALLEGRO_EVENT_TOUCH_MOVE                  = 52,
  
          ALLEGRO_EVENT_TOUCH_CANCEL                = 53,
   
 
          ALLEGRO_EVENT_DISPLAY_CONNECTED           = 60,
  
              ALLEGRO_EVENT_DISPLAY_DISCONNECTED        = 61
              
public constant ALLEGRO_EVENT_SOUCE = define_c_type({
	{C_INT,32}
})

public constant ALLEGRO_DISPLAY_EVENT = define_c_type({
	C_POINTER, --struct AL_EVENT_HEADER
	C_INT, --x
	C_INT, --y
	C_INT, --width
	C_INT, --height
	C_INT --orientation
})

public constant ALLEGRO_JOYSTICK_EVENT = define_c_type({
	C_POINTER, --struct
	C_POINTER, --struct id
	C_INT, --stick
	C_INT, --axis
	C_FLOAT, --pos
	C_INT --button
})

public constant ALLEGRO_KEYBOARD_EVENT = define_c_type({
	C_POINTER, --struct header
	ALLEGRO_DISPLAY_EVENT, --display event struct
	C_INT, --keycode
	C_INT, --unichar
	C_UINT, --modifiers
	C_BOOL --repeat
})

public constant ALLEGRO_MOUSE_EVENT = define_c_type({
	C_POINTER, --struct header
	C_POINTER, --struct display
	C_INT, --x
	C_INT, --y
	C_INT, --z
	C_INT, --w
	C_UINT, --button
	C_FLOAT --pressure
})

public constant ALLEGRO_TIMER_EVENT = define_c_type({
	C_POINTER, --event header
	C_LONG, --count
	C_DOUBLE --error
})

public constant ALLEGRO_TOUCH_EVENT = define_c_type({
	C_POINTER, --event header
	C_POINTER, --display struct
	C_INT, --id
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --dx
	C_FLOAT, --dy
	C_BOOL --primary
})

public constant ALLEGRO_USER_EVENT = define_c_type({
	C_POINTER, --header struct
	C_POINTER, --user event struct
	C_POINTER, --data1
	C_POINTER, --data2
	C_POINTER, --data3
	C_POINTER -- data4
})

public constant ALLEGRO_EVENT = define_c_type({
	C_INT, --event type (from enum)
	C_POINTER, --any event
	ALLEGRO_DISPLAY_EVENT,
	ALLEGRO_JOYSTICK_EVENT,
	ALLEGRO_KEYBOARD_EVENT,
	ALLEGRO_MOUSE_EVENT,
	ALLEGRO_TIMER_EVENT,
	ALLEGRO_TOUCH_EVENT,
	ALLEGRO_USER_EVENT
})


export constant xal_init_user_event_source = define_c_proc(all,"+al_init_user_event_source",{C_POINTER}),
				xal_destroy_user_event_source = define_c_proc(all,"+al_destroy_user_event_source",{C_POINTER})
				
public procedure al_init_user_event_source(sequence src)
	c_proc(xal_init_user_event_source,{src})
end procedure

public procedure al_destroy_user_event_source(sequence src)
	c_proc(xal_destroy_user_event_source,{src})
end procedure


export constant xal_emit_user_event = define_c_func(all,"+al_emit_user_event",{C_POINTER,ALLEGRO_EVENT,C_POINTER},C_BOOL),
				xal_unref_user_event = define_c_proc(all,"+al_unref_user_event",{ALLEGRO_USER_EVENT}),
				xal_set_event_source_data = define_c_proc(all,"+al_set_event_source_data",{C_POINTER,C_LONG}),
				xal_get_event_source_data = define_c_func(all,"+al_get_event_source_data",{C_POINTER},C_LONG)
				
public function al_emit_user_event(sequence src,sequence event)
	return c_func(xal_emit_user_event,{src,event})
end function

public procedure al_unref_user_event(sequence evt)
	c_proc(xal_unref_user_event,{evt})
end procedure

public procedure al_set_event_source_data(sequence evt,atom data)
	c_proc(xal_set_event_source_data,{evt,data})
end procedure

public function al_get_event_source_data(sequence evt)
	return c_func(xal_get_event_source_data,{evt})
end function


export constant xal_create_event_queue = define_c_func(all,"+al_create_event_queue",{},C_POINTER),
				xal_destroy_event_queue = define_c_proc(all,"+al_destroy_event_queue",{C_POINTER}),
				xal_is_event_source_registered = define_c_func(all,"+al_is_event_source_registered",{C_POINTER,C_POINTER},C_BOOL),
				xal_register_event_source = define_c_proc(all,"+al_register_event_source",{C_POINTER,C_POINTER}),
				xal_unregister_event_source = define_c_proc(all,"+al_unregister_event_source",{C_POINTER,C_POINTER}),
				xal_pause_event_queue = define_c_proc(all,"+al_pause_event_queue",{C_POINTER,C_BOOL}),
				xal_is_event_queue_paused = define_c_func(all,"+al_is_event_queue_paused",{C_POINTER},C_BOOL),
				xal_is_event_queue_empty = define_c_func(all,"+al_is_event_queue_empty",{C_POINTER},C_BOOL),
				xal_get_next_event = define_c_func(all,"+al_get_next_event",{C_POINTER,C_POINTER},C_BOOL),
				xal_peek_next_event = define_c_func(all,"+al_peek_next_event",{C_POINTER,C_POINTER},C_BOOL),
				xal_drop_next_event = define_c_func(all,"+al_drop_next_event",{C_POINTER},C_BOOL),
				xal_flush_event_queue = define_c_proc(all,"+al_flush_event_queue",{C_POINTER}),
				xal_wait_for_event = define_c_proc(all,"+al_wait_for_event",{C_POINTER,C_POINTER}),
				xal_wait_for_event_timed = define_c_func(all,"+al_wait_for_event_timed",{C_POINTER,C_POINTER,C_FLOAT},C_BOOL),
				xal_wait_for_event_until = define_c_func(all,"+al_wait_for_event_until",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)
				
public function al_create_event_queue()
	return c_func(xal_create_event_queue,{})
end function

public procedure al_destroy_event_queue(sequence que)
	c_proc(xal_destroy_event_queue,{que})
end procedure

public function al_is_event_source_registered(sequence que,sequence evt)
	return c_func(xal_is_event_source_registered,{que,evt})
end function

public procedure al_register_event_source(sequence que,sequence src)
	c_proc(xal_register_event_source,{que,src})
end procedure

public procedure al_unregister_event_source(sequence que,sequence src)
	c_proc(xal_unregister_event_source,{que,src})
end procedure

public procedure al_pause_event_queue(sequence que,atom x)
	c_proc(xal_pause_event_queue,{que,x})
end procedure

public function al_is_event_queue_paused(sequence que)
	return c_func(xal_is_event_queue_paused,{que})
end function

public function al_is_event_queue_empty(sequence que)
	return c_func(xal_is_event_queue_empty,{que})
end function

public function al_get_next_event(sequence que,sequence ret)
	return c_func(xal_get_next_event,{que,ret})
end function

public function al_peek_next_event(sequence que,sequence ret)
	return c_func(xal_peek_next_event,{que,ret})
end function

public function al_drop_next_event(sequence que)
	return c_func(xal_drop_next_event,{que})
end function

public procedure al_flush_event_queue(sequence que)
	c_proc(xal_flush_event_queue,{que})
end procedure

public procedure al_wait_for_event(sequence que,sequence ret)
	c_proc(xal_wait_for_event,{que,ret})
end procedure

public function al_wait_for_event_timed(sequence que,sequence ret,atom secs)
	return c_func(xal_wait_for_event_timed,{que,ret,secs})
end function

public function al_wait_for_event_until(sequence que,sequence ret,atom timeout)
	return c_func(xal_wait_for_event_until,{que,ret,timeout})
end function
­226.12