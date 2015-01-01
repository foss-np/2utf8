# 2utf8

convert to utf-8!

![Creative Commons Attribution-NonCommercial-ShareAlike 3.0](http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png)

2utf8 © 2013 to the 2utf8 authors.
___

#### HOW-TO USE

	$ ./main.sh -h
        Usage: 	2utf8 [Option] ...
	        -i | --input    file input
                -f | --f        font
                -t | --type     plain(default), xml, doc, docx, pdf
                -h | --help     display this message
                -v | --version  version information


###### Note: *Terminal output may not look :poop: pretty*

#### Setting up

```bash
    $ git clone https://github.com/foss-np/2utf8
    $ cd 2utf8
    $ ./configure
    $ sudo make install    
```


#### Quick Test

	 $ ./main.sh a s d f
	ब क म ा

###### Note: *You might wanna try in gedit/emacs and do built*


### Why  to do this ?

Problem of the Preeti and other non-unicode fonts terrible!

in summary:

```
आ = अ + ा
ओ = अ  + ा + े
ई = इ + र + ्
```

which is the disaster when we reach झ, त्र, क्ष, फ, र्


****

# FAQ
##### Why again unicode converter ?

**A.** Its because earlier one was in java, Decided not to wasting my hard-disk space or memory for java for stupid simple converter.

##### Why do in bash are you porting?

**A.** Bash in quite fast and dirty approach to do the work. Yes, it has been ported to __js__ and __python3__ by [spradhan][sapradhan]@[nep-ttf2utf][ttf2]

##### Still Don't get what you are looking for :disappointed:?

**A.** No worries post it into [issue][issue] with label ***FAQ***

[issue]: https://github.com/foss-np/2utf8/issues/new
[preeti]: http://1.bp.blogspot.com/-N79TrOsQZ2M/TdC_nSUZjoI/AAAAAAAAAu4/VkGIjZQDVtI/s1600/ananda%2Bakchyar_keyboard.jpg
[ttf2]: https://github.com/sapradhan/nep-ttf2utf
[sapradhan]: https://github.com/sapradhan
