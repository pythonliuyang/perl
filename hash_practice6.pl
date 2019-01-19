#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
my %hash=("a"=>4,"b"=>9);
my $herf=\%hash;
my %hash_A=%{$herf};
my @keys=keys %hash_A;
my @values=values %hash_A;
print"@keys\n";
print"@values\n";
my $you=$herf->{a};
print"$you\n";






