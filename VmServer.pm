package VmServer;
use strict;
use warnings FATAL => 'all';
our @ISA=qw(DB);
use DB;
sub new{
    my $class=shift;
    my $hr_ref={_name=>$_[1],_os=>$_[2],_storage=>$_[3]};
    bless($hr_ref,$class);
    return $hr_ref;
}
sub get_name{
    my $self=shift;
    $self->{_name};
}
sub set_name{
    my($self,$name);
    $self=shift;
    $self->{_name}=$name if $name;
}
sub get_os{
    my $self=shift;
    $self->{_os};
}
sub set_os{
    my($self,$os);
    $self=shift;
    $self->{_os}=$os if $os;
}
sub get_storage{
    my $self=shift;
    $self->{_storage};
}
sub set_storage{
    my($self,$storage);
    $self=shift;
    $self->{_storage}=$storage if $storage;
}
1;