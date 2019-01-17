#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
while(<>){
    chomp;
    if(/^[A-Z][a-z]+/){
        print"its $_\n";
    }
}