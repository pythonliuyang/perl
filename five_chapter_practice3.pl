#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
print "what column width would you like?\n";
chomp(my $width=<STDIN>);
print "enter some lines,then press Ctrl+D:\n";
chomp(my @lines=<STDIN>);
print "1234567890" x (($width+9)/10),"\n";
foreach (@lines){
    printf "%*s",$width,"$_\n";
}
