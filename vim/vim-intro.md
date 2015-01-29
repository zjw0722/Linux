vim 使用简介
===
一、基本操作
---
* h/j/k/l	


四、多窗口操作
---
* :e filename		编辑另外一个文件
* :split filename 	水平分割窗口并打开另一个文件（分为上下两个）
* ctrl-w up arrow 	移动光标到上面一个窗口
* ctrl-w ctrl-w		移动光标到另一个窗口（循环）
* ctrl-w_			增加当前窗口的行数/列数
* ctrl-w=			使所有窗口大小相等
* 10 ctrl-w+			当前窗口增加十行/列
* :vsplit file		垂直分割窗口（分为左右两个）
* :sview file		和split一样，不过是只读的方式打开文件
* :hide 				关闭当前窗口
* :only				只保留当前窗口
* :ls 				显示当前的缓冲区
* :b 2				在当前窗口打开#2缓冲区