#!/usr/bin/perl
#
#  Author: Preslav Nakov
#  
#  Description: Numbers column k
#
#  Last modified: February 8, 2016
#
#

use warnings;
use strict;
use utf8;

use Getopt::Std;


#################
####   MAIN   ###
#################

my %options = ();
getopts("k:mt", \%options);

die "-k <COLUMN_NUMBER> required" if (!defined($options{k}));
my $columnNo = $options{k};

my $lineNo = 0;
while (<>) {
	s/[\n\r]+$//;
	my @arr = split /\t+/;
	if (defined($options{m})) { $arr[$columnNo] *= 100.0; }
	my $str = sprintf "%5.2f", $arr[$columnNo];
	if (/primary/) {
		$lineNo++;
		$arr[$columnNo] = $str . '$_{' . $lineNo . '}$';
	}
	else {
		$arr[$columnNo] = $str;
	}
	if (defined($options{t})) { $arr[$columnNo] = '\scriptsize ' . $arr[$columnNo]; }
	print join("\t", @arr), "\n";
}
