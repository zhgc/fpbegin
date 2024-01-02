# 循环定义
# def fib(n):
#     a,b = 0,1
#     for _ in range(n):
#         a,b = b,a+b
#     return a

# print(fib(10))

# def fibs():
#     yield (a := 0)
#     yield (b := 1)
#     while True : yield (a+b);a,b = b,a+b

# g = fibs()
# for _ in range(11):
#     print(next(g))

# 递归定义，逆推
def fib(n):
    if n == 0 or n == 1:
        return n
    else :
        return fib(n-1) + fib(n-2)
    
print(fib(40))

# 递归定义，顺推

# def fib(n):
#     return fibloop(n,0,1)

# def fibloop(n,a,b):
#     if n == 0:
#         return a
#     elif n == 1:
#         return b
#     else :
#         return fibloop(n-1,b,a+b)

# print(fib(1000))

