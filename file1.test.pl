#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
my $file="/root/file1.txt";
if(-w $file){
    print"the file can write\n";
    print (-M $file);
    print"\n";
    print(-s $file);
}
else{
    print"the file cant write\n";
}
