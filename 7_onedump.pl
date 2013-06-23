#This script extracts the coordinates from the last step in dump files for conversion to cmtx files.
#!/usr/local/bin/perl
#print"How many atoms are in your system?\n";
#chomp($natoms=<>);
#print"What is the dump file\n";
#chomp($inFile=<STDIN>);
$natoms=80;
$inFile="dump_1.lammpstrj";
open IN, "<$inFile" or die $!;
$outFile="dump.lammpstrj";
open OUT, ">$outFile" or die $!;
@linesIn=<IN>;
$length=@linesIn-$natoms;
chop($linesIn[$length]);
print OUT"$linesIn[$length]\n";
for ($j=1;$j<=$natoms;$j++) {
print OUT"$linesIn[$length+$j]";
}
close(IN);
close(OUT);
