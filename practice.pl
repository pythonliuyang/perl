#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
$_="he's out  bowling with barney tonight";
if(/\s+(\w+)\s+/){
    s/$1/OUT/;
    print"true\n";
}

$_="green scaly dinosaur";
s/(\w+) (\w+)/$2,$1/;
print"$_\n";

s/\A/huge,/;
print"$_\n";

s/,.*een//;
print"$_\n";

$_="home home  tony";
s/home/HOME/g;
print"$_\n";

$_="home        home      tony";
s/\s+/ /g;
print"$_\n";

$_="  im  jack";
s/(?:\s+\z)|(?:\A\s+)//;
print"$_\n";


use v5.14;
my $tom="1000  rib";
my  $copy=$tom=~s#\d+\s+\w+#10 ribs#r;
print"$tom\n";
print"$copy\n";


$_="i saw barney with fred";
s/(barney|fred)/\U$1/gi;
print"$_\n";

s/(\w+) with (\w+)/\U$1\E with $2/i;
print"$_\n";
s/(fred|barney)/\u\L$1/gi;
print"$_\n";
print"hello \Uworld\E i like kinbon!\n";


$_="((((fred  is  very   nice)))!";
if(s/\Q((((\E(fred)/$1/){
    print"the  word is $1\n";
}


my $_="hello im a very beautiful boy !";
my $a=split ' ',$_;

print"$a\n";


my $v="4:5:6:7:8";
my @a=split /:/,$v;
print"@a\n";
my @ab=join "-",@a;
print"@ab\n";

$_="hello there,neighbor!";
my ($e,$b,$c)=/(\S+) (\S+),(\S+)/;
print"$e $b $c\n";

$_="hello  im  god  i like  liuya";
my @abc=/(\w+)/gi;
print"@abc\n";
my %abcd=/(\w+)\s+(\w+)/gi;
my @k=keys %abcd;
my @v=values %abcd;
print"@k\n";
print"@v\n";


my $text="<b>fred</b> and <b>tom</b>";
my $text2=$text=~s|<b>(\w+)</b>|\U$1|g;
print"$text2:$text\n";




use v5.22;
my $word="this  doesn't capitalize correctly";
my $word2=$word=~s/\b{wb}(\w+)/\U$1/;
print"$word\n";
