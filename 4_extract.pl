#!/usr/local/bin/perl
$firstPart="output";
$lastPart=".dat";
print"How many output files do you have?\n";
chomp($nfile=<>);
for ($i=1;$i<=$nfile;$i++) {
 $full_file_name = $firstPart . $i . $lastPart;
 open(ENERGIES,$full_file_name) or die "cannot open $full_file_name";
 my $count=0;   
 while (<ENERGIES>) {
 $count=1 if /Energy/; 
if ($count >=1 and $count <=1){
 next if /Energy/;
 print"$i";
 print;
$count++;
 }
}
}
close(ENERGIES);
