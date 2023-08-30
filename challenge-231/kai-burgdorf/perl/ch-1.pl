#!/usr/bin/env perl

@my_arr = (3, 2, 1, 4);
#@my_arr = (3, 1);
#@my_arr = (2, 1, 3);
print "Input: ";
print @my_arr;
print "\n";

$min = $my_arr[0];
$max = $my_arr[0];

foreach ( @my_arr ) {
  $value = $_;
	if($min > $value) {
    $min = $value;
  }
	if($max < $value) {
    $max = $value;
	}
}

@my_output = ();

foreach ( @my_arr ) {
  if($_ != $min && $_ != $max) {
    push(@my_output, $_);
  }
}

print "Output: ";
if(scalar @my_output > 0) {
  print @my_output;
}
else {
  print "-1";
}
print "\n";

#		//int[] input = {3, 1};
#		int[] input = {2, 1, 3};
#
#		Array.ForEach<int>(input, (int x) => { Console.Write(x + ", "); });
#		Console.WriteLine();
#		
#		int min = int.MaxValue;
#		int max = int.MinValue;
#		
#		Array.ForEach<int>(input, (int x) => {
#			if(min > x) {
#				min = x;
#			}
#			if(max < x) {
#				max = x;
#			}
#		});
#		
#		IEnumerable<int> output = from a in input where a != min && a != max select a;
#		
#		if(output.Any()) {
#			output.ToList().ForEach((int x) => Console.Write(x + ", "));
#		}
#		else {
#			Console.WriteLine("-1");
#		}
#	
