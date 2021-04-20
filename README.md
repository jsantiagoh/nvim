# nvim
Nvim repository

## Installation

```
❯ mkdir -p ~/.config
❯ cd ~/.config
❯ git clone --recursive https://github.com/jsantiagoh/nvim.git 
```

## First run and packages

This setup uses [minpac](https://github.com/k-takata/minpac) , after installation run inside nvim


```
:call PackUpdate()
```

### Go Development

Just install go

## Python Development


Use a specific virtualenv for nvim as described in `:h provider-python`

```
> pyenv install 3.6.6
> pyenv virtualenv 3.6.6 py3nvim
> pyenv activate py3nvim
> pip install pynvim
> pyenv which python  # Note the path
> pip install -r requirements.txt
```
