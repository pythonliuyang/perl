#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
open (MYFILE,">>","/root/file1.txt") or die "cant open the file1\n";
my $line="i like kinbon  so much!\n";
print MYFILE $line;
close MYFILE;