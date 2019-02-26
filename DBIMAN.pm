package DBIMAN;
use strict;
use warnings FATAL => 'all';
use DBI;
use Digest::MD5;
sub connect {
    my $driver   = "Pg";
    my $database = "test";
    my $dsn = "DBI:$driver:dbname=$database;host=127.0.0.1;port=5432";
    my $userid = "postgres";
    my $password = "centos";
    my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
                      or die $DBI::errstr;
    print "Opened database successfully\n";
    return $dbh;
}
sub insert{
    my @data=@_;
    my $dbh=DBIMAN->connect;
    my $tablename=pop @data;
    if($tablename eq "vm"){
        my $stmt = qq(INSERT INTO $tablename values('$data[1]','$data[2]','$data[3]'));
        my $rv = $dbh->do($stmt) or die $DBI::errstr;
        print "Records created successfully\n";
        my $md5 = Digest::MD5->new;
        $md5->add($data[1], $data[2],$data[3]);
        my $digest = $md5->hexdigest;
        print"Digest is $digest\n";
        $dbh->disconnect();

    }
    else{
        my $stmt = qq(INSERT INTO $tablename values('$data[1]','$data[2]'));
        my $rv = $dbh->do($stmt) or die $DBI::errstr;
        print "Records created successfully\n";
        my $md5 = Digest::MD5->new;
        $md5->add($data[1], $data[2]);
        my $digest = $md5->hexdigest;
        print"Digest is $digest\n";
        $dbh->disconnect();
    }

}
sub select{
    my $dbh=DBIMAN->connect;
    my $tablename=pop @_;
    if($tablename eq "vm"){
        my $stmt = qq(SELECT  *  from vm);
        my $sth = $dbh->prepare( $stmt );
        my $rv = $sth->execute() or die $DBI::errstr;
        if($rv < 0){
            print $DBI::errstr;}
        while(my @row = $sth->fetchrow_array()) {
        print "NAME = ". $row[0] . "\n";
        print "OS = ". $row[1] ."\n";
        print "STORAGE = ". $row[2] ."\n\n";
        }

          $dbh->disconnect();
    }
    else{
        my $stmt = qq(SELECT *  from storage);
        my $sth = $dbh->prepare( $stmt );
        my $rv = $sth->execute() or die $DBI::errstr;
        if($rv < 0){
            print $DBI::errstr;}
        while(my @row = $sth->fetchrow_array()) {
        print "NAME = ". $row[0] . "\n";
        print "CAPACITY = ". $row[1] ."\n\n";
        }
        $dbh->disconnect();
    }

}
sub delete{
    my $dbh=DBIMAN->connect;
    my $tablename=pop @_;
    my @data=@_;
    if($tablename eq "vm"){
        my $stmt = qq(DELETE from $tablename where NAME='$data[1]');
        my $rv = $dbh->do($stmt) or die $DBI::errstr;
        if( $rv < 0 ){
            print $DBI::errstr;
        }
        else{
            print "Total number of rows deleted : $rv\n";
        }
        $dbh->disconnect();
    }
    else{
        my $stmt = qq(DELETE from $tablename where NAME='$data[1]');
        my $rv = $dbh->do($stmt) or die $DBI::errstr;
        if( $rv < 0 ){
            print $DBI::errstr;
        }
        else{
            print "Total number of rows deleted : $rv\n";
        }
        $dbh->disconnect();
    }
}
sub update{
    my $dbh=DBIMAN->connect;
    my @data=@_;
    my $tablename=pop @_;
    if($tablename eq "vm"){
        my $stmt = qq(UPDATE $tablename set STORAGE='$data[1]'  where  NAME='$data[2]');
        my $rv = $dbh->do($stmt) or die $DBI::errstr;
        if( $rv < 0 ){
           print $DBI::errstr;}
        else{

            print "Total number of rows updated : $rv\n";
        }
        $dbh->disconnect();
    }
    else{
        my $stmt = qq(UPDATE $tablename set CAPACITY='$data[1]'  where NAME='$data[2]');
        my $rv = $dbh->do($stmt) or die $DBI::errstr;
        if( $rv < 0 ){
           print $DBI::errstr;}
        else{
             print "Total number of rows updated : $rv\n";
        }
        $dbh->disconnect();
    }
}
1;