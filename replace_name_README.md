#coding=utf-8
# replace_name README
这个文件是用来说明replace_name的使用方法和工作原理的
# 使用方法
replace_name --path /path/to/file  --old old_character  --new new_character
## 解释
replace_name为主程序的名称，--path指定要重命名文件的所在路径，--old是指将来需要被替换的字符串，--new是指将来用来替换旧字符串的字符。
## 另外注意
--path设置为点号"."表示当前目录
--new设置为""，可以用来将旧字符删除使用
# 工作原理
程序通过正则表达式找到旧字符所在的位置，然后将它的起始和终止位置中间的字符替换为给定的新的字符。
