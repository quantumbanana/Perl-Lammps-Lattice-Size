#lammps datafile generator for Glazer lattice size calculations
#for more general usage consider change the start size and number of atoms
#!/usr/local/bin/perl
print"what is the name of CONTCAR file\n";
chomp($inFile=<STDIN>);
open IN, "<$inFile" or die $!;
print"How many datafiles -1 would you like to generate?\n
(Please give me an even number)\n";
chomp($nfile=<>);
$halfnfile=$nfile*0.5;
print"What is the lattice size?\n";
chomp($latticesize=<>);
print"What increments (in Angstroms) would you like for varying lattice size?\n";
chomp($step=<>);
$xlength=($latticesize*2)-($halfnfile+1)*2*$step;#define box size
$ylength=$latticesize-($halfnfile+1)*$step;;
$zlength=$ylength;
print"What is the name of the LAMMPS charge file?\n"; #charge file
chomp($elecf=<STDIN>);
open ELEC, "<$elecf" or die $!;
@linesIn=<IN>;
@linesELE=<ELEC>;
for($j=1;$j<$nfile+2;$j++){
$xlength=$xlength+(2*$step);#multiply step by 2 for doubled length along that dimension
$ylength=$ylength+$step;
$zlength=$zlength+$step;
$atoms=80; #change number of atoms
$outFile=data.$j;
open OUT,">$outFile" or die $!;
#print data header to output file
print OUT"#Glazer distortion datafile $j\n";
print OUT"\n";
print OUT"$atoms atoms\n";
print OUT"4 atom types\n";
print OUT"\n";
print OUT"0 $xlength xlo xhi\n";
print OUT"0 $ylength ylo yhi\n";
print OUT"0 $zlength zlo zhi\n";
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
for($i=7;$i<$atoms+7;$i++){
  @line=split(/\s+/,$linesIn[$i]);
	@line2=split(/\s+/,$linesELE[$i+11]);
	#remember to change the lines corresponding to each atom type in your data
	if($i<=22){
		$type=1;
		#$elec=;
	}elsif($i<=37){
		$type=2;
		#$elec=;
	}elsif($i<=85){
		$type=3;
		#$elec=;
	}else{
		$type=4;
		#$elec=;
	}
	$xCoord=$line[0];
	$yCoord=$line[1];
	$zCoord=$line[2];
	$elec=$line2[2];
	$seq=$i-6;
	#calculate Cartesian  coordinates 
	$cartX=$xCoord*$xlength;
	$cartY=$yCoord*$ylength;
	$cartZ=$zCoord*$zlength;
	#print to data file
	print OUT "$seq	$type	$elec	$cartX	$cartY	$cartZ";	
	print OUT"\n";
}
}
