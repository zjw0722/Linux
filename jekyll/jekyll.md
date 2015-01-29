jekyll
===
jekyll是一个用ruby写的，生成静态网站的程序，当你的站点使用jekyll时，jekyll会遍历你的站点，来寻找需要处理的文件，任何具有YAML的前置数据的文件都将会被处理，每一个这样的文件，jekyll都会通过liquid模板系统使用许多可用的页面变量。
jekyll目录及一些说明
---
> jekyll标准目录树

```
_config.yml		jekyll的配置文件
_includes		include 文件所在的文件夹
_layouts		模板文件夹
_posts			自己要发布的内容
_sites			预览时产生的文件都放在该文件夹中
```
jekyll的安装及配置
---
* _includes文件夹中所放的文件时最终要放到模板中的一些代码片段
* _layouts中放的一些模板，模板是用来包含page或post内容的。jekyll的模板使用HTML语法来写，并包含YAML Front Matter。所有的模板都可用liquid来与网站进行交互。所有的模板都可以使用全局变量site和page，site变量包含该网站所有可以接触得到的内容和元数据（meta-data），page变量包含的是当前渲染的page和post的所有所有可以接触得到的数据。
* _post文件夹中放的是自己要发布的post文章。post文件的命名规则为YEAR-MONTH-DATE-title.md，使用rake post会自动将post文件命令合适。而对于page，所有放在根目录下或不以下划线开头的文件夹中有格式的文件都会被jekyll处理成page。这是说的有格式是指文件含有YAML Front Matter。所有的post和page都要用Markdown或者textle或者HTML语法来写，并可以包含liquid模板的语法。还要有YAML Front Matter（jekyll只处理具有YAML Front Matter的文件）。YAML Front Matter必须放在文件的开头，一对---之间，用户可以再这一对之间设置预先定义的变量或者用户自己的数据
jekyll模板全局变量
---
