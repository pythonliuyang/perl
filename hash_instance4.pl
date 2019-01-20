#!/usr/bin/perl
%class = (
		"Jacob" => {
			"No"=>1237,
			"Chinese" =>82,
			"Math" =>98,
			"English" =>67,
		},
		"Michael" => {
			"No"=>1238,
			"Chinese" =>78,
			"Math" =>28,
			"English" =>86,
		},
		"Joshua" => {
			"No"=>1239,
			"Chinese"=>34,
			"Math"=>68,
			"English"=>99,
		},
		"Ethan" => {
			"No"=>1240,
			"Chinese"=>56,
			"Math"=>34,
			"English"=>67,
		},
		"Matthew" => {
			"No"=>1241,
			"Chinese"=>93,
			"Math"=>73,
			"English"=>85,
		},
		"Daniel" => {
			"No"=>1242,
			"Chinese"=>76,
			"Math"=>57,
			"English"=>76,
		},

		"Andrew" => {
			"No"=>1244,
			"Chinese"=>78,
			"Math"=>88,
			"English"=>58,
		},
		"Anthony" => {
			"No"=>1245,
			"Chinese"=>98,
			"Math"=>67,
			"English"=>87,
		},
		"William" => {
			"No"=>1246,
			"Chinese"=>94,
			"Math"=>86,
			"English"=>81,
		},
	);
my  %data1=();
my  %data2=();
print"----------this  is  chinese score--------------\n";
foreach my $keys(keys %class) {
    $data2{$keys}=$class{$keys}{"Chinese"}+$class{$keys}{"Math"}+$class{$keys}{"English"};
    if ($class{$keys}{"Chinese"} < 59) {
        $data1{"Chinese"}{"Num_59"}++;
    }
    elsif ($class{$keys}{"Chinese"} < 80) {
        $data1{"Chinese"}{"Num_80"}++;
    }
    else {
        $data1{"Chinese"}{"Num_80_100"}++;
    }

    if ($class{$keys}{"Math"} < 59) {
        $data1{"Math"}{"Num_59"}++;
    }
    elsif ($class{$keys}{"Math"} < 80) {
        $data1{"Math"}{"Num_80"}++;
    }
    else {
        $data1{"Math"}{"Num_80_100"}++;
    }
    if ($class{$keys}{"English"} < 59) {
        $data1{"English"}{"Num_59"}++;
    }
    elsif ($class{$keys}{"English"} < 80) {
        $data1{"English"}{"Num_80"}++;
    }
    else {
        $data1{"English"}{"Num_80_100"}++;
    }
}

foreach my $key1(keys %data1){
    foreach my $keys2(keys %{$data1{$key1}}){
        print"$key1:$keys2=>$data1{$key1}{$keys2}\n";
    }
}

my $count=0;
foreach my $key2(sort{$data2{$b} <=> $data2{$a}}keys %data2){
    print"$key2=>$data2{$key2}\n";
    $count++;
    if ($count >2){
        last;
    }
}