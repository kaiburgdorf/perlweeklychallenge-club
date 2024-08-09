//let words1 = ["Perl", "is", "my", "friend"]
//let words2 = ["Perl", "and", "Raku", "are", "friend"]

let words1 = ["Perl", "is", "imperative", "Lisp", "is", "functional"]
let words2 = ["Crystal", "is", "similar", "to", "Ruby"]

let counter = 0;

//let tmp = [];
//
//words1.forEach((w1, i) => { 
//    if(!words1noDuplicates.includes(w1)) {
//        words1noDuplicates.push(w1);
//    }
//    else {
//        words1.splice(i, 1);
//        const firstAppearance = words1.indexOf(w1);
//        if( firstAppearance >= -1) words1.splice(firstAppearance, 1);
//    }
//});
//tmp = [];
//words2.forEach((w2, i) => { if(!words2noDuplicates.includes(w2)) words2noDuplicates.push(w2) });
//
//console.log(words1noDuplicates);
//console.log(words2noDuplicates);
//console.log(words1);




words1.forEach((w1, i) => {
    console.log([[words1].splice(i, 1)]);
    if( [[words1].splice(i, 1)].indexOf(w1) == -1) {    //avoid duplicates in words1
        console.log("no duplicate word: " + w1);
        let w2counter = 0;
        words2.forEach((w2, j) => {
            if(w1 === w2) {
                console.log(w2);
                w2counter++;  //needs condition for duplicates also
            }
        });
        if(w2counter == 1) counter++;
    }
});

console.log(counter);
