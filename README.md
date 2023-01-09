# NeoVim

This is a highly opinionated [NeoVim](https://neovim.io/) configurations file

It is using [Packer](https://github.com/wbthomason/packer.nvim) as plugin manager

## Install NeoVim

Follow the steps from https://github.com/neovim/neovim/wiki/Installing-Neovim

## Add a alias

Add to your `.bashrc` or `.zshrc`

```bash
alias vim=nvim
```

## Check NeoVim's Health

Some plugins need additional packages installed like [NodeJs](https://nodejs.org/) or [Python](https://www.python.org/). Maybe it is a good time to have them set up

```bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# add the follow to the .bashrc if it is not there yet
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# install a version
nvm install stable
```

## Clone this configurations

Now you are good to install this vim configurations

```bash
git clone https://github.com/adroaldof/nvim-lua.git ~/.config/nvim
```

## Install Plugins

At first run of NeoVim you will need type the follow command to make the first plugin install

```bash
:PackerInstall
```

Any plugin change you will need to add it to the `lua/adr/packer.lua` file and make the setup to the `after/plugin` when necessary

---

Enjoy it :+1:
