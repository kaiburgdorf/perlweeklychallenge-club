using System;
using System.Collections.Generic;
using System.Linq;
					
public class Program
{
	public static void Main()
	{
		//int[] input = {3, 2, 1, 4};
		//int[] input = {3, 1};
		int[] input = {2, 1, 3};

		Array.ForEach<int>(input, (int x) => { Console.Write(x + ", "); });
		Console.WriteLine();
		
		int min = int.MaxValue;
		int max = int.MinValue;
		
		Array.ForEach<int>(input, (int x) => {
			if(min > x) {
				min = x;
			}
			if(max < x) {
				max = x;
			}
		});
		
		IEnumerable<int> output = from a in input where a != min && a != max select a;
		
		if(output.Any()) {
			output.ToList().ForEach((int x) => Console.Write(x + ", "));
		}
		else {
			Console.WriteLine("-1");
		}
	}
}



/*
You are given an array of distinct integers.

Write a script to find all elements that is neither minimum nor maximum. Return -1 if you can’t.

Example 1
Input: @ints = (3, 2, 1, 4)
Output: (3, 2)

The minimum is 1 and maximum is 4 in the given array. So (3, 2) is neither min nor max.
Example 2
Input: @ints = (3, 1)
Output: -1
Example 3
Input: @ints = (2, 1, 3)
Output: (2)

The minimum is 1 and maximum is 3 in the given array. So 2 is neither min nor max.

*/
