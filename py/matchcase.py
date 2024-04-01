"""
《终极无敌炸裂强的语言特性——模式匹配》

《超越真实直觉的程序设计艺术——编程范式中的立体主义——模式匹配》

《xx分钟零基础xx速成课 | 模式匹配》
"""

"""
switch():
    case 
    case

match():
    case
    case
"""
# 就是单纯的模式匹配
# s = 4
# match s:
#     # case [1,2,3]:
#     case list(s):r = sum(s) # 类型匹配
#                             # if 。。。 # 条件守卫
#     case 4:r = 4 #字面量匹配
#     case [x,y,z]:r = x+y+z  # 解包赋值 析构


# (x,y) = (1,2)

# (x,y) = (y,x)


# print(x,y)

# 函数定义中的模式匹配
# def matchfunc(*args):
#     match args:
#         case (int(x),int(y),int(z)):r = x+y+z
#         case (list(xs),):r = sum(xs)
#         case (list(xs),list(ys)): r = [ x+y for x,y in zip(xs,ys)]
#     return r

# print(matchfunc(1,2,3))
# print(matchfunc([1,2,3,4]))
# print(matchfunc([1,2,3,4,5],[6,7,8,9,9]))

# 定义一个函数
def fib(n):
    match n:
        case 0:return 0
        case 1:return 1
        case n:return (fib(n-1) + fib(n-2))
print(fib(10))


'''
python中match case语句

首先，是一个语句，而非表达式。

它可以匹配字面量，也可以析构对象

支持条件守卫

非常适合用来处理函数参数。
'''