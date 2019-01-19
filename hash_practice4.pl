#!/usr/bin/perl
my %hash_A=("food"=>"fruite","ting"=>"book");
my %hash_B=("fruite"=>{
    "round1"=>"apple",
    "round2"=>"pear",
    },
    "book"=>{
    "red"=>"king of the quen",
    "green"=>"forest",
    }
);
my $value=exists ($hash_A{"food"});
print"$value\n";
while(($keys,$values)=each(%hash_A)){
    print"$keys=>$values\n";
}


while(($key1,$key2)=each(%ENV)){
    print"$key1=>$key2\n";
}



my %hash_C=reverse %hash_A;
my %hash_D=reverse %hash_B;
foreach$keys (keys %hash_C){
       print"$keys=>$hash_C{$keys}\n";
}
foreach $keys2(keys %hash_D){
    print"$keys2=>$hash_D{$keys2}\n"
}

foreach my $key(keys %hash_B){

        foreach $key2(keys %{$hash_B{$key}}){
            print"$key2=>$hash_B{$key}{$key2}\n";
        }
}

