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
	my %data_1 = ();
	## data_1 = {
	##			"课程名" => {
	##						"不及格个数“ => "值"							##Num_59
	##						"优良个数“ => "值"								##Num_60_79
	##						"优秀个数“ => "值"								##Num_80_100
	##						"分数" => 	”具体分数“ => “学号"				##score
	##			}
	## }

	my %data_2 = ();
	## data_2 = {
	##			"姓名" => 总分
	##		}

	foreach $name(keys %class)
	{
		##计算总分
		$data_2{$name}= $data_2{$name} + $class{$name}{"Chinese"} + $class{$name}{"Math"} + $class{$name}{"English"};
		## 语文成绩统计
		if ($class{$name}{"Chinese"} < 59) {
			$data_1{"Chinese"}{"Num_59"}++ ;
		}
		elsif ($class{$name}{"Chinese"} < 80) {
			$data_1{"Chinese"}{"Num_60_79"}++ ;
		}
		else	{$data_1{"Chinese"}{"Num_80_100"}++ ;}

		##数学成绩统计
		if ($class{$name}{"Math"} < 59) {
			$data_1{"Math"}{"Num_59"}++ ;
		}
		elsif ($class{$name}{"Math"} < 80) {
			$data_1{"Math"}{"Num_60_79"}++ ;
		}
		else	{$data_1{"Math"}{"Num_80_100"}++ ;}
	#	$data_1{"Math"}{"Num_59"}++ if ($class{$name}{"Chinese"} < 59);

		##英语成绩统计
		if ($class{$name}{"English"} < 59) {
			$data_1{"English"}{"Num_59"}++ ;
		}
		elsif ($class{$name}{"English"} < 80) {
			$data_1{"English"}{"Num_60_79"}++ ;
		}
		else	{$data_1{"English"}{"Num_80_100"}++ ;}

		##分数记录, data_1 = {"课程名" => {”分数" => "具体分数" => "学号“}
		$data_1{"Chinese"}{"score"}{$class{$name}{"Chinese"}} = $class{$name}{"No"};
		$data_1{"Math"}{"score"}{$class{$name}{"Math"}} = $class{$name}{"No"};
		$data_1{"English"}{"score"}{$class{$name}{"English"}} = $class{$name}{"No"};
	}

	## data_1 = {
	##			"课程名" => {
	##						"不及格个数“ => "值"							##Num_59
	##						"优良个数“ => "值"								##Num_60_79
	##						"优秀个数“ => "值"								##Num_80_100
	##						"分数" => 	”具体分数“ => “学号"				##score
	##			}
	## }

	printf"Statistics:\n";
	printf"Chinese:\n";
	printf"Chinese <59:     $data_1{'Chinese'}{\"Num_59\"}\n";
	printf"Chinese 59< <80: $data_1{\"Chinese\"}{\"Num_60_79\"}\n";
	printf"Chinese >80:     $data_1{\"Chinese\"}{\"Num_80_100\"}\n";
	printf"Top 3:\n";
	my $count = 0;
	foreach $number(sort {$b <=> $a} keys %{$data_1{"Chinese"}{"score"}})
	{
		printf"$data_1{\"Chinese\"}{\"score\"}{$number}  $number\n";
		$count ++;
		if($count > 2) {last;}
	}

	printf"----------------------------\n";
	printf"Math:\n";
	printf"Math <59:     $data_1{'Math'}{\"Num_59\"}\n";
	printf"Math 59< <80: $data_1{\"Math\"}{\"Num_60_79\"}\n";
	printf"Math >80:     $data_1{\"Math\"}{\"Num_80_100\"}\n";
	printf"Top 3:\n";

	my $count = 0;
	foreach $number(sort {$b <=> $a} keys %{$data_1{"Math"}{"score"}})
	{
		printf"$data_1{\"Math\"}{\"score\"}{$number}  $number\n";
		$count ++;
		if($count > 2) {last;}
	}

	printf"----------------------------\n";
	printf"English:\n";
	printf"English <59:     $data_1{\"English\"}{\"Num_59\"}\n";
	printf"English 59< <80: $data_1{\"English\"}{\"Num_60_79\"}\n";
	printf"English >80:     $data_1{\"English\"}{\"Num_80_100\"}\n";
	printf"Top 3:\n";
	my $count = 0;
	foreach $number(sort {$b <=> $a} keys %{$data_1{"English"}{"score"}})
	{
		printf"$data_1{\"English\"}{\"score\"}{$number}  $number\n";
		$count ++;
		if($count > 2) {last;}
	}

	## data_2 = {
	##			"姓名" => 总分
	##		}

	printf"----------------------------\n";
	printf"Total score Top 3\n";
	$count = 0;
	foreach $name( sort{$data_2{$b} cmp $data_2{$a}} keys %data_2){
		printf"$name     $data_2{$name}\n";
		$count ++;
		if($count > 2) {last;}
	}