package Storages;
use strict;
use warnings FATAL => 'all';
our @ISA=qw(DB);
use DB;
sub new{
    my $class=shift;
    my $hr_ref={_name=>$_[1],_owner=>$_[2],_capacity=>$_[3]};
    bless($hr_ref,$class);
    return $hr_ref;
}
sub get_name{
    my $self=shift;
    return $self->{_name};
}
sub set_name{
    my($self,$name);
    $self=shift;
    $self->{_name}=$name if $name;
}
sub get_owner{
    my $self=shift;
    return $self->{_owner};
}
sub set_owner{
    my($self,$owner);
    $self=shift;
    $self->{_owner}=$owner if $owner;
    }
sub set_capacity{
    my($self,$capacity);
    $self=shift;
    $self->{_capacity}=$capacity if $capacity;
}
sub get_capacity{
    my $self=shift;
    return $self->{_capacity};
}
1;