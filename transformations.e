include std/ffi.e

include base.e
include display.e

public constant ALLEGRO_TRANSFORM = define_c_type({
	{C_FLOAT,4,4}
})


export constant xal_use_transform = define_c_proc(all,"+al_use_transform",{ALLEGRO_TRANSFORM}),
				xal_use_projection_transform = define_c_proc(all,"+al_use_projection_transform",{ALLEGRO_TRANSFORM}),
				xal_copy_transform = define_c_proc(all,"+al_copy_transform",{ALLEGRO_TRANSFORM,ALLEGRO_TRANSFORM}),
				xal_identity_transform = define_c_proc(all,"+al_identity_transform",{ALLEGRO_TRANSFORM}),
				xal_build_transform = define_c_proc(all,"+al_build_transform",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT}),
				xal_build_camera_transform = define_c_proc(all,"+al_build_camera_transform",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT}),
				xal_translate_transform = define_c_proc(all,"+al_translate_transform",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT}),
				xal_translate_transform_3d = define_c_proc(all,"+al_translate_transform_3d",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT,C_FLOAT}),
				xal_rotate_transform = define_c_proc(all,"+al_rotate_transform",{ALLEGRO_TRANSFORM,C_FLOAT}),
				xal_rotate_transform_3d = define_c_proc(all,"+al_rotate_transform_3d",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT}),
				xal_scale_transform = define_c_proc(all,"+al_scale_transform",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT}),
				xal_scale_transform_3d = define_c_proc(all,"+al_scale_transform_3d",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT,C_FLOAT}),
				xal_transform_coordinates = define_c_proc(all,"+al_transform_coordinates",{ALLEGRO_TRANSFORM,C_POINTER,C_POINTER}),
				xal_transform_coordinates_3d = define_c_proc(all,"+al_transform_coordinates_3d",{ALLEGRO_TRANSFORM,C_POINTER,C_POINTER,C_POINTER}),
				xal_transform_coordinates_4d = define_c_proc(all,"+al_transform_coordinates_4d",{ALLEGRO_TRANSFORM,C_POINTER,C_POINTER,C_POINTER,C_POINTER}),
				xal_transform_coordinates_3d_projective = define_c_proc(all,"+al_transform_coordinates_3d_projective",{ALLEGRO_TRANSFORM,C_POINTER,C_POINTER,C_POINTER}),
				xal_compose_transform = define_c_proc(all,"+al_compose_transform",{ALLEGRO_TRANSFORM,ALLEGRO_TRANSFORM}),
				xal_get_current_transform = define_c_func(all,"+al_get_current_transform",{},ALLEGRO_TRANSFORM),
				xal_get_current_inverse_transform = define_c_func(all,"+al_get_current_inverse_transform",{},ALLEGRO_TRANSFORM),
				xal_get_current_projection_transform = define_c_func(all,"+al_get_current_projection_transform",{},ALLEGRO_TRANSFORM),
				xal_invert_transform = define_c_proc(all,"+al_invert_transform",{ALLEGRO_TRANSFORM}),
				xal_transpose_transform = define_c_proc(all,"+al_transpose_transform",{ALLEGRO_TRANSFORM}),
				xal_check_inverse = define_c_func(all,"+al_check_inverse",{ALLEGRO_TRANSFORM,C_FLOAT},C_INT),
				xal_orthographic_transform = define_c_proc(all,"+al_orthographic_transform",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT}),
				xal_perspective_transform = define_c_proc(all,"+al_perspective_transform",{ALLEGRO_TRANSFORM,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT}),
				xal_horizontal_shear_transform = define_c_proc(all,"+al_horizontal_shear_transform",{ALLEGRO_TRANSFORM,C_FLOAT}),
				xal_vertical_shear_transform = define_c_proc(all,"+al_vertical_shear_transform",{ALLEGRO_TRANSFORM,C_FLOAT})
				
public procedure al_use_transform(sequence trans)
	c_proc(xal_use_transform,{trans})
