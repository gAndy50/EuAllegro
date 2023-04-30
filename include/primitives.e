--Allegro Primitives
--Euphoria Port by: Andy P.

include std/ffi.e

include allegro.e


public enum type ALLEGRO_PRIM_TYPE
	ALLEGRO_PRIM_LINE_LIST = 0,
	ALLEGRO_PRIM_LINE_STRIP,
	ALLEGRO_PRIM_LINE_LOOP,
	ALLEGRO_PRIM_TRIANGLE_LIST,
	ALLEGRO_PRIM_TRIANGLE_STRIP,
	ALLEGRO_PRIM_TRIANGLE_FAN,
	ALLEGRO_PRIM_POINT_LIST,
	ALLEGRO_PRIM_NUM_TYPES
end type

--public constant ALLEGRO_PRIM_MAX_USER_ATTR = ALLEGRO_PRIM_MAX_USER_ATTR

public enum type ALLEGRO_PRIM_ATTR
	ALLEGRO_PRIM_POSITION = 1,
	ALLEGRO_PRIM_COLOR_ATTR,
	ALLEGRO_PRIM_TEX_COORD,
	ALLEGRO_PRIM_TEX_COORD_PIXEL,
	ALLEGRO_PRIM_USER_ATTR,
	ALLEGRO_PRIM_ATTR_NUM
end type

public enum type ALLEGRO_PRIM_STORAGE
	ALLEGRO_PRIM_FLOAT_2 = 0,
	ALLEGRO_PRIM_FLOAT_3,
	ALLEGRO_PRIM_SHORT_2,
	ALLEGRO_PRIM_FLOAT_1,
	ALLEGRO_PRIM_FLOAT_4,
	ALLEGRO_PRIM_UBYTE_4,
	ALLEGRO_PRIM_SHORT_4,
	ALLEGRO_PRIM_NORMALIZED_UBYTE_4,
	ALLEGRO_PRIM_NORMALIZED_SHORT_2,
	ALLEGRO_PRIM_NORMALIZED_SHORT_4,
	ALLEGRO_PRIM_NORMALIZED_USHORT_2,
	ALLEGRO_PRIM_NORMALIZED_USHORT_4,
	ALLEGRO_PRIM_HALF_FLOAT_2,
	ALLEGRO_PRIM_HALF_FLOAT_4
end type

public enum type ALLEGRO_LINE_JOIN
	ALLEGRO_LINE_JOIN_NONE = 0,
	ALLEGRO_LINE_JOIN_BEVEL,
	ALLEGRO_LINE_JOIN_ROUND,
	ALLEGRO_LINE_JOIN_MITER,
	ALLEGRO_LINE_JOIN_MITRE = ALLEGRO_LINE_JOIN_MITER
end type

public enum type ALLEGRO_LINE_CAP
	ALLEGRO_LINE_CAP_NONE = 0,
	ALLEGRO_LINE_CAP_SQUARE,
	ALLEGRO_LINE_CAP_ROUND,
	ALLEGRO_LINE_CAP_TRIANGLE,
	ALLEGRO_LINE_CAP_CLOSED
end type

public enum type ALLEGRO_PRIM_BUFFER_FLAGS
	ALLEGRO_PRIM_BUFFER_STREAM = 1,
	ALLEGRO_PRIM_BUFFER_STATIC = 2,
	ALLEGRO_PRIM_BUFFER_DYNAMIC = 4,
	ALLEGRO_PRIME_BUFFER_READWRITE = 8
end type

public constant ALLEGRO_VERTEX_CACHE_SIZE = 256

public constant ALLEGRO_PRIM_QUALITY = 10

public constant ALLEGRO_VERTEX_ELEMENT = define_c_struct({
	C_INT, --attribute
	C_INT, --storage
	C_INT --offset
})

public constant ALLEGRO_VERTEX = define_c_struct({
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --z
	C_FLOAT, --u
	C_FLOAT, --v
	ALLEGRO_COLOR --color
})

export constant prim = open_dll("allegro_primitives-5.2.dll"),

				xal_get_allegro_primitives_version = define_c_func(prim,"+al_get_allegro_primitives_version",{},C_UINT)
				
public function al_get_allegro_primitives_version()
	return c_func(xal_get_allegro_primitives_version,{})
end function

