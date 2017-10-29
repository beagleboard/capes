#!/usr/bin/perl
open(INPUT, "< am335x-beagle-pins.mediawiki")
	or die "Couldn't open file for reading: $!\n";
open(OUTPUT, "> am335x-beagle-pins.csv")
	or die "Couldn't open file for writing: $!\n";

$col = 0;
$cols = 0;

while (<INPUT>) {
	if (/^\{/) {
		$col = 0;
		next;
	}
	if (/\}$/ || /^\|\-/) {
		while ($col < $cols) {
			print OUTPUT ",";
			$col++;
		}
		print OUTPUT "\r\n";
		$col = 0;
		next;
	}
	s/^\|(\s*)//;
	chomp;
	if ($col > 0) {
		print OUTPUT ",";
	}
	print OUTPUT "$_";
	$col++;
	if ($col > $cols) {
		$cols = $col;
	}
}

close INPUT;
close OUTPUT;
