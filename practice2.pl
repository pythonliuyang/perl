#!/usr/bin/perl
use strict;
use warnings;
my @array=(1..5);
my $test=pop @array;
print"$test\n";
my @array2=qw(a b c d);
push (@array2,1..4);
print"@array2\n";


my @array5=(1..5);
my $test2=shift(@array5);
print"$test2\n";

my @array6=qw(tom jerry suse);
unshift(@array6,456);
print "@array6\n";
