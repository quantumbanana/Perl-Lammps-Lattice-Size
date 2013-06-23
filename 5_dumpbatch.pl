#This script extracts the coordinates from the last step in dump files for conversion to cmtx files.
#!/usr/local/bin/perl
print"How many atoms are in your system?\n";
chomp($natoms=<>);
$firstPart="dump_";
$lastPart=".lammpstrj";
print"How many dump files are you editing?\n";
chomp($nfile=<>);
for ($i=1;$i<=$nfiles;$i++) {
$inFile ="$firstPart$i$lastPart";
open IN, "<$inFile" or die $!;
$outFile ="dump_$i.lammpstrj";
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
}