if prim = -1 then
	puts(1,"Failed to open allegro_primitives!\n")
	abort(0)
end if

export constant xal_init_primitives_addon = define_c_func(prim,"+al_init_primitives_addon",{},C_BOOL),
				xal_is_primitives_addon_initialized = define_c_func(prim,"+al_is_primitives_addon_initialized",{},C_BOOL),
				xal_shutdown_primitives_addon = define_c_proc(prim,"+al_shutdown_primitives_addon",{}),
				xal_draw_prim = define_c_func(prim,"+al_draw_prim",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_INT,C_INT},C_INT),
				xal_draw_indexed_prim = define_c_func(prim,"+al_draw_indexed_prim",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_INT,C_INT},C_INT),
				xal_draw_vertex_buffer = define_c_func(prim,"+al_draw_vertex_buffer",{C_POINTER,C_POINTER,C_INT,C_INT,C_INT},C_INT),
				xal_draw_indexed_buffer = define_c_func(prim,"+al_draw_indexed_buffer",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_INT,C_INT},C_INT)
				
public function al_init_primitives_addon()
 return c_func(xal_init_primitives_addon,{})
end function

public function al_is_primitives_addon_initialized()
	return c_func(xal_is_primitives_addon_initialized,{})
end function

public procedure al_shutdown_primitives_addon()
	c_proc(xal_shutdown_primitives_addon,{})
end procedure

public function al_draw_prim(atom vtx,atom decl,sequence tex,atom start,atom xend,atom xtype)
	return c_func(xal_draw_prim,{vtx,decl,tex,start,xend,xtype})
end function

public function al_draw_indexed_prim(atom vtx,atom decl,sequence tex,atom indice,atom num,atom xtype)
	return c_func(xal_draw_indexed_prim,{vtx,decl,tex,indice,num,xtype})
end function

public function al_draw_vertex_buffer(atom buffer,sequence tex,atom start,atom xend,atom xtype)
	return c_func(xal_draw_vertex_buffer,{buffer,tex,start,xend,xtype})
end function

public function al_draw_indexed_buffer(atom buffer,sequence tex,atom index,atom start,atom xend,atom xtype)
	return c_func(xal_draw_indexed_buffer,{buffer,tex,index,start,xend,xtype})
end function


export constant xal_create_vertex_decl = define_c_func(prim,"+al_create_vertex_decl",{ALLEGRO_VERTEX_ELEMENT,C_INT},C_POINTER),
				xal_destroy_vertex_decl = define_c_proc(prim,"+al_destroy_vertex_decl",{C_POINTER})
				
public function al_create_vertex_decl(sequence elements,atom stride)
	return c_func(xal_create_vertex_decl,{elements,stride})
end function

public procedure al_destroy_vertex_decl(atom decl)
	c_proc(xal_destroy_vertex_decl,{decl})
end procedure


export constant xal_create_vertex_buffer = define_c_func(prim,"+al_create_vertex_buffer",{C_POINTER,C_POINTER,C_INT,C_INT},C_POINTER),
				xal_destroy_vertex_buffer = define_c_proc(prim,"+al_destroy_vertex_buffer",{C_POINTER}),
				xal_lock_vertex_buffer = define_c_func(prim,"+al_lock_vertex_buffer",{C_POINTER,C_INT,C_INT,C_INT},C_POINTER),
				xal_unlock_index_buffer = define_c_proc(prim,"+al_unlock_index_buffer",{C_POINTER}),
				xal_get_index_buffer_size = define_c_func(prim,"+al_get_index_buffer_size",{C_POINTER},C_INT)
				
public function al_create_vertex_buffer(atom size,atom data,atom num,atom flags)
	return c_func(xal_create_vertex_buffer,{size,data,num,flags})
end function

public procedure al_destroy_vertex_buffer(atom buff)
	c_proc(xal_destroy_vertex_buffer,{buff})
end procedure

public function al_lock_vertex_buffer(atom buff,atom offset,atom len,atom flags)
	return c_func(xal_lock_vertex_buffer,{buff,offset,len,flags})
end function

public procedure al_unlock_index_buffer(atom buff)
	c_proc(xal_unlock_index_buffer,{buff})
end procedure

public function al_get_index_buffer_size(atom buff)
	return c_func(xal_get_index_buffer_size,{buff})
end function


