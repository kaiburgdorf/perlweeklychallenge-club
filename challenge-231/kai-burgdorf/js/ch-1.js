var input = [3, 2, 1, 4];
console.log(input);

var min = input[0];
var max = input[0];

input.forEach((x) => {
	if(x < min) min = x;
  if(x > max) max = x;
});

var output = [...input.filter(x => x != min && x != max)];

console.log(output);
