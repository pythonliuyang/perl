#!/usr/bin/perl
$class=("jacob"=>{
     "No"=>1238,
    "Chinese"=>78,
    "Math"=>28,
    "English"=>86,
     },
    "Joshua"=>{
      "No"=>1239,
    "Chinese"=>34,
    "Math"=>68,
    "English"=>99,
    },
    "Ethan"=>{
       "No"=>1240,
    "Chinese"=>56,
    "Math"=>34,
    "English"=>67,
    }
);

my %data2=();
print"--------------yuwen--------------------\n";
foreach my $keys(keys %class){
    $data2{$keys}=$class{$keys}{Chinese}+$class{$keys}{Math}+$class{$keys}{English};
    if($class{$keys}{Chinese} < 59){
        $data1{Chinese}{"Num_59"}++;
    }
    elsif($class{$keys}{Chinese}<80){
        $data1{Chinese}{"Num_59_80"}++;
    }
    else{
        $data1{Chinese}{"Num_80_100"}++;
    }
}

print"---------------------shuxue-------------------\n";
foreach my $keys(keys %class){
    $data2{$keys}=$class{$keys}{Chinese}+$class{$keys}{Math}+$class{$keys}{English};
    if($class{$keys}{Math} < 59){
        $data1{Math}{"Num_59"}++;
    }
    elsif($class{$keys}{Math}<80){
        $data1{Math}{"Num_59_80"}++;
    }
    else{
        $data1{Math}{"Num_80_100"}++;
    }
}
print"---------------------English-------------------\n";
foreach my $keys(keys %class){
    $data2{$keys}=$class{$keys}{Chinese}+$class{$keys}{Math}+$class{$keys}{English};
    if($class{$keys}{Math} < 59){
        $data1{English}{"Num_59"}++;
    }
    elsif($class{$keys}{Math}<80){
        $data1{English}{"Num_59_80"}++;
    }
    else{
        $data1{English}{"Num_80_100"}++;
    }
}
my %data1=();

$data1{"Chinese"}{"Score"}{$class{$name}{"Chinese"}}=$class{$name}{"No"};
$data1{"Math"}{"Score"}{$class{$name}{"Math"}}=$class{$name}{"No"};
$data1{"English"}{"Score"}{$class{$name}{"English"}}=$class{$name}{"No"};
print"Chinese < 59  $data1{Chinese}{Num_59}\n";
print"Chinese < 80  $data1{Chinese}{Num_59_80}\n";
print"80< Chinese<100  $data1{Chinese}{Num_80_100}\n";