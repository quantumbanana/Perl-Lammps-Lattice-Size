Perl-Lattice-size
=================

Perl scripts for determining optimal lattice size on LAMMPS

Scripts 1-5 are for generating a batch in which lattice sizes are changed based on one single input file, which means that if the coordinates of all the data files are converted into fractional coordinates, they would all be the same except for the lattice constant by which each file is multiplied. This method is not as accurate.

If you want to determine lattice size more accurately, you can extract the coordinates of a single optimized system and then change the lattice size after each step. This method is not as convenient as the batch one but it guarantees that you are changing the lattice size along the same potential energy surface. Scripts 7-8 are best suited for this method.

1_datafile.pl and 6_lammps2cmtx.pl are modified from perl scripts that Nancy Zhu and Racehl Krueger wrote, respectively. The rest are written by me.

------------------------------------------------------------------------------------------------------------------------
1_datafile.pl
------------------
This perl script generates a number of LAMMPS data files by reading two input files, a VASP CONTCAR/POSCAR file and a LAMMPS format data file. 

The first prompt of the script asks for the name of the VASP CONTCAR/POSCAR file, thereby extracting the fractional coordinates from it.

The second and third prompt ask for the number of data files to be generated and the increment (in Angstrom) by which lattice size varies, respectively. The number of data files needs to be even because it is symmetric about the origin (that is your lattice size in the VASP coordinate file). 

The fourth prompt asks for the lattice size of your system. Note that the current script is configured for a 4x2x2 supercell, so if you would need to modify the $xlength lines in the script yourself if this is not your system geometry. Beware that there are two sets of lines that define the box size in the script. 

The fifth prompt asks for the name of the LAMMPS-formatted charge file in which partial or formal charges of the system are stored.

Another caution before using this script is that it is configured for a perovskite containing 4 atom types and 80 atoms in total; you would need to customize the script. Remember to change the line numbers corresponding to each atom type in the loop.

------------------------------------------------------------------------------------------------------------------------
2_geninput.pl
------------------

------------------------------------------------------------------------------------------------------------------------
3_lammps.pl
------------------

------------------------------------------------------------------------------------------------------------------------
4_extract.pl
------------------

------------------------------------------------------------------------------------------------------------------------
5_dumpbatch.pl
------------------

------------------------------------------------------------------------------------------------------------------------
6_lammps2cmtx.pl
------------------

------------------------------------------------------------------------------------------------------------------------
7_onedump.pl
------------------

------------------------------------------------------------------------------------------------------------------------
8_dumpdata.pl
------------------
