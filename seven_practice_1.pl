#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
while(<>){
    chomp;
    if(/fred/){
        print"yes is $_\n";
    }else{
        print "fuck\n";
    }

}
