#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
my %hash_B=("fruite"=>{
    "round1"=>"apple",
    "round2"=>"pear",
    },
    "book"=>{
    "red"=>"king of the quen",
    "green"=>"forest",
    }
);
print"---------this  is  the  hash_B-----------\n";
my $herf=\%hash_B;
foreach my $key1 (keys %hash_B){
    foreach my $key2(keys %{$hash_B{$key1}}){
        printf"$key1=>$key2=>$hash_B{$key1}{$key2}\n"
    }
}
printf"\n\n";
printf"$herf->{book}{red}\n";
printf"${$herf}{book}{red}\n";
printf"\n\n";
my $herf1=\%hash_B;
$herf1->{book}{red}="liuyang is  the  best coder";
$herf1->{book}{green}="yes im  the  god";
foreach my $keys1(keys %hash_B){
    foreach my $keys2(keys %{$hash_B{$keys1}}){
        print"$keys1=>$keys2=>$hash_B{$keys1}{$keys2}\n";

    }
}
printf"${$herf}{book}{green}\n";
printf"$herf->{book}{green}\n";
