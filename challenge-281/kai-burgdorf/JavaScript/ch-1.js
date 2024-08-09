const inputValue = 'g5';
console.log( 
  ( (inputValue.split('')[1] % 2 == 1) ?
    ( (inputValue.split('')[0].charCodeAt(0)-96) % 2 != 0 ?  "false" : "true") :
    ( (inputValue.split('')[0].charCodeAt(0)-96) % 2 != 0 ?  "true" : "false") )
);
