## Old vs. new dotfiles

I renamed and archived my old dotfiles repo (now available [here](https://github.com/StevenTammen/old-dotfiles)).

In the past few years, I was primarily Windows-only, using VSCode as my primary editor, and running the odd `bash` command or two off StackOverflow using the vanilla git-bash cygwin/mintty shell that comes packaged with git when you install it on Windows.

Only now that I am trying to actively script more things am I turning to WSL Ubuntu again, this time using `xonsh` as my primary shell instead of `fish`. The plan is to use Python scripts to script all the things. I'm probably mostly just going to stick with Python itself for scripts that I write and save, and just use the xonsh interpreter for any ad-hoc stuff that comes up. The xonsh syntax isn't nearly so horrifying as normal shell scripting languages (since it basically is just Python with some extras), meaning I should actually be able to write stuff off the top my of my head as opposed to being stuck just copy-pasting stuff off the internet. Xonsh still supports pipes and other normal shell stuff.

The `vox` package for xonsh is great, as it makes managing multiple Python virtual environments a breeze.

## Rambly setup stuff, will clean up more later TODO

### Set up WSL, initial

1) Open admin powershell
2) Run `wsl --install` (will default to Ubuntu as the distro)
3) Press yes for any authorization prompts that pop up
4) Reboot
5) Set up Linux username and password. (Type out, and then press Enter). This is what you will use with `sudo`.

### Install patched icon font

https://www.reddit.com/r/linux4noobs/comments/m9bpbw/how_to_install_nerdfonts_in_wsl/

https://github.com/ryanoasis/nerd-fonts/releases

I picked 

FiraCode > FiraCodeNerdFontMono

Double click a ttf file, then click the install button. You should install all the font weights/variations (Regular, bold, etc.). I use regular FiraCodeMono in the terminal.

### Install wsltty, pick icon font and theme

Install from x64 installer from this page:

https://github.com/mintty/wsltty/releases

Open Terminal > Right click header bar > Options > Pick Fira Code Mono font, gruvbox theme

On picking font:

https://github.com/mintty/wsltty/issues/227


### Install micro, and set up copy paste in wsltty and micro

As opposed to Vim, Nano, etc., this is a terminal editor that really does "just work". It has syntax highlighting out-of-the-box, and uses normal keybindings for movement and cut/copy/paste/etc. Also supports mouse usage (highlighting and copying text via mouse). It's 100% what I recommend for most normal people just getting their toes wet with terminal-based things. If you are a (Neo)Vim or Emacs person, you already know who you are, and probably won't care about this editor.

Install micro with curl, if the executable in the dotfiles repo doesn't just work. (Maybe compiled with a different architecture, etc.).

```
cd ~/.local/bin
curl https://getmic.ro | bash
```

https://github.com/zyedidia/micro/issues/2579#issuecomment-1287635295

Make new file called `xclip` in `~/.local/bin` and give it execute permissions.

https://github.com/zyedidia/micro/issues/1365#issuecomment-1155425701

This will make micro copy and paste correctly out of the box, without you actually having to update more settings. But if you do want to edit settings, see https://github.com/zyedidia/micro/blob/master/runtime/help/options.md. You edit `~/.config/micro/settings.json`.

You can use an AutoHotkey script (`wsltty-copy-paste.ahk` -- in `~/.local/bin`) to make Control + V send Shift + Insert and Control + C send Control + Insert when a wsltty terminal window is focused (including when using micro in said terminal window). Makes it play nice with the system clipboard while still being able to use muscle memory for copying and pasting.

### Ranger

Install with these:

`sudo apt update`

`sudo apt install -y ranger`

