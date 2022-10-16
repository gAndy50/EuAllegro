--Simple Display Window demo
--Draw primitive shapes

include allegro.e
include keycodes.e
include std/ffi.e

include primitives.e

procedure main()

 atom x = al_install_system(ALLEGRO_VERSION_INT,0)
 
 atom a = al_init_primitives_addon()
 
 if x = -1 then
 	puts(1,"Failed to init Allegro!\n")
 	abort(0)
 end if
 
 if a = -1 then
 	puts(1,"Failed to init addon!\n")
 	abort(0)
 end if
 
 atom dis = al_create_display(800,600)
 
 if dis = -1 then
 	puts(1,"Failed to create display!\n")
 	abort(0)
 end if
 
 al_set_window_title(dis,"Primitive Demo")
 
 sequence BLUE = al_map_rgb(0,0,255)
 sequence GREEN = al_map_rgb(0,255,0)

 al_draw_line(800 / 2,0,800,600,BLUE,0)
 
 al_draw_rectangle(100,100,100,100,GREEN,50) 

 al_flip_display()
  
 al_rest(5.0)
 
 al_shutdown_primitives_addon()
 
 al_destroy_display(dis)
	
end procedure

main()
­40.43
