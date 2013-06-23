#!/usr/local/bin/perl
print"How many data files did you generated? (Even number)\n";
chomp($nfile=<>);
for($i=0;$i<$nfile+1;$i++)
 {
$k=$i+1;
#convert input files
$outFile="input$k.min";
open OUT, ">$outFile" or die $!;
print OUT"#Buckingham structural minimization $k\n";
print OUT"clear\n";
print OUT"units  	metal\n";
print OUT"dimension	3\n";
print OUT"boundary	p p p\n";
print OUT"\n";
print OUT"atom_style	charge\n";
print OUT"read_data	data$k\n";
print OUT"\n";
print OUT"pair_style	buck/coul/long 10.0 8.0\n";
print OUT"pair_coeff	* * 0 1 0\n";
print OUT"pair_coeff	1 3 905.7 0.3976 0\n";
print OUT"pair_coeff	2 3 1234.73 0.358 0\n";
print OUT"pair_coeff	3 3 9547.96 0.21916 32.0\n";
print OUT"pair_coeff	3 4 1766.40 0.33849 19.43\n";
print OUT"\n";
print OUT"kspace_style	ewald 1.0e-4\n";
print OUT"\n";
print OUT"mass 	1	137.327\n";
print OUT"mass 	2 	91.224\n";
print OUT"mass	3 	15.9990\n";
print OUT"mass 	4 	88.9052\n";
print OUT"\n";
print OUT"neighbor	2.0 bin\n";
print OUT"neigh_modify	every 10 delay 0 check no\n";
print OUT"\n";
print OUT"reset_timestep	0\n";
print OUT"thermo 	1\n";
print OUT"thermo_style	custom step temp pe ke etotal press lx ly lz\n";
print OUT"dump		1 all custom 1 dump_$k.lammpstrj id type q x y z\n";
print OUT"min_style	cg\n";
print OUT"minimize	1e-4 1e-4 5000 5000\n";
print OUT"undump	1\n";
print OUT"\n";
print OUT"fix		1 all box/relax iso 0 vmax 0.001\n";
print OUT"reset_timestep	0\n";
print OUT"thermo	1\n";
print OUT"thermo_style	custom step temp pe ke etotal press lx ly lz\n";
print OUT"dump		1 all custom 1 dumpbox_$k.lammpstrj id type q x y z\n";
print OUT"min_style	cg\n";
print OUT"minimize	1e-4 1e-4 5000 5000\n";
}
close OUT;

