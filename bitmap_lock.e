include std/ffi.e

include base.e
include bitmap.e

public enum ALLEGRO_LOCK_READWIRTE = 0,
			ALLEGRO_LOCK_READONLY,
			ALLEGRO_LOCK_WRITEONLY
			
public constant ALLEGRO_LOCKED_REGION = define_c_type({
		C_POINTER, --data
		C_INT, --format
		C_INT, --pitch
		C_INT --pixel_size
})


export constant xal_lock_bitmap = define_c_func(all,"+al_lock_bitamp",{ALLEGRO_BITMAP,C_INT,C_INT},ALLEGRO_LOCKED_REGION),
				xal_lock_bitmap_region = define_c_func(all,"+al_lock_bitmap_region",{ALLEGRO_BITMAP,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT},ALLEGRO_LOCKED_REGION),
				xal_lock_bitmap_blocked = define_c_func(all,"+al_lock_bitmap_blocked",{ALLEGRO_BITMAP,C_INT},ALLEGRO_LOCKED_REGION),
				xal_lock_bitmap_region_blocked = define_c_func(all,"+al_lock_bitmap_region_blocked",{ALLEGRO_BITMAP,C_INT,C_INT,C_INT,C_INT,C_INT},ALLEGRO_LOCKED_REGION),
				xal_unlock_bitmap = define_c_proc(all,"+al_unlock_bitmap",{ALLEGRO_BITMAP}),
				xal_is_bitmap_locked = define_c_func(all,"+al_is_bitmap_locked",{ALLEGRO_BITMAP},C_BOOL)
				
public function al_lock_bitmap(atom bitmap,atom format,atom flags)
	return c_func(xal_lock_bitmap,{bitmap,format,flags})
end function

public function al_lock_bitmap_region(atom bitmap,atom x,atom y,atom width,atom height,atom format,atom flags)
	return c_func(xal_lock_bitmap_region,{bitmap,x,y,width,height,format,flags})
end function

public function al_lock_bitmap_blocked(atom bitmap,atom flags)
	return c_func(xal_lock_bitmap_blocked,{bitmap,flags})
end function

public function al_lock_bitmap_region_blocked(atom bitmap,atom x_block,atom y_block,atom width_block,atom height_block,atom flags)
	return c_func(xal_lock_bitmap_region_blocked,{bitmap,x_block,y_block,width_block,height_block,flags})
end function

public procedure al_unlock_bitmap(atom bitmap)
	c_proc(xal_unlock_bitmap,{bitmap})
end procedure

public function al_is_bitmap_locked(atom bitmap)
	return c_func(xal_is_bitmap_locked,{bitmap})
end function
­23.44