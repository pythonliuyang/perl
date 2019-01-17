#!/usr/bin/perl
use strict;
use warnings;
my (@words,%count,$word);
print"please enter  a  name:\n";
chomp(@words=<STDIN>);
foreach $word(@words){
    $count{$word}=$count{$word}+1;
}
foreach $word(sort keys %count){
      print"$word=>$count{$word}\n"
}