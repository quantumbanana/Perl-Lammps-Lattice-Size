#!/usr/local/bin/perl
print"How many input files did you generate? (Even number)\n";
chomp($nfile=<>);
for($i=1;$i<$nfile+1;$i++)
 {
#$k=$i+1;
#run lammps
my $status = system("lmp_serial < input$i.min > output$i.dat");
}
