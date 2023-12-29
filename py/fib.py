# def fib(n):
#     a,b = 0,1
#     for _ in range(n):
#         a,b = b,a+b
#     return a

# print(fib(10))


# def fib(n):
#     if n <= 1:
#         return n
#     else :
#         return fib(n-1) + fib(n-2)
    
# print(fib(10))

# def fib(n):
#     def fibloop(n,a,b):
#         if n == 0:
#             return a
#         else :
#             return fibloop(n-1,b,a+b)
#     return fibloop(n,0,1)

# print(fib(10))

# fib = lambda n : n if n <2 else fib(n-1) + fib(n-2)

# print(fib(10))

# fib = lambda n : (fibloop := lambda n,a,b: a if n == 0 else fibloop(n-1,b,a+b))(n,0,1)

# print(fib(10))

print(((lambda f:(lambda x:x(x))(lambda x:f(lambda *args : x(x)(*args))))(lambda g:lambda n,a,b: a if n == 0 else g(n-1,b,a+b)))(10,0,1))


# fibloop = lambda n,a,b: a if n == 0 else fibloop(n-1,b,a+b)


