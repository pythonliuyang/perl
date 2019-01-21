#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
open (MYFILE,"/root/file1.txt") or die "cant open the file1:$!\n";
my @array=<MYFILE>;
print"@array\n";
