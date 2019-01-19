#!/usr/bin/perl
my %hash_A=("food"=>"fruite","ting"=>"book");
my @array3=@hash_A{"food","thing"};
print"@array3\n";
my @array=keys %hash_A;
my @array2=values %hash_A;
print"@array\n";
print"@array2\n";
my $array=keys %hash_A;
my $array2=values %hash_A;
print"$array\n";
print"$array2\n";
