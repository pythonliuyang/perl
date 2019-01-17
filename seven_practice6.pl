#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
while(<STDIN>){
    chomp;
    if(/wilma/ and /fred/){
        print"its $_\n";
    }
}