end procedure

public procedure al_use_projection_transform(sequence trans)
	c_proc(xal_use_projection_transform,{trans})
end procedure

public procedure al_copy_transform(sequence dest,sequence src)
	c_proc(xal_copy_transform,{dest,src})
end procedure

public procedure al_identity_transform(sequence trans)
	c_proc(xal_identity_transform,{trans})
end procedure

public procedure al_build_transform(sequence trans,atom x,atom y,atom sx,atom sy,atom theta)
	c_proc(xal_build_transform,{trans,x,y,sx,sy,theta})
end procedure

public procedure al_build_camera_transform(sequence trans,atom pos_x,atom pos_y,atom pos_z,atom look_x,atom look_y,atom look_z,atom up_x,atom up_y,atom up_z)
	c_proc(xal_build_camera_transform,{trans,pos_x,pos_y,pos_z,look_x,look_y,look_z,up_x,up_y,up_z})
end procedure

public procedure al_translate_transform(sequence trans,atom x,atom y)
	c_proc(xal_translate_transform,{trans,x,y})
end procedure

public procedure al_translate_transform_3d(sequence trans,atom x,atom y,atom z)
	c_proc(xal_translate_transform_3d,{trans,x,y,z})
end procedure

public procedure al_rotate_transform(sequence trans,atom theta)
	c_proc(xal_rotate_transform,{trans,theta})
end procedure

public procedure al_rotate_transform_3d(sequence trans,atom x,atom y,atom z,atom ang)
	c_proc(xal_rotate_transform_3d,{trans,x,y,z,ang})
end procedure

public procedure al_scale_transform(sequence trans,atom sx,atom sy)
	c_proc(xal_scale_transform,{trans,sx,sy})
end procedure

public procedure al_scale_transform_3d(sequence trans,atom sx,atom sy,atom sz)
	c_proc(xal_scale_transform_3d,{trans,sx,sy,sz})
end procedure

public procedure al_transform_coordinates_3d(sequence trans,atom x,atom y,atom z)
	c_proc(xal_transform_coordinates_3d,{trans,x,y,z})
end procedure

public procedure al_transform_coordinates_4d(sequence trans,atom x,atom y,atom z,atom w)
	c_proc(xal_transform_coordinates_4d,{trans,x,y,z,w})
end procedure

public procedure al_transform_coordinates_3d_projective(sequence trans,atom x,atom y,atom z)
	c_proc(xal_transform_coordinates_3d_projective,{trans,x,y,z})
end procedure

public procedure al_compose_transform(sequence trans,sequence other)
	c_proc(xal_compose_transform,{trans,other})
end procedure

public function al_get_current_transform()
	return c_func(xal_get_current_transform,{})
end function

public function al_get_current_inverse_transform()
	return c_func(xal_get_current_inverse_transform,{})
end function

public function al_get_current_projection_transform()
	return c_func(xal_get_current_projection_transform,{})
end function

public procedure al_invert_transform(sequence trans)
	c_proc(xal_invert_transform,{trans})
end procedure

public function al_check_inverse(sequence trans,atom tol)
	return c_func(xal_check_inverse,{trans,tol})
end function

public procedure al_orthographic_transform(sequence trans,atom left,atom top,atom n,atom right,atom bottom,atom f)
	c_proc(xal_orthographic_transform,{trans,left,top,n,right,bottom,f})
end procedure

public procedure al_perspective_transform(sequence trans,atom left,atom top,atom n,atom right,atom bottom,atom f)
	c_proc(xal_perspective_transform,{trans,left,top,n,right,bottom,f})
end procedure

public procedure al_horizontal_shear_transform(sequence trans,atom theta)
	c_proc(xal_horizontal_shear_transform,{trans,theta})
end procedure

public procedure al_vertical_shear_transform(sequence trans,atom theta)
	c_proc(xal_vertical_shear_transform,{trans,theta})
end procedure
­34.61