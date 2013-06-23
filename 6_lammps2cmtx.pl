#This file converts coordinates to from a dump file to a crystalmaker file with appropriate fractional coordinates.
# It will work if your system has any of Ba, Zr, O, and Y.
#you must replace cell dimensions with your cell dimensions in the CELL line 
#and also in the portion that calculates the fractional coordinates.
#the file that it reads in can only have atom numbers, charges, and coordinates-no header. Be sure to delete the header.
#You must also change the maximum index in the for loop to the number of ions in your system. 

#!/usr/local/bin/perl
print"How many atoms are in the system?\n";
chomp($nfile=<>);
print"What is the lattice size in x?\n";
chomp($latticex=<>);
print"What is the lattice size in y?\n";
chomp($latticey=<>);
print"What is the lattice size in z?\n";
chomp($latticez=<>);
#Get names of input and output files, open files
print"what is the name of the file to be read?\n";
chomp($inFile=<STDIN>);
open IN, "<$inFile" or die $!;
print"output file name?\n";
chomp($outFile=<STDIN>);
open OUT,">$outFile" or die $!;
#print cmtx header to output file
print OUT"TITL YBaZrO3\n";
print OUT"CELL $latticex $latticey $latticez 90 90 90\n";
print OUT"SPGR  P 1\n";
print OUT"BMAX  Zr  O   2.473\nBMAX  O   Y   2.473\n";
print OUT"TYPE\n";
print OUT"Zr    0.86  0.00000 1.00000 0.00000\n";
print OUT"O     1.21  1.00000 0.00000 0.00000\n";
print OUT"Ba    1.49  0.74342 0.39631 0.45338\n";
print OUT"Y     1.04  0.01549 0.07601 0.48417\n";
print OUT"ATOM\n";
#go through input file
@linesIn=<IN>;
#Change the upper index below! 1001 is the number of atoms in my system.
#Be sure to replace it with the number of atoms in your system!
for($i=0;$i<$nfile;$i++){
  @line=split(/\s+/,$linesIn[$i]);
	#print atom symbols
	$type=$line[1];
	if($type==1){
		print OUT"Ba	Ba	";
	}elsif($type==2){
		print OUT"Zr	Zr	";
	}elsif($type==3){
		print OUT"O	O	";
	}else{
		print OUT"Y	Y	";
	}
	$xCoord=$line[3];
	$yCoord=$line[4];
	$zCoord=$line[5];
	#print OUT "$xCoord $yCoord $zCoord";
	#calculate fractional coordinates (change values in this section)
	$fracX=$xCoord/$latticex;
	$fracZ=$zCoord/$latticez;
	$fracY=$yCoord/$latticey;
	#print to cmtx file
	print OUT "$fracX	$fracY	$fracZ";	

	print OUT"\n";
}

