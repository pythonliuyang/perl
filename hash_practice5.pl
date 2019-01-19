#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
my %hash_class=("C"=>{
                 "A_1"=>"98",
                 "A_4"=>"76",
               },
                "E"=>{
                 "A_5"=>"97",
                 "A_2"=>"41",
                },
                "A"=>{
                 "A_6"=>"77",
                 "A_3"=>"84",
                }
);

my @array=keys %hash_class;
print"@array\n";
printf"------sort by hash------\n";
foreach my $key1(sort {$b cmp $a} keys %hash_class){
    foreach my $key2(sort{$b cmp $a} keys %{$hash_class{$key1}}){
        printf"$key1=>$key2=>$hash_class{$key1}{$key2}\n";
    }
}
printf"---------------sort by value and sort by keys\n";
my %hash_class2=("forest"=>90,"cristine"=>98,"leon"=>100,"crystal"=>59,"amy"=>59);
foreach  (sort {$hash_class2{$a} <=> $hash_class2{$b} or $a cmp $b} keys %hash_class2){
    print"$_=>$hash_class2{$_}\n";
}

printf"------------------sort by value--------------------------\n";
my %hash_class3=("forest"=>90,"cristine"=>98,"leon"=>100,"crystal"=>59,"amy"=>59);
foreach  (sort {$hash_class3{$a} <=> $hash_class3{$b} } keys %hash_class3){
    print"$_=>$hash_class3{$_}\n";
}
