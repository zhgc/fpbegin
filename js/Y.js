let w = x=>x(x);

let y = f=>w(x=>f((...args)=>w(x)(...args)));

let fix = f=>{let g = f((...args)=>g(...args));return g};

let fib_ = g=>n=> (n<2) ? n : g(n-1) + g(n-2);

let fib = y(fib_);
let fib2 = fix(fib_);

console.log(fib(10));
console.log(fib2(11));