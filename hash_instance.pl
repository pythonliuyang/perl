#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
print"---------the  sort -------------------------------------------\n";
foreach my $key(sort{$ENV{$a} cmp $ENV{$b} or $b cmp $a} keys %ENV){
    print"$key=>$ENV{$key}\n";
}