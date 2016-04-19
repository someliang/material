# -*- coding: utf-8 -*-
str_1 = '这是一个字符串'
str_2 = '这是第二个字符串'

#他们可以这样使用
str_3 = str_1 + str_2
print(str_3)

#当然，也可以把整型和字符相连，只是在连接之前要把整形强制转换成str
int_1 = 3

print(str_3 + str(int_1))
