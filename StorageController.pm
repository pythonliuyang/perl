package StorageController;
use strict;
use warnings FATAL => 'all';
our @ISA=qw(Storage);
use Storage;
our $choose;
sub set_data{
    my $class=shift;
    print"what do you want to do:\n";
    chomp( $choose=<STDIN>);
    if($choose eq "insert"){
        print"please enter the NAME_VALUE:\n";
        chomp(my $value1=<STDIN>);
        print"please enter the CAPACITY_VALUE:\n";
        chomp(my $value2=<STDIN>);
        print "please enter the TABLE_NAME:\n";
        chomp(my $value3=<STDIN>);
        my $ref=Storage->new($value1,$value2,$value3);
        bless($ref,$class);
        return $ref;
    }
    elsif($choose eq "select"){
        my $ref=Storage->new("storage");
        bless($ref,$class);
        return $ref;
    }
    elsif($choose eq "delete"){
        print"please enter the NAME_VALUE:\n";
        chomp(my $value1=<STDIN>);
        print"please enter the TABLE_NAME:\n";
        chomp(my $value2=<STDIN>);
        my $ref=Storage->new($value1,$value2);
        bless($ref,$class);
        return $ref;
    }
    else{
        print"please enter the CAPACITY_VALUE:\n";
        chomp(my $value1=<STDIN>);
        print"please enter the NAME:\n";
        chomp(my $value2=<STDIN>);
        print "please enter the TABLE_NAME:\n";
        chomp(my $value3=<STDIN>);
        my $ref=Storage->new($value1,$value2,$value3);
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