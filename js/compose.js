function compose(f,g){
    function fg(x){
        return f(g(x));
    }
    return fg;
}

function add3(x){
    return x + 3;
}

function double(x){
    return x * 2;
}

console.log(compose(add3,double)(2));