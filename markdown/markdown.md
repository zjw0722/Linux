# markdown语法
## 一、标题
markdown支持两个形式的标题语法，类[Setext](http://docutils.sourceforge.net/mirror/setext.html)和类[atx](http://www.aaronsw.com/2002/atx/)形式。
类Setext形式是用底限的形式，利用`=`(最高阶标题)和`-`(第二阶标题)，例如：

	This is an H1
	=============
	This is an h2
	-------------
任何数据量的`=`和`-`都可以有效果且效果一直，即任意数量的`=`相当于H1标题，而任意数量的`-`相当于H2标题
类Atx形式则是在行首插入1到6个`#`，对应标题1到标题6阶，例如：

	# 这是H1

	## 这是H2

	###### 这是H6
你可以选择性的_闭合_类atx样式的标题，这纯粹只是美观用的，若是觉得这样看起来比较舒适，你就可以再行尾加上`#`，而行尾的`#`数量也不用和开头一样（行首的`#`数量决定标题的阶数）
## 二、区块引用 Blockquotes
markdown标记区块引用是使用类似email中用`>`的引用方式。如果你还熟悉在email中的引言部分，你就知道怎么在markdown文件中建立一个区块引用，那会看起来像是你自己先断好行，然后再每行的最前面加上`>`：
## 三、列表
markdown支持有序列表和无序列表
无序列表使用星号、加号或者减号作为列表标记：

	* Red
	* Green
	* Blue
等同于：

	+ Red
	+ Green
	+ Blue

也等同于：

	- Red
	- Green
	- Blue
有序列表使用数字接着一个英文句点：

	1. Bird
	2. Mchale
	3. Parish
很中要的一点是，你在列表标记上使用的数字并不会输出`HTML`的结果，这句话的意思是，即使你的数字不是按顺序的，也不会影响最终`HTML`的输出。例如：

	1. Red
	1. Green
	1. Blue
或者

	3. Bird
	1. Mchale
	8. Parish
对最终的`HTML`显示都是不影响的

列表项目可以包含多个段落，每个项目下的段落都必须缩进4个空格或者1个制表符，或者只缩进每个段落的首行也可以。例如：

	1.	This is a list item with two paragraphs. 	Lorem ipsum dolor
    	sit amet, consectetuer adipiscing elit. Aliquam hendrerit
   		mi posuere lectus.

		Vestibulum enim wisi, viverra nec, fringilla in, laoreet
   	 	vitae, risus. Donec sit amet nisl. Aliquam semper ipsum
    	sit amet velit.
	2. 	Suspendisse id sem consectetuer libero 	luctus adipiscing.
或者
	1. 	This is a list item with two paragraphs.
		
		This is the second paragraph in the list item. You're
only required to indent the first line. Lorem ipsum dolor
sit amet, consectetuer adipiscing elit.
	2. 	Another item in the same list.
如果要在列表项目内放进引用，那`>`就需要缩进

	*	A list item with a blockquote:
		
		> This is a blockquote
    	> inside a list item.
如果要放代码块的话，该区块就需要缩进两次，也就是8个空格或者两个制表符

	*	一列表项包含一个列表区块：
			<代码写在这>
## 四、代码区块
要在markdown中建立代码块是很简单的，只要简单的缩进4个空格或者一个制表符就可以了。

	这是一个普通段落：
		这是一个代码块。
一个代码块会一直持续到没有缩进的那一行（或者文件结尾）

在代码块中，`&`，`<`，`>`会自动转成`HTML`实体，这样的方式让你非常容易使用markdown插入范例用的`HTML`原始码，只需要复制贴上，再加上缩进就可以了，剩下的事情，markdown帮你处理。
## 五、分割线
你可以再一行中用三个以上的星号、减号、底线来建立一个分割线，行内不能有别的东西。你也可以在星号或者减号中间插入空格，例如下面几种写法都是可以的：

	* * *
	***
	*****
	- - -
	-----
***
## 六、区段元素
#### 链接
markdown支持两种形式的链接语法：行内式和参考式两种形式。

不管是哪种方式，链接文字都用[方括号]来标记。

要建立一个行内式的链接，只要在方括号后面紧挨着圆括号并插入网址链接即可，如果你还要加上链接的title文件，只要在网址后面，用双引号把title文件包起来即可了，例如：

	This is [an example](http://example.com/ "title") inline link.
	[This link](http://example.com/) has no title attribute.
效果如下：

This is [an example](http://example.com/ "title") inline link.

[This link](http://example.com/) has no title attribute.
如果你要链接到的是同主机的资源，可以使用相对路径：

	See my [about](/about/) page for details.
参考式的链接是在链接文件的括号后面再接上另一个方括号，而在第二个方括号里面要填入用以辨识链接的标记：

	This is [an axample][id] reference-style link.
你也可以选择性地在两个方括号中间加上一个空格：

	This is [an example] [id] reference-style link.
接着在文件的任意处，你可以把这个标记的链接内容定义出来：

	[id]: http://example.com/ "Optional Title Here"
链接内容定义的形式为：

* 方括号（前面可以选择性加上至多三个空格来缩进），里面输入链接文字
* 接着一个冒号
* 接着一个以上的空格或制表符
* 接着链接的网址
* 选择性地接着title内容，可以用单引号、双引号或者括弧包着

下面这三种链接的定义都是相同的：

	[foo]: http://example.com/ "Optional Title Here"
	[foo]: http://example.com/ 'Optional Title Here'
	[foo]: http://example.com/ (Optional Title Here)
链接地址也可以用尖括号包起来：

	[id]: <http://example.com/> "Optional Title Here"
你也可以把title属性放到下一行，也可以加一些缩进

网址定义只有在产生链接的时候用到，并不会直接出现文件中

链接辨别标签可以有字母、数字、空白和标点符号，但是并不区分大小写，因此下面的两个链接是一样的：

	[link text][a]
	[link text][A]
