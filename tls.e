include std/ffi.e

include base.e

public constant ALLEGRO_STATE_NEW_DISPLAY_PARAMETERS = 0x0001,
				ALLEGRO_STATE_NEW_BITMAP_PARAMETERS = 0x0002,
				ALLEGRO_STATE_DISPLAY = 0x0004,
				ALLEGRO_STATE_TARGET_BITMAP = 0x0008,
				ALLEGRO_STATE_BLENDER = 0x0010,
				ALLEGRO_STATE_NEW_FILE_INTERFACE = 0x0020,
				ALLEGRO_STATE_TRANSFORM = 0x0040,
				ALLEGRO_STATE_PROJECTION_TRANSFORM = 0x0100,
				ALLEGRO_STATE_BITMAP = ALLEGRO_STATE_TARGET_BITMAP + ALLEGRO_STATE_NEW_BITMAP_PARAMETERS,
				ALLEGRO_STATE_ALL = 0xffff
				
public constant ALLEGRO_STATE = define_c_type({
	{C_CHAR,1024}
})

export constant xal_store_state = define_c_proc(all,"+al_store_state",{ALLEGRO_STATE,C_INT}),
				xal_restore_state = define_c_proc(all,"+al_restore_state",{ALLEGRO_STATE})
				
public procedure al_store_state(sequence state,atom flags)
	c_proc(xal_store_state,{state,flags})
end procedure

public procedure al_restore_state(sequence state)
	c_proc(xal_restore_state,{state})
end procedure

--For testing hex values				
--printf(1,"%d",{ALLEGRO_STATE_ALL})
­28.34