export constant xal_draw_line = define_c_proc(prim,"+al_draw_line",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT}),
				xal_draw_triangle = define_c_proc(prim,"+al_draw_triangle",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT}),
				xal_draw_rectangle = define_c_proc(prim,"+al_draw_rectangle",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT}),
				xal_draw_rounded_rectangle = define_c_proc(prim,"+al_draw_rounded_rectangle",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT})
				
public procedure al_draw_line(atom x,atom y,atom x2,atom y2,sequence col,atom thick)
	c_proc(xal_draw_line,{x,y,x2,y2,col,thick})
end procedure

public procedure al_draw_triangle(atom x,atom y,atom x2,atom y2,atom x3,atom y3,sequence col,atom thick)
	c_proc(xal_draw_triangle,{x,y,x2,y2,x3,y3,col,thick})
end procedure

public procedure al_draw_rectangle(atom x,atom y,atom x2,atom y2,sequence col,atom thick)
	c_proc(xal_draw_rectangle,{x,y,x2,y2,col,thick})
end procedure

public procedure al_draw_rounded_rectangle(atom x,atom y,atom x2,atom y2,atom rx,atom ry,sequence col,atom thick)
	c_proc(xal_draw_rounded_rectangle,{x,y,x2,y2,rx,ry,col,thick})
end procedure


export constant xal_calculate_arc = define_c_proc(prim,"+al_calculate_arc",{C_POINTER,C_INT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT}),
				xal_draw_circle = define_c_proc(prim,"+al_draw_circle",{C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT}),
				xal_draw_ellipse = define_c_proc(prim,"+al_draw_ellipse",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT}),
				xal_draw_arc = define_c_proc(prim,"+al_draw_arc",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT}),
				xal_draw_ellipitcal_arc = define_c_proc(prim,"+al_draw_ellipitcal_arc",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT}),
				xal_draw_pieslice = define_c_proc(prim,"+al_draw_pieslice",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR,C_FLOAT})
				
public procedure al_calculate_arc(atom dest,atom stride,atom cx,atom cy,atom rx,atom ry,atom start,atom theta,atom thick,atom num)
	c_proc(xal_calculate_arc,{dest,stride,cx,cy,rx,ry,start,theta,thick,num})
end procedure

public procedure al_draw_circle(atom cx,atom cy,atom r,sequence col,atom thick)
	c_proc(xal_draw_circle,{cx,cy,r,col,thick})
end procedure

public procedure al_draw_ellipse(atom cx,atom cy,atom rx,atom ry,sequence col,atom thick)
	c_proc(xal_draw_ellipse,{cx,cy,rx,ry,col,thick})
end procedure

public procedure al_draw_arc(atom cx,atom cy,atom r,atom start,atom theta,sequence col,atom thick)
	c_proc(xal_draw_arc,{cx,cy,r,start,theta,col,thick})
end procedure

public procedure al_draw_ellipitcal_arc(atom cx,atom cy,atom rx,atom ry,atom start,atom theta,sequence col,atom thick)
	c_proc(xal_draw_ellipitcal_arc,{cx,cy,rx,ry,start,theta,col,thick})
end procedure

public procedure al_draw_pieslice(atom cx,atom cy,atom r,atom start,atom theta,sequence col,atom thick)
	c_proc(xal_draw_pieslice,{cx,cy,r,start,theta,col,thick})
end procedure

--for points variable array of [8]
public constant C_POINTS = define_c_struct({
	{C_FLOAT,8}
})


export constant xal_calculate_spline = define_c_proc(prim,"+al_calculate_spline",{C_POINTER,C_INT,C_POINTS,C_FLOAT,C_INT}),
				xal_draw_spline = define_c_proc(prim,"+al_draw_spline",{C_POINTS,ALLEGRO_COLOR,C_FLOAT})
				
public procedure al_calculate_spline(atom dest,atom stride,sequence points,atom thick,atom num)
	c_proc(xal_calculate_spline,{dest,stride,points,thick,num})
end procedure

public procedure al_draw_spline(sequence points,sequence col,atom thick)
	c_proc(xal_draw_spline,{points,col,thick})
end procedure


export constant xal_calculate_ribbon = define_c_proc(prim,"+al_calculate_ribbon",{C_POINTER,C_INT,C_POINTER,C_INT,C_FLOAT,C_INT}),
				xal_draw_ribbon = define_c_proc(prim,"+al_draw_ribbon",{C_POINTER,C_INT,ALLEGRO_COLOR,C_FLOAT,C_INT})
				
