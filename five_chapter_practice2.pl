#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
print "enter some lines,then press Ctrl+D:\n";
chomp(my @lines=<STDIN>);
print "1234567890" x 7,"12345\n";
foreach (@lines){
    printf "%20s","$_\n";
}


