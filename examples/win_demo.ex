--Simple Display Window demo
--Closes after a few seconds

include allegro.e
include keycodes.e
include std/ffi.e

procedure main()

 atom x = al_install_system(ALLEGRO_VERSION_INT,0)
 
 if x = -1 then
 	puts(1,"Failed to init Allegro!\n")
 	abort(0)
 end if
 
 atom dis = al_create_display(800,600)
 
 if dis = -1 then
 	puts(1,"Failed to create display!\n")
 	abort(0)
 end if
 
 al_set_window_title(dis,"Simple Window Demo")
 
 al_flip_display()
  
 al_rest(5.0)
 
 al_destroy_display(dis)
	
end procedure

main()
­3.0