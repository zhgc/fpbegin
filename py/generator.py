def gen():
    yield "hello,zhzh"
    a = yield
    b = yield
    yield a+b

g1 = gen()
print(next(g1))
g1.send("hello")
next(g1) 
g1.send("world")
print(next(g1))