public procedure al_calculate_ribbon(atom dest,atom stride,atom points,atom points_stride,atom thick,atom num)
	c_proc(xal_calculate_ribbon,{dest,stride,points,points_stride,thick,num})
end procedure

public procedure al_draw_ribbon(atom pts,atom points_stride,sequence col,atom thick,atom num)
	c_proc(xal_draw_ribbon,{pts,points_stride,col,thick,num})
end procedure


export constant xal_draw_filled_triangle = define_c_proc(prim,"+al_draw_filled_triangle",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR}),
				xal_draw_filled_rectangle = define_c_proc(prim,"+al_draw_filled_rectangle",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR}),
				xal_draw_filled_ellipse = define_c_proc(prim,"+al_draw_filled_ellipse",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR}),
				xal_draw_filled_circle = define_c_proc(prim,"+al_draw_filled_circle",{C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR}),
				xal_draw_filled_pieslice = define_c_proc(prim,"+al_draw_filled_pieslice",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR}),
				xal_draw_filled_rounded_rectangle = define_c_proc(prim,"+al_draw_filled_rounded_rectangle",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,ALLEGRO_COLOR})
				
public procedure al_draw_filled_triangle(atom x,atom y,atom x2,atom y2,atom x3,atom y3,sequence col)
	c_proc(xal_draw_filled_triangle,{x,y,x2,y2,x3,y3,col})
end procedure

public procedure al_draw_filled_rectangle(atom x,atom y,atom x2,atom y2,sequence col)
	c_proc(xal_draw_filled_rectangle,{x,y,x2,y2,col})
end procedure

public procedure al_draw_filled_ellipse(atom cx,atom cy,atom rx,atom ry,sequence col)
	c_proc(xal_draw_filled_ellipse,{cx,cy,rx,ry,col})
end procedure

public procedure al_draw_filled_circle(atom cx,atom cy,atom r,sequence col)
	c_proc(xal_draw_filled_circle,{cx,cy,r,col})
end procedure

public procedure al_draw_filled_pieslice(atom cx,atom cy,atom r,atom start,atom theta,sequence col)
	c_proc(xal_draw_filled_pieslice,{cx,cy,r,start,theta,col})
end procedure

public procedure al_draw_filled_rounded_rectangle(atom x,atom y,atom x2,atom y2,atom rx,atom ry,sequence col)
	c_proc(xal_draw_filled_rounded_rectangle,{x,y,x2,y2,rx,ry,col})
end procedure


export constant xal_draw_polyline = define_c_proc(prim,"+al_draw_polyline",{C_POINTER,C_INT,C_INT,C_INT,C_INT,ALLEGRO_COLOR,C_FLOAT,C_FLOAT})

public procedure al_draw_polyline(atom vertices,atom vertex_stride,atom vertex_count,atom join_style,atom cap_style,sequence col,atom thick,atom limit)
	c_proc(xal_draw_polyline,{vertices,vertex_stride,vertex_count,join_style,cap_style,col,thick,limit})
end procedure


export constant xal_draw_polygon = define_c_proc(prim,"+al_draw_polygon",{C_POINTER,C_INT,C_INT,ALLEGRO_COLOR,C_FLOAT,C_FLOAT}),
				xal_draw_filled_polygon = define_c_proc(prim,"+al_draw_filled_polygon",{C_POINTER,C_INT,ALLEGRO_COLOR}),
				xal_draw_filled_polygon_with_holes = define_c_proc(prim,"+al_draw_filled_polygon_with_holes",{C_POINTER,C_POINTER,ALLEGRO_COLOR})
				
public procedure al_draw_polygon(atom vertices,atom count,atom join,sequence col,atom thick,atom limit)
	c_proc(xal_draw_polygon,{vertices,count,join,col,thick,limit})
end procedure

public procedure al_draw_filled_polygon(atom vertices,atom count,sequence col)
	c_proc(xal_draw_filled_polygon,{vertices,count,col})
end procedure

public procedure al_draw_filled_polygon_with_holes(atom vertices,atom count,sequence col)
	c_proc(xal_draw_filled_polygon_with_holes,{vertices,count,col})
end procedure
­233.42