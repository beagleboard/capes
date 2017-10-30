#!/usr/bin/perl
open(INPUT, "< am335x-beagle-pins.csv")
	or die "Couldn't open file for reading: $!\n";
open(OUTPUT, "> ../README.mediawiki")
	or die "Couldn't open file for writing: $!\n";   

print OUTPUT '{| class="wikitable" style="white-space:nowrap;"';
print OUTPUT "\n";
while (<INPUT>) {
	s/\r|\n//g;
	@fields = split(",");
	for (@fields) {
		print OUTPUT "\| $_\n";
	}
	if (eof) {
		print OUTPUT "\|}\n";
	} else {
		printf OUTPUT "\|-\n";
	}
}

close INPUT;
close OUTPUT;
