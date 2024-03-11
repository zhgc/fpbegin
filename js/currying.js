"use strict"

function curryBynumber(f,n,xs){
    if (n==0){
        return f.apply(null,xs);
    }else{
        return (x=>curryBynumber(f,n-1,xs.concat([x])));
    }
}

function curry(f){
    return curryBynumber(f,f.length,[]);
}

this.a = "win"

let obj = {
    name : "zhzh",
    play :()=>{console.log(this.a)}
};

obj.play();



/*

js的类型系统混乱的一塌糊涂。

在 JavaScript 中有 6 种不同的数据类型：

string
number
boolean
object
function
symbol
3 种对象类型：

Object
Date
Array
2 个不包含任何值的数据类型：

null
undefined

*/

/*

for in循环在js中

for (i in xs){
    这里的i出乎意料的是一个索引而非元素。
    如果xs是数组那么i就是0，1，2，3，4..
    如果xs是对象或字典，那么就是key。
}

*/


/*

js中的this非常混乱，

在全局状态下this是global，
在函数中this也是global
在对象方法中this是对象
但是在箭头函数中this是global，即使箭头函数是对象方法

在html事件中this是当前html元素。

在事件处理器中this是当前html元素

在部分回调函数中this手动指定。

比如apply() call() bind()



*/


// const person = {
//     name: 'Alice',
//     age: 30,
//     greet: () => {
//         console.log(`Hello, my name is ${this.name} and I am ${this.age} years old.`);
//     }
// };

// person.greet();


function add3(a,b,c){
    return a+b+c;
}

console.log(curry(add3)(1)(2)(3));