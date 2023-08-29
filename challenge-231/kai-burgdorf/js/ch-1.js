var input = [3, 2, 1, 4];
//var input = [3, 2];
//var input = [2, 1, 3];
console.log(input);

var min = input[0];
var max = input[0];

input.forEach((x) => {
  if(x < min) min = x;
  if(x > max) max = x;
});

var output = [...input.filter(x => x != min && x != max)];
(output.length > 0) ? console.log(output) : console.log("-1");
