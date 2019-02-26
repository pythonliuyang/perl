package Storage;
use strict;
use warnings FATAL => 'all';
use DBIMAN;
sub new {
    my $class = shift;
    my ($value1,$value2,$value3)=@_;
    my $ref = {"VALUE"=>$value1,"VALUE2"=>$value2,"VALUE3"=>$value3};
    bless($ref, $class);
    return $ref;
}
sub insert{
    my $self=shift;
    DBIMAN->insert($self->{VALUE},$self->{VALUE2},$self->{VALUE3});
}
sub select{
    my $self=shift;
    DBIMAN->select($self->{VALUE});
}
sub update{
    my $self=shift;
    DBIMAN->update($self->{VALUE},$self->{VALUE2},$self->{VALUE3});
}
sub delete {
    my $self = shift;
    DBIMAN->delete($self->{VALUE},$self->{VALUE2});
}
1;