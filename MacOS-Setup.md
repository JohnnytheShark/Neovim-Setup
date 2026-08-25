# MacOS Neovim Setup Guide

If you are pulling this configuration down to a MacBook or iMac, follow these steps to ensure the UI, colors, and paths work correctly.

## 1. Install Prerequisites
Macs use a package manager called Homebrew. If you don't have it, install it from `brew.sh`.
Open your terminal and install Neovim and Git:
```bash
brew install neovim git
```

## 2. Clone the Configuration
On Windows, Neovim looks in `AppData\Local\nvim`. On macOS, it expects the configuration to be in a hidden folder called `.config/nvim` in your home directory.

Run this to create the folder and clone your exact setup:
```bash
mkdir -p ~/.config
git clone https://github.com/JohnnytheShark/Neovim-Setup.git ~/.config/nvim
```

## 3. Fix the UI (Terminal & Fonts)
The default macOS `Terminal.app` lacks good True Color support, making Neovim look washed out. It also doesn't come with the icons required for this setup.

1. **Download iTerm2**: Highly recommended terminal for macOS (https://iterm2.com/).
2. **Install a Nerd Font**: Download [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads). Extract the zip, highlight the `.ttf` files, right-click, and select **Open with Font Book** to install them.
3. **Configure iTerm2**: 
   - Open iTerm2 Settings (`Cmd + ,`)
   - Go to **Profiles > Text**
   - Change the **Font** to `JetBrainsMono Nerd Font` (or whatever Nerd Font you installed).

## 4. The First Boot
1. Open iTerm2 and type `nvim`.
2. Do not touch anything! You will see the package manager (`lazy.nvim`) pop up and start downloading all your plugins.
3. Once the installations finish, **quit Neovim** (`:qa`) and open it again.

## 5. Enable Work Languages (Python, TS, Java, etc.)
Since you aren't using Godot on this machine, you can easily enable standard programming languages:
1. Inside Neovim, press `<Space> l e` to open the **LazyExtras** menu.
2. Scroll down to the languages you need (e.g., `lang.python`, `lang.typescript`, `lang.java`).
3. Press `x` to enable them.
4. Restart Neovim. It will automatically download the formatting and autocomplete servers for those languages!
