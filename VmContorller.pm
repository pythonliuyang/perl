package VmContorller;
use strict;
use warnings FATAL => 'all';
our @ISA=qw(VirtualMachine);
use VirtualMachine;
our $choose;
sub set_data{
    my $class=shift;
    print"what do you want to do:\n";
    chomp( $choose=<STDIN>);
    if($choose eq "insert"){
        print"please enter the NAME_VALUE:\n";
        chomp(my $value1=<STDIN>);
        print"please enter the OS_VALUE:\n";
        chomp(my $value2=<STDIN>);
        print "please enter the STORAGE_VALUE:\n";
        chomp(my $value3=<STDIN>);
        print"please enter the TABLE_NAME:\n";
        chomp(my $value4=<STDIN>);
        my $ref=VirtualMachine->new($value1,$value2,$value3,$value4);
        bless($ref,$class);
        return $ref;
    }
    elsif($choose eq "select"){
        my $ref=VirtualMachine->new("vm");
        bless($ref,$class);
        return $ref;
    }
    elsif($choose eq "delete"){
        print"please enter the NAME_VALUE:\n";
        chomp(my $value1=<STDIN>);
        print"please enter the TABLE_NAME:\n";
        chomp(my $value2=<STDIN>);
        my $ref=VirtualMachine->new($value1,$value2);
        bless($ref,$class);
        return $ref;
    }
    else{
        print"please enter the STORAGE_VALUE:\n";
        chomp(my $value1=<STDIN>);
        print"please enter the NAME_VALUE:\n";
        chomp(my $value2=<STDIN>);
        print "please enter the TABLE_NAME:\n";
        chomp(my $value3=<STDIN>);
        my $ref=VirtualMachine->new($value1,$value2,$value3);
        bless($ref,$class);
        return $ref;
    }
}
sub get_data{
    my $self=shift;
    if($choose eq "insert"){
        $self->insert;
    }
    elsif($choose eq "select"){
        $self->select;
    }
    elsif($choose eq "update"){
        $self->update;
    }
    else{
        $self->delete;
    }
}
1;