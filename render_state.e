include std/ffi.e

include base.e

public enum type ALLEGRO_RENDER_STATE
	ALLEGRO_ALPHA_TEST = 0x0010,
	ALLEGRO_WRITE_MASK,
	ALLEGRO_DEPTH_TEST,
	ALLEGRO_DEPTH_FUNCTION,
	ALLEGRO_ALPHA_FUNCTION,
	ALLEGRO_ALPHA_TEST_VALUE
end type

public enum type ALLEGRO_RENDER_FUNCTION
	ALLEGRO_RENDER_NEVER = 0,
	ALLEGRO_RENDER_ALWAYS,
	ALLEGRO_RENDER_LESS,
	ALLEGRO_RENDER_EQUAL,
	ALLEGRO_RENDER_LESS_EQUAL,
	ALLEGRO_RENDER_GREATER,
	ALLEGRO_RENDER_NOT_EQUAL,
	ALLEGRO_RENDER_GREATER_EQUAL
end type

include std/math.e

public constant ALLEGRO_MASK_RED = shift_bits(1,0)
public constant ALLEGRO_MASK_GREEN = shift_bits(1,-1)
public constant ALLEGRO_MASK_BLUE = shift_bits(1,-2)
public constant ALLEGRO_MASK_ALPHA = shift_bits(1,-3)
public constant ALLEGRO_MASK_DEPTH = shift_bits(1,-4)

public constant ALLEGRO_MASK_RGB = or_all({ALLEGRO_MASK_RED,ALLEGRO_MASK_GREEN,ALLEGRO_MASK_BLUE})
public constant ALLEGRO_MASK_RGBA = or_all({ALLEGRO_MASK_RGB,ALLEGRO_MASK_ALPHA})

--for testing shift_bits()
--printf(1,"%d",{ALLEGRO_MASK_GREEN})
­36.26