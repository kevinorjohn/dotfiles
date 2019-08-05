Environment Setting
===================

This script helps you efficently set up the configuration for 
Vim, Bash, Input and Tmux on Unix-like system.

Usage
-----

To set up the environmnet, please run the following command:
``` 
./install.sh
``` 


Vim configuration
-----------------
The `.vimrc` installs many plugins in `~/.vim/plugged` and maps the leader key \<Leader\> to the whitespace.
Therefore, some useful shortcuts are defined as follows.

switch to left/right panes
```
<Leader> + h/l
```

turn on/off NerdTree plugin
```
<Leader> + n
```

search one char by Easymotion plugin
```
<Leader> + s
```

delete trialing whitespaces
```
<Leader> + <space>
```

comment a line
```
<Leader> + c + c
```

uncomment a line
```
<Leader> + c + u
```

add ipdb/pdb breakpoint for python
```
<Leader> + b + b
```


Tmux configuration
------------------
The `tmux.conf` is stolen from [Oh My Tmux!](https://github.com/gpakosz/.tmux). 
To customize your own setting, please modify the file `tmux.conf.local`. 


Credits
-------

This script is written by Kuen-Han Tsai
