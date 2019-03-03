package Base;
use strict;
use warnings FATAL => 'all';
our @ISA=qw(VmServer,Storages);
use VmServer;
use Storages;
sub new{
    my $class=shift;
    my ($_table_name,$param,$param2,$param3)=@_;
    if($_table_name eq 'server'){
        my $server_ref=VmServer->new($param,$param2,$param3);
        bless($server_ref,$class);
        return $server_ref;
    }
    elsif($_table_name eq 'storage'){
        my $storage_ref=Storages->new($param,$param2,$param3);
        bless($storage_ref,$class);
        return $storage_ref;
    }
}

sub get_server_name{
    my $self=shift;
    return $self->{_name};
}
sub get_os{
    my $self=shift;
    return $self->{_os};
}
sub get_storage{
    my $self=shift;
    return $self->{_storage};
}
sub get_storage_name{
    my $self=shift;
    return $self->{_name};
}
sub get_owner{
    my $self=shift;
    return $self->{_owner};
}
sub get_capacity{
    my $self=shift;
    return $self->{_capacity};
}
sub update{
    my $self=shift;
    if(ref($self) eq 'server'){
        $self->DB::update($self->get_server_name,$self->get_os,$self->get_storage);
    }
    else{
        $self->DB::update($self->get_storage_name,$self->get_owner,$self->get_capacity);
    }
}
sub create{
    my $self=shift;
    if(ref($self) eq 'server'){
        $self->DB::create($self->get_server_name,$self->get_os,$self->get_storage);
    }
    else{
        $self->DB::create($self->get_storage_name,$self->get_owner,$self->get_capacity);
    }
}
sub delete{
    my $self=shift;
    if(ref($self) eq 'server'){
        $self->DB::delete('server',$self->get_server_name);
    }
    else{
        $self->DB::delete('storage',$self->get_storage_name);
    }
};
sub select{
    my $self=shift;
    if(ref($self) eq 'server'){
        $self->DB::select('server',$self->get_server_name);
    }
    else{
        $self->DB::select('storage',$self->get_storage_name);
    }
}

1;