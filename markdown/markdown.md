# Markdown语法
##区块元素
#### 一、段落和换行
一个Markdown段落是由一个或多个连续的文本行组成，它的前后要有一个以上的空行（空行的定义是显示上看起来像是空的，便会被视为空行。比如说，若某一行只包含空格和制表符，则该行也会被视为空行）。普通段落不该用空格或制表符来缩进。

「由一个或多个连续的文本行组成」这句话其实暗示了 Markdown 允许段落内的强迫换行（插入换行符），这个特性和其他大部分的 text-to-HTML 格式不一样（包括 Movable Type 的「Convert Line Breaks」选项），其它的格式会把每个换行符都转成 <br /> 标签。

如果你确实想要依赖 Markdown 来插入 <br /> 标签的话，在插入处先按入两个以上的空格然后回车。

的确，需要多费点事（多加空格）来产生 <br /> ，但是简单地「每个换行都转换为 <br />」的方法在 Markdown 中并不适合， Markdown 中 email 式的 区块引用 和多段落的 列表 在使用换行来排版的时候，不但更好用，还更方便阅读。
#### 二、标题
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
#### 三、区块引用 Blockquotes
markdown标记区块引用是使用类似email中用`>`的引用方式。如果你还熟悉在email中的引言部分，你就知道怎么在markdown文件中建立一个区块引用，那会看起来像是你自己先断好行，然后再每行的最前面加上`>`：

一直没有理解区块引用有什么效果，就照着抄吧：

```
> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
> 
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.
```
效果如下：

> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
> 
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.

#### 四、列表
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
#### 五、代码区块
要在markdown中建立代码块是很简单的，只要简单的缩进4个空格或者一个制表符就可以了。

	这是一个普通段落：
		这是一个代码块。
一个代码块会一直持续到没有缩进的那一行（或者文件结尾）

在代码块中，`&`，`<`，`>`会自动转成`HTML`实体，这样的方式让你非常容易使用markdown插入范例用的`HTML`原始码，只需要复制贴上，再加上缩进就可以了，剩下的事情，markdown帮你处理。
#### 六、分割线
你可以再一行中用三个以上的星号、减号、底线来建立一个分割线，行内不能有别的东西。你也可以在星号或者减号中间插入空格，例如下面几种写法都是可以的：

	* * *
	***
	*****
	- - -
	-----
***
##区段元素
#### 一、链接
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
隐式链接标记功能能让你可以省略指定链接标记，这种情形下，链接标记会视为等同于链接文字，要用隐式链接标记只要在链接文件后面加上一个空的方括号，如果你要让"Google"链接到google.com，你可以简化成：

	[Google][]
然后定义链接内容：

	[Google]:http::/google.com/
由于链接文字可能包括可能包含空白，所以这种简化型的标记内也许包含多个单词：

	Visit [Daring Fireball][] for more information
然后接着定义链接：

	[Daring Fireball]:http://daringfireball.net/
链接的定义可以放在文件中的任何一个地方，我比较偏好直接放在链接出现的段落后面，你也可以把它放在文件最前面，就想注释一样。

下面是一个参考式链接的范例：

	I get 10 times more traffic from [Google][1] than from
	[Yahoo][2] or [MSN][3].
	
	[1]:http://google.com/		"Google"
	[2]:http://search.yahool.com/ "Yahoo Search"
	[3]:http://search.msn.com/ "MSN Search"
如果改成用链接名称的方式写：
	
	I get 10 times more traffic from [Google][] than from
	[Yahoo][] or [MSN][].
	
	[google]:http://google.com/ "Google"
	[yahoo]:http://search.yahoo.com/ "Yahoo Search"
	[msn]:http://search.msn.com/ "MSN Search"
上面两种写法是一样的。

#### 二、强调
Markdown 使用星号(`*`)和底线(`_`)作为标记强调字词的符号，被`*`或`_`包围的字词会被转成用`<em>`标签包围，用两个`*`或者`_`包起来的话，则会转成`<strong>`，例如：

```
*single asterisks*
_single underscores_
**double asterisks**
__double underscores__
```
会转成：