I don't think I'll be using ranger much if I start using Emacs full-time (I'll use Dired in Emacs instead), but it's handier than chaining a bunch of `cd` and `ls` commands regardless, so probably worth having around since it takes minimal time to set up.

TODO: set up launch applications
TODO: image previewer
* [Code Yarns – How to preview images in Ranger](https://codeyarns.com/tech/2014-09-11-how-to-preview-images-in-ranger.html#gsc.tab=0)
* [How to change the default document viewer in ranger? - Super User](https://superuser.com/questions/1234893/how-to-change-the-default-document-viewer-in-ranger)
* [Opening Files from Command Line](https://www.jetbrains.com/help/idea/2016.3/opening-files-from-command-line.html)

How to make it so that when you press enter when on a directory (or whatever is the real way to this, with standard bindings) you re-enter the terminal in that directory?

* [terminal - Ranger cd into a folder (and invoke shell)? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/342064/ranger-cd-into-a-folder-and-invoke-shell)

Set up rifle.conf bindings for all text types (.text, .md, etc.) for PyCharm, and also Python files of course, Make it default editor, and also make an alias for it

Also set up Word, PowerPoint, and Excel

PDFs in Microsoft Edge

### Icons in ls, and icons in ranger

Run 

`sudo apt install exa`

And then make an alias for ls = exa --icons

Then run 

`git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons`

Then run

`echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf`


### Python

* [Python setup on the Windows subsystem for Linux (WSL) | by Rodrigo Hernández Mota | Medium](https://medium.com/@rhdzmota/python-development-on-the-windows-subsystem-for-linux-wsl-17a0fa1839d)
* [What is the difference between Python and IPython? - Stack Overflow](https://stackoverflow.com/questions/12370457/what-is-the-difference-between-python-and-ipython)

Basically just run

`sudo apt update && upgrade`

`sudo apt install python3 python3-pip ipython3`


### xonsh

[The Xonsh Shell — Python-powered shell](https://xon.sh/)

I had issues trying to install xonsh in its own virtual environment, since I need to be able to switch between virtual environments when developing. (That is, I can't need to be always on an xonsh venv just to make the shell work, when developing other Python applications). So I just installed xonsh globally. Seems to work fine, so whatever. Run:

`python3 -m pip install xonsh[full]`

Right now, I make xonsh automatically trigger by calling it at the top of my `.bashrc.`

You could maybe configure the WSL terminal to automatically execute xonsh instead of bash (modify some login configuration file or something?), but I've been too lazy to figure it out, so just run it as above. It is plenty snappy as it is, so I just don't see much point.

TODO: This looks cool, for use over ssh

https://github.com/xonsh/xonsh/issues/4589

#### Warning printing for every new prompt

When I first installed xonsh, every time the prompt printed, a warning got printed with it. You can fix it this way:

https://github.com/xonsh/xonsh/issues/4513#issuecomment-1522724843

Apparently, a bug with the prompt library or whatever.

#### Input lag

Right now on WSL all the windows things get added to PATH, and it makes the shell unbearably slow.

* [Input Lag with fresh install in WSL 2 with conda installation · Issue #3948 · xonsh/xonsh](https://github.com/xonsh/xonsh/issues/3948)
* [Windows 10 WSL2: fast from root, slow from user · Issue #3895 · xonsh/xonsh](https://github.com/xonsh/xonsh/issues/3895)

To fix it do this:

https://github.com/xonsh/xonsh/issues/3895#issuecomment-1289471170

That is, add this one-liner:

```python3
[$PATH.remove(path) for path in $PATH.paths if path.startswith("/mnt/c/")]
```

to your xonsh config file.

TODO: look at the other example, which might get rid of the startup lag too? https://github.com/xonsh/xonsh/issues/3895#issuecomment-713078931

Instead of the answer's `~/.xonsh.rc` (which doesn't work; at least, it didn't for me), the correct config file location [per the docs](https://xon.sh/xonshrc.html) is just `~/.xonshrc`.


#### Vox for xonsh is the same thing as virtualenvwrapper.sh for bash, basically

https://xon.sh/python_virtual_environments.html

`xpip install xontrib-vox`

Then put 

`xontrib load vox`

in `.xonshrc`

Then try running `vox new my-env`. It didn't work initially for me, I had to run 

`sudo apt install python3.10-venv`

Worked after that.

I set up an extra wrapper command to mirror the mkproject command from the bash virtualenv-werapper project. Here's my xonsh script for it:

```
#!/usr/bin/env xonsh

mkdir ~/projects/$ARG0
vox new $ARG0
vox workon $ARG0
cd ~/projects/$ARG0
```

Just makes a new project: a new venv for the project, and a new directory for the project. Then it cd's into the new project directory, and activates the new venv.

Don't forget to run

`chmod +x mkproject`

after adding the file, to make it executable. (Or if you prefer, `chmod 755 mkproject`, etc.)

Then reload your shell and try it. You need to call it like `source mkproject project-name` so that the cd actually changes the shell's directory. (Since we're calling it with the current context anyway, I omitted `xontrib load vox` in this script, and just assumed it is already loaded. That only works because we're calling it with `source`. OTherwise you'd have to load it in the script).

You can set up an alias for it so you don't have to remember to `source` it in practice. That's what I do. Looks like:

`aliases['mkproject'] = 'source mkproject'`


### Aliases

TODO: paste out of config file or whatever
