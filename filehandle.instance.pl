#!/usr/bin/perl


use strict;
use warnings;
if(-e "/root/file5.txt"){
    open(MYFILE,">>","/root/file5.txt");
    print MYFILE "lets add one line\n";
    close MYFILE;
    open(MYFILE,"/root/file5.txt");
    my @lines=<MYFILE>;
    print"@lines\n";
    close MYFILE;
}
else{
    open(MYFILE,">","/root/file5.txt");
    print MYFILE "thats a new line\n";
    close MYFILE;
}


