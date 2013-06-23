#This converts dump (.lammpstrj) files containing only coordinates into LAMMPS data files. 
#!/usr/local/bin/perl
#print"dump file\n";
#chomp($inFile=<STDIN>);
$inFile="dump.lammpstrj";
open IN, "<$inFile" or die $!;
print"lattice size\n";
chomp($ylength=<>);
$xlength=$ylength*2;
$zlength=$ylength;
print"change lattice size to\n";
chomp($ylattice=<>);
$xlattice=$ylattice*2;
$zlattice=$ylattice;
@linesIn=<IN>;
for($j=1;$j<=1;$j++){
$atoms=80; #change number of atoms
$outFile="data_dump";
open OUT,">$outFile" or die $!;
#print data header to output file
print OUT"#Glazer distortion datafile from dump file\n";
print OUT"\n";
print OUT"$atoms atoms\n";
print OUT"4 atom types\n";
print OUT"\n";
print OUT"0 $xlattice xlo xhi\n";
print OUT"0 $ylattice ylo yhi\n";
print OUT"0 $zlattice zlo zhi\n";
print OUT"\n";
print OUT"Masses\n";
print OUT"\n";
print OUT"1 137.327\n";
print OUT"2 91.224\n";
print OUT"3 15.9990\n";
print OUT"4 88.9052\n";
print OUT"\n";
print OUT"Atoms\n";
print OUT"\n";
#go through input file (data.)
for($i=0;$i<$atoms;$i++){
  @line=split(/\s+/,$linesIn[$i]);
	$charge=$line[2];
	$type=$line[1];
	$xCoord=($line[3]/$xlength)*$xlattice;
	$yCoord=($line[4]/$ylength)*$ylattice;
	$zCoord=($line[5]/$zlength)*$zlattice;
	$seq=$line[0];
	#print to data file
	print OUT"$seq	$type	$charge	$xCoord	$yCoord	$zCoord";	
	print OUT"\n";
}
}
