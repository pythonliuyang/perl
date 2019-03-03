package Storage_controller;
use strict;
use warnings FATAL => 'all';
use DB;
use Data::Dumper;
use Storages;
use VmServer;
use Template;
sub new{
    my $class=shift;
    my $self={_req=>$_[1],
              _name=>$_[2],
              _owner=>$_[3],
              _capacity=>$_[4]};
    bless ($self,$class);
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
sub get_owner{
    my $self=shift;
    return $self->{_owner};
}
sub get_capacity{
    my $self=shift;
    return $self->{_capacity};
}
sub transfer{
    my $self = shift;
    my $req  = $self->get_req;
    my $name = $self->get_name;
    my $owner = $self->get_owner;
    my $capacity = $self->get_capacity;
    my $tt = Template->new();
    my $sto = Storages->new($name, $owner, $capacity);
    my ($res, $vars, $suc, $fail);
    if($req eq "update"){
        $vars = { name => $name, };
        $res=$sto->update('storage',$name,$owner,$capacity);
        if($res){
        $tt->process($suc, $vars) || die $tt->error();
        }
        else{
        $tt->process($fail, $vars) || die $tt->error();
        }
    }
    elsif($req eq "create"){
        $vars = { name => $name, };
        $res=$sto->create('storage',$name,$owner,$capacity);
        if($res){
           $tt->process($suc, $vars) || die $tt->error();
        }
        else{
            $tt->process($fail, $vars) || die $tt->error();
        }
    }
    elsif($req eq "select"){
        $vars = { name => $name, };
        $res=$sto->select('storage',$self->get_name);
        if($res){
            $tt->process($suc, $vars) || die $tt->error();
        }
        else{
            $tt->process($suc, $vars) || die $tt->error();
        }
    }
    elsif($req eq "delete"){
        $vars = { name => $name, };
        $res=$sto->delete('storage',$self->get_name);
        if($res){
            $tt->process($suc, $vars) || die $tt->error();
        }
    }
}
1;