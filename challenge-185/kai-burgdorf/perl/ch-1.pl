#!/usr/bin/env perl

use strict;
use warnings;

my $in = "abc1.20f1.345a";
print $in . "\n";

$in =~ s/\.//g;
my @input = split //, $in;

foreach my $index (0 .. $#input) {
	if(($index % 2) == 0 && $index > 0) { print ":"; }
	print $input[$index];
}
