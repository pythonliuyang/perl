#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
my %hash_A=("food"=>"fruite","ting"=>"book");
my %hash_B=("fruite"=>{
    "round1"=>"apple",
    "round2"=>"pear",
    },
    "book"=>{
    "red"=>"king of the quen",
    "green"=>"forest",
    }
);
my %hash_C=%hash_A;
my %hash_D=%hash_B;
print"the food  is $hash_A{food}\n";
print"the fruite is $hash_B{fruite}{round1}\n";
foreach (keys %hash_C){
    print"$_=>\n";
}
foreach (keys %hash_D){
    print"$_=>\n";
}
foreach(values %hash_C){
    print"$_\n";
}
foreach(values %hash_D){
    print"$_\n";
}
# notice;
my %hash_E=(123=>"bigger","123"=>"smaller");
my $APPLE=$hash_E{123};
print"$APPLE\n";