```
<em>single asterisks</em>
<em>single underscores</em>
<strong>double asterisks</strong>
<strong>double underscores</strong>
```
你可以随表使用你喜欢的样式，唯一的限制是，你用什么符号开启标签，就用什么符号结束。

强调也可以直接插在文字中间：

```
un*frigging*believable
```
但是如果你的`*`和`_`两边都有空白的话，它们就只会被当做普通字符。

如果要在文字前后直接插入普通的星号或底线，你可以使用反斜线：

```
\*this text is surrounded by literal asterisks\*
```

#### 三、代码
如果你要标记一小段行内代码，你可以用反引号把它们包起来(`` ` ``)，例如：

	Use the `printf()` function.
会产生：

	<p>Use the <code>printf()</code> function.</p>
如果要在代码区段内插入反引号，你可以使用多个反引号来开启和结束代码区段：

	``There is a literal backtick (`) here.``
这段语法会产生：

	<p><code>There is a literal backtick (`) here.</code></p>
代码区段的起始和结束端都可以放入一个空白，起始端后面一个，结束段前面一个，这样你就可以再区段的一开始就插入反引号：

	A single backtick in a code span: `` ` ``
会产生：

	<p>A single backtick in a code apan:<code>`</code></p>
#### 四、图片
很明显地，要在纯文字应用中设计一个[自然]的语法来插入图片是有难度的

Markdown使用一种和链接很相似的语法来标记图片，同样也允许两种样式：行内式和参考式

行内式的图片语法看起来像是：

```
![Atl text](/path/to/img.jpg)
![Alt text](/path/to/img.jgp "Optional title")
```
详细叙述如下：

* 一个惊叹号`!`
* 接着一个方括号，里面放上图片的替代文字
* 接着一个普通括号，里面放上图片的网址，最后还可以用引号包住并加上选择性的'title'文字。

参考式的图片语法则长得像这样：

```
![Alt text][id]
```
[id]是图片参考的名称，图片参考的定义方式则和链接参考一样：

```
[id]: url/to/img.jpg "Optional title attribute"
```

到目前为止，Markdown还没有办法指定图片的宽高，如果你需要的话，你可以使用普通的`<img>`标签

##其他
#### 一、自动链接
Markdown支持以比较简短的自动链接形式来处理网址和电子邮件信箱，只要是用尖括号包起来，Markdown就会自动把它转成链接。一般网址的链接文件就和链接地址一样，例如：

```
<http://example.com/>
```
Markdown会转为：

```
<a href="http://example.com/">http://example.com/</a>
```
邮件的自动链接也很类似，只是Markdown会先做一个编码转换的过程，把文字字符转成16进位码的HTML实体，这样的格式可以糊弄一些不好的邮件收集机器人，例如：

```
<address@example.com>
```
Markdown会转成：

```
<a href="&#x6D;&#x61;i&#x6C;&#x74;&#x6F;:&#x61;&#x64;&#x64;&#x72;&#x65;
&#115;&#115;&#64;&#101;&#120;&#x61;&#109;&#x70;&#x6C;e&#x2E;&#99;&#111;
&#109;">&#x61;&#x64;&#x64;&#x72;&#x65;&#115;&#115;&#64;&#101;&#120;&#x61;
&#109;&#x70;&#x6C;e&#x2E;&#99;&#111;&#109;</a>
```
在浏览器里面，这段字串（其实是`<a href="mailto:address@example.com"> address@example.com</a>`）会变成一个可以点击的[address@example.com]链接

（这种作法虽然可以糊弄不少的机器人，但并不能全部挡下来，不过总比什么都不做好些。不管怎样，公开你的信箱终究会引来广告信件的。）

#### 二、反斜杠
Markdown可以利用反斜杠来插入一些在语法中有其它意义的符号，例如：如果你想要用星号加载文字旁边的方式来做出强调效果（但不用`<em>`标签），你可以在星号的前面加上反斜杠：

```
\*literal asterisks*\
```
Markdown支持一下这些符号前面加上反斜杠来帮助插入普通的符号：

```
\   反斜线
`   反引号
*   星号
_   底线
{}  花括号
[]  方括号
()  括弧
#   井字号
+   加号
-   减号
.   英文句点
!   惊叹号
```

参考：[Markdown语法说明](http://wowubuntu.com/markdown/ "Markdown 语法说明")