#!/usr/bin/env perl

use strict;
use warnings;

my @list = ('ab-cde-123', '123.abc.420', '3abc-0010.xy');
my @outlist;

foreach (@list) { push(@outlist, mask_first_four($_)); }

use Data::Dumper;
print Dumper \@list;
print Dumper \@outlist;

sub mask_first_four() {
	my ($str) = @_;
	my $replacements_left = 4;
	my @lits = split //, $str;

	foreach my $index (0 .. $#lits) {
		if ($lits[$index] =~ m/([a-z]|[0-9])/) {
			$lits[$index] = 'x';
			$replacements_left--;
		}
		last if ($replacements_left < 1);
	}

	return join("", @lits);
}
