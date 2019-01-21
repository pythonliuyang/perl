#!/usr/bin/perl
open(MYFILE,"/root/file1.txt") || die "cant open the  file1!:$!\n";
while(<MYFILE>){
    chomp;
    print"$_\n";
}