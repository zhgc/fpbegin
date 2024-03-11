# Y = \f -> (\x -> f (x x)) (\x -> f (x x))
# w = \x -> x x
# W = w w
# Y = \f -> w (\x -> f (w x))

w = lambda x:x(x)
Y = lambda f:w(lambda x:f(lambda *args:w(x)(*args)))

fix = lambda f:(g := f(lambda *args:g(*args)))

# def fix2(f):
#     def fg(*args):
#         return g(*args)
#     g = f(fg)
#     return g 

fib_ = lambda g:lambda n : n if n < 2 else g(n-1) + g(n-2)

fib = Y(fib_)

fib2 = fix(fib_)

# fib3 = fix2(fib_)
print(fib(10)) # 答案是55
print(fib2(10))
# print(fib3(10))