package VM_controller;
use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use VmServer;
use Storage;
use Template;
sub new{
    my $class=shift;
    my $self={_req=>$_[1],
              _name=>$_[2],
              _os=>$_[3],
              _storage=>$_[4]};
    bless($self,$class);
    return $self;
}
sub get_req{
    my $self=shift;
    return $self->{_req};
}
sub get_name{
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
sub transfer{
    my $self = shift;
    my $req  = $self->get_req;
    my $name = $self->get_name;
    my $os = $self->get_os;
    my $storage = $self->get_storage;
    my $tt = Template->new();
    my $sto = VmServer->new($name, $os, $storage);
    my ($res, $vars, $suc, $fail);
    if($req eq "update"){
        $vars = { name => $name, };
        $res=$sto->update('server',$name,$os,$storage);
        if($res){
        $tt->process($suc, $vars) || die $tt->error();
        }
        else{
        $tt->process($fail, $vars) || die $tt->error();
        }
    }
    elsif($req eq "create"){
        $vars = { name => $name, };
        $res=$sto->create('storage',$name,$os,$storage);
        if($res){
           $tt->process($suc, $vars) || die $tt->error();
        }
        else{
            $tt->process($fail, $vars) || die $tt->error();
        }
    }
    elsif($req eq "select"){
        $vars = { name => $name, };
        $res=$sto->select('server',$self->get_name);
        if($res){
            $tt->process($suc, $vars) || die $tt->error();
        }
        else{
            $tt->process($suc, $vars) || die $tt->error();
        }
    }
    elsif($req eq "delete"){
        $vars = { name => $name, };
        $res=$sto->delete('server',$self->get_name);
        if($res){
            $tt->process($suc, $vars) || die $tt->error();
        }
    }
}
1;