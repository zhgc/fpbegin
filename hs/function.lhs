
hello world

> main ::IO ()
> main = do {
>    putStrLn "give me ur name";
>    name <- getLine;
>    putStrLn $ "hello " ++name
>}

haskell不能这样学。

int main(){
    C语言
    printf("hello world");
    return 0;
}

从定义一个最普通的函数开始学起

> add :: Num a => a -> a -> a
> add a b = a+b

a是类型，也是类型变元。
a -> a -> a是函数类型
Num是类族
Num a =>是对a类型的约束
forall 定义变量






接受两个a类型的参数，返回一个a类型的参数

(a,a) -> a

柯里化

Num a =>

Int Float Num

《变量》


> v1 = "hello"
> n1 = 114
> l1 = [5,1,4]

v1,n1,l1是函数
区别是有一个，那就是他们没有参数。但仍然是函数。
零元函数。

+ Num 

《haskell里真的没有变量吗？》

《在haskell中，没有顺序分支循环，该怎么实现相应的效果？》

递归，高阶函数，map、filter，fold

> f :: Num a => [a] -> a
> f [] = 0
> f (x:_) = x

x:xs

已经定义完整
模式匹配

f l1 

总结：





















