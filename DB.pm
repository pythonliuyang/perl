package DB;
use strict;
use warnings FATAL => 'all';
use DBI;
use Digest::MD5;
sub new {
    my ($class)=shift;
    my $self={_table_name=>$_[1]};
    bless($self,$class);
    return $self;
}
sub connect{
    my $self=shift;
    my $driver   = "Pg";
    my $database = "test";
    my $dsn = "DBI:$driver:dbname=$database;host=127.0.0.1;port=5432";
    my $userid = "postgres";
    my $password = "centos";
    my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 ,PrintError=>0})
                      or die $DBI::errstr;
    return $dbh;
}

sub search{
    my $self=shift;
    $self->{_table_name}=shift;
    $self->{_name}=shift;
    my $stmt = qq(SELECT  *  from $self->{_table_name} where name = '$self->{_name}');
    if($self->connect){
        my $sth = $self->connect->prepare( $stmt );
           $sth->execute();
           my $results=$sth->fetchall_arrayref();
        if(defined $results){
            return 1;
        }
        else{
            return 0;
        }
    }
    else{
        return 0;
    }
    $self->connect->disconnect();
}
#---------------------------------------------------------------------------------------
sub update{
    my ($self)=shift;
    my $dbh=$self->connect;
    $self->{_table_name}=shift;
    my $param_2=shift;
    my $param_3=shift;
    my $param_4=shift;
    my $test=$self->search($self->{_table_name},$param_2);
    if($test){
        if($self->{_table_name} eq 'server'){
            my $stmt=qq(UPDATE server  set os='$param_3',storage='$param_4',checksum=md5\('$param_4'\)
             where  NAME='$param_2');
            my $rv = $dbh->do($stmt) or die $DBI::errstr;
            if( $rv < 0 ){
                 print $DBI::errstr;
            }
            else{
                print "Total number of rows updated : $rv\n";
            }
            $dbh->disconnect();
        }
        elsif($self->{_table_name} eq 'storage'){
            my $stmt = qq(UPDATE  storage  set owner='$param_3',capacity='$param_4'  where  NAME='$param_2');
            my $rv = $dbh->do($stmt) or die $DBI::errstr;
            if( $rv < 0 ){
                 print $DBI::errstr;
            }
            else{
                print "Total number of rows updated : $rv\n";
            }
            $dbh->disconnect();
        }
    }
    else{
        print "the records are exist!";
    }
}
sub create{
    my ($self)=shift;
    my $dbh=$self->connect;
    $self->{_table_name}=shift;
    my $param_2=shift;
    my $param_3=shift;
    my $param_4=shift;
    my $test=$self->search($self->{_table_name},$param_2);
    if($test){
        if($self->{_table_name} eq 'server'){
            my $md5 = Digest::MD5->new;
            $md5->add($param_2,$param_3,$param_4);
            my $digest = $md5->hexdigest;
            my $stmt=qq(insert into  server  (name,os,storage,checksum)values('$param_2','$param_3',
              '$param_4','$digest'));
            my $rv = $dbh->do($stmt) or die $DBI::errstr;
            if( $rv < 0 ){
                print $DBI::errstr;
            }
            else{
                print "records created successfully!\n";
            }
            $dbh->disconnect();
        }
        elsif($self->{_table_name} eq 'storage'){
            my $stmt = qq(insert into  storage  (name,owner,capacity)values('$param_2','$param_3',
              '$param_4'));
            my $rv = $dbh->do($stmt) or die $DBI::errstr;
            if( $rv < 0 ){
                print $DBI::errstr;
            }
            else{
                print "records created successfully!\n";
            }
            $dbh->disconnect();
        }
    }
    else{
        print "the records are exist!";
    }

}
sub select{
    my $self=shift;
    my $dbh=$self->connect;
       $self->{_table_name}=shift;
       $self->{_name}=shift;
    my $stmt = qq(SELECT *  from $self->{_table_name} where name='$self->{_name}');
    if($self->connect){
        my $sth = $dbh->prepare( $stmt );
        my $rv = $sth->execute() or die $DBI::errstr;
        if($rv < 0){
            print $DBI::errstr;
        }
        else{
            while(my @row = $sth->fetchrow_array()){
                print join("\t", @row)."\n";
            }
        }
    }

}
sub delete{
    my $self=shift;
    my $dbh=$self->connect;
       $self->{_table_name}=shift;
       $self->{_name}=shift;
    my $test=$self->search($self->{_table_name},$self->{_name});
    my $stmt = qq(DELETE from $self->{_table_name} where NAME='$self->{_name}');
    if($test){
        if($self->connect){
            my $rv = $dbh->do($stmt) or die $DBI::errstr;
            if($rv <0){
                print $DBI::errstr;
            }
            else{
                print "the records deleted successfully!";
            }
        }
        else{
             return 0

        }
    }
    else{
        return 0;
    }
}
1;