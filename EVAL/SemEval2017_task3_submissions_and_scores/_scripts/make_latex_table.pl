#!/usr/bin/perl
#
#  Author: Preslav Nakov
#  
#  Description: Generates a LaTeX table for the SemEval results.
#
#  Last modified: February 8, 2016
#
#

use warnings;
use strict;
use utf8;


#################
####   MAIN   ###
#################

print '\begin{table*}[tbh]', "\n";
print '\begin{center}', "\n";
print '\begin{tabular}{clrrrrrrr}', "\n";
print '& \bf Submission & \bf MAP & \bf \scriptsize AvgRec & \bf \scriptsize MRR & \bf \scriptsize P & \bf \scriptsize R & \bf \scriptsize F1 & \bf \scriptsize Acc\\\\', "\n";
print '\hline', "\n";

my $lineNo = 0;
while (<>) {
	s/[\n\r]+$//;
	s/_/\\_/g;
	s/\$\\_/\$_/g;
	my @arr = split /\t+/;
	if (/primary/) {
		for (my $ind = 0; $ind <= $#arr; $ind++) {
			$arr[$ind] =  '\bf ' . $arr[$ind];
		}
		$lineNo++;
		print "\\bf $lineNo ";
	}
	print '& ', join(" & ", @arr), " \\\\\n";
}

print '\end{tabular}', "\n";
print '\caption{Table caption.}', "\n";
print '\label{table:results}', "\n";
print '\end{center}', "\n";
print '\end{table*}', "\n";
