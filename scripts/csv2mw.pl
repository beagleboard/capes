#!/usr/bin/perl
open(INPUT, "< am335x-beagle-pins.csv")
	or die "Couldn't open file for reading: $!\n";
open(OUTPUT, "> am335x-beagle-pins.mediawiki")
	or die "Couldn't open file for writing: $!\n";   

print OUTPUT "|-\n";
while (<INPUT>) {
	s/\r|\n//g;
	@fields = split(",");
	for (@fields) {
		print OUTPUT "\| $_\n";
	}
	printf OUTPUT "|-\n";
}

close INPUT;
close OUTPUT;
