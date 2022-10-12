include std/ffi.e

include base.e
include color.e

export constant xal_clear_to_color = define_c_proc(all,"+al_clear_to_Color",{ALLEGRO_COLOR}),
				xal_clear_depth_buffer = define_c_proc(all,"+al_clear_dpeth_buffer",{C_FLOAT}),
				xal_draw_pixel = define_c_proc(all,"+al_draw_pixel",{C_FLOAT,C_FLOAT,ALLEGRO_COLOR})
				
public procedure al_clear_to_color(sequence col)
	c_proc(xal_clear_to_color,{col})
end procedure

public procedure al_clear_depth_buffer(atom x)
	c_proc(xal_clear_depth_buffer,{x})
end procedure

public procedure al_draw_pixel(atom x,atom y,sequence col)
	c_proc(xal_draw_pixel,{x,y,col})
end procedure
­19.33