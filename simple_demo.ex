without warning

--Simple demo showing logical CPUs and RAM size

include allegro.e

atom cpu_c = al_get_cpu_count()
atom ram = al_get_ram_size()

printf(1,"CPUS: %d\n",{cpu_c})
printf(1,"RAM: %d\n",{ram})
­3.47