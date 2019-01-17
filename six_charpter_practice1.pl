#!/usr/bin/perl
%last_name=qw{fred flintstone barney rubble wilma flintstone};
print"please enter  the   name:\n";
chomp($name=<STDIN>);
if(exists $last_name{$name}){
    print "the key  is  exist\n";
    print"$name=>$last_name{$name}\n";
}else{
    print"the  key  is  not  exist\n";
}
