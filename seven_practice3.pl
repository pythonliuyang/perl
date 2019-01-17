#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
while(<>){
    chomp;
    if(/\./){
        print"its $_\n";
    }else{
        print"there  is  no  this people!\n";
    }
}
