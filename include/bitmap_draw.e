include std/ffi.e

include base.e
include bitmap.e
include color.e

public enum ALLEGRO_FLIP_HORIZONTAL = 0x00001,
			ALLEGRO_FLIP_VERTICAL = 0x00002
			
export constant xal_draw_bitmap = define_c_proc(all,"+al_draw_bitmap",{ALLEGRO_BITMAP,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_bitmap_region = define_c_proc(all,"+al_draw_bitmap_region",{ALLEGRO_BITMAP,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_scaled_bitmap = define_c_proc(all,"+al_draw_scaled_bitmap",{ALLEGRO_BITMAP,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_rotated_bitmap = define_c_proc(all,"+al_draw_rotated_bitmap",{ALLEGRO_BITMAP,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_scaled_rotated_bitmap = define_c_proc(all,"+al_draw_scaled_rotated_bitmap",{ALLEGRO_BITMAP,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT})

public procedure al_draw_bitmap(atom bitmap,atom dx,atom dy,atom flags)
	c_proc(xal_draw_bitmap,{bitmap,dx,dy,flags})
end procedure

public procedure al_draw_bitmap_region(atom bitmap,atom sx,atom sy,atom sw,atom sh,atom dx,atom dy,atom flags)
	c_proc(xal_draw_bitmap_region,{bitmap,sx,sy,sw,sh,dx,dy,flags})
end procedure

public procedure al_draw_scaled_bitmap(atom bitmap,atom sx,atom sy,atom sw,atom sh,atom dx,atom dy,atom dw,atom dh,atom flags)
	c_proc(xal_draw_scaled_bitmap,{bitmap,sx,sy,sw,sh,dx,dy,dw,dh,flags})
end procedure

public procedure al_draw_rotated_bitmap(atom bitmap,atom cx,atom cy,atom dx,atom dy,atom angle,atom flags)
	c_proc(xal_draw_rotated_bitmap,{bitmap,cx,cy,dx,dy,angle,flags})
end procedure

public procedure al_draw_scaled_rotated_bitmap(atom bitmap,atom cx,atom cy,atom dx,atom dy,atom xscale,atom yscale,atom angle,atom flags)
	c_proc(xal_draw_scaled_rotated_bitmap,{bitmap,cx,cy,dx,dy,xscale,yscale,angle,flags})
end procedure


export constant xal_draw_tinted_bitmap = define_c_proc(all,"+al_draw_tinted_bitmap",{ALLEGRO_BITMAP,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_tinted_bitmap_region = define_c_proc(all,"+al_draw_tinted_bitmap_region",{ALLEGRO_BITMAP,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_tinted_scaled_bitmap = define_c_proc(all,"+al_draw_tinted_scaled_bitmap",{ALLEGRO_BITMAP,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_tinted_rotated_bitmap = define_c_proc(all,"+al_draw_tinted_rotated_bitmap",{ALLEGRO_BITMAP,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_tinted_scaled_rotated_bitmap = define_c_proc(all,"+al_draw_tinted_scaled_rotated_bitmap",{ALLEGRO_BITMAP,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_tinted_scaled_rotated_bitmap_region = define_c_proc(all,"+al_draw_tinted_scaled_rotated_bitmap_region",{ALLEGRO_BITMAP,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT})
				
public procedure al_draw_tinted_bitmap(atom bitmap,sequence tint,atom dx,atom dy,atom flags)
	c_proc(xal_draw_tinted_bitmap,{bitmap,tint,dx,dy,flags})
end procedure

public procedure al_draw_tinted_bitmap_region(atom bitmap,sequence tint,atom sx,atom sy,atom sw,atom sh,atom dx,atom dy,atom flags)
	c_proc(xal_draw_tinted_bitmap_region,{bitmap,tint,sx,sy,sw,sh,dx,dy,flags})
end procedure

public procedure al_draw_tinted_scaled_bitmap(atom bitmap,sequence tint,atom sx,atom sy,atom sw,atom sh,atom dx,atom dy,atom dw,atom dh,atom flags)
	c_proc(xal_draw_tinted_scaled_bitmap,{bitmap,tint,sx,sy,sw,sh,dx,dy,dw,dh,flags})
end procedure

public procedure al_draw_tinted_rotated_bitmap(atom bitmap,sequence tint,atom cx,atom cy,atom dx,atom dy,atom angle,atom flags)
	c_proc(xal_draw_tinted_rotated_bitmap,{bitmap,tint,cx,cy,dx,dy,angle,flags})
end procedure

public procedure al_draw_tinted_scaled_rotated_bitmap(atom bitmap,sequence tint,atom cx,atom cy,atom dx,atom dy,atom xscale,atom yscale,atom angle,atom flags)
	c_proc(xal_draw_tinted_scaled_rotated_bitmap,{bitmap,tint,cx,cy,dx,dy,xscale,yscale,angle,flags})
end procedure

public procedure al_draw_tinted_scaled_rotated_bitmap_region(atom bitmap,atom sx,atom sy,atom sw,atom sh,sequence tint,atom cx,atom cy,atom dx,atom dy,atom xscale,atom yscale,atom angle,atom flags)
	c_proc(xal_draw_tinted_scaled_rotated_bitmap_region,{bitmap,sx,sy,sw,sh,tint,cx,cy,dx,dy,xscale,yscale,angle,flags})
end procedure
­65.117