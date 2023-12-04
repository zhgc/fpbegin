function add(a,b){
    return a+b;
}



function addCurry(a){
    function addA(b){
        return a + b;
    }
    return addA;
}

function add3Num(a){
    function addA(b){
        function addB(c){
            return a + b + c;
        }
        return addB;
    }
    return addA;
}


console.log(add(1,2));
console.log(addCurry(1)(5));
console.log(add3Num(3)(4)(5));


// js中lambda的一些用处。
let add3Lambda = (a) => (b) => (c) => a + b + c;

console.log(add3Lambda(5)(6)(7));