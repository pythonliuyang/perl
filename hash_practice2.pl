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
print"--------original hash--------------\n";
print"hash_A\n";
foreach(keys %hash_A){
    print"$_=>";
    print"$hash_A{$_}\n";
}
foreach(keys %hash_B){
    print"$_=>";
    print"$hash_B{$_}\n";
}
print"------add elements------\n";
$hash_A{"water"}="pesi";
$hash_B{"clothes"}="jackjones";
$hash_B{"BRAND"}{"brand1"}="tonyjeans";
$hash_B{"BRAND"}{"brand2"}="tonyjeans";
$hash_B{"BRANDE"}{"brand3"}="zara";
$hash_B{"BRANDE"}{"brand4"}="nike";
foreach(keys %hash_A){
    print"$_=>";
    print"$hash_A{$_}\n";
}
foreach(keys %hash_B){
    print"$_=>";
    print"$hash_B{$_}\n";}


print"-----delete elements-----\n";
delete($hash_A{thing});
delete($hash_B{clothes});
delete($hash_B{BRAND});
delete($hash_B{BRANDE}{brand3});
foreach(keys %hash_A){
    print"$_=>";
    print"$hash_A{$_}\n";
}
foreach(keys %hash_B){
    print"$_=>";
    print"$hash_B{$_}\n";
}

