s = [1,2,3]

match s:
    case []      : result = 0
    case [1,2]   : result = 1+2
    case [x,y]   : result = x + y
    case [x,y,z] : result = x + y + z
    case _       : pass # 下划线表示dont care。

# print(result)  # 输出6


def matchfunc(*args):
    match args:
        case (list(xs),list(ys)): # if isinstance(xs,list) and isinstance(ys,list):
            return [x+y for (x,y) in zip(xs,ys)]
        case (a,b):return a+b
        case (a,b,c):return a+b+c
        case (a,b,c,d):return a+b+c+d
    
print(matchfunc(1,2))
print(matchfunc(1,2,3))
print(matchfunc(1,2,3,4))
print(matchfunc([1,2,3,4,5],[6,7,8,9,0]))

# def fib(n):
#     match n:
#         case 0:return 0
#         case 1:return 1
#         case n:return fib(n-1) + fib(n-2)

# print(fib(10))