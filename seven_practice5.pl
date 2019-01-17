#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
while(<>){
    chomp;
    if(/(\S)\1/){
        print"its $_\n";
    }
}