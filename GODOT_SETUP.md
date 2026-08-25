# Godot Editor Setup for Neovim

When you set this up on a new computer (like your laptop), you will need to configure the Godot Editor so it can communicate with Neovim properly. 

Neovim handles all the C# and GDScript intelligence, but Godot needs to know to send file opening requests to Neovim.

## ⚠️ Prerequisite
You **must** be using the **Godot .NET Edition** (not the standard edition). 

---

## 1. Configure the GDScript Language Server
This allows Neovim to provide autocomplete and error checking for `.gd` and `.gdshader` files.

1. Open Godot and go to **Editor > Editor Settings**
2. Scroll down to **Network > Language Server**
3. Set **Remote Port** to `6005`
4. Check the box for **Use Thread** (✅ Enabled)

---

## 2. Configure the External Text Editor (For GDScript)
This tells Godot to open Neovim when you click on a script or an error in the console.

1. In Editor Settings, go to **Text Editor > External**
2. Check **Use External Editor** (✅ Enabled)
3. **Exec Path**: `C:\Users\Johnny Orellana\scoop\apps\neovim\current\bin\nvim.exe`
   *(Adjust this path if you installed Neovim differently on your laptop)*
4. **Exec Flags**: 
   ```text
   --server 127.0.0.1:55432 --remote-send "<C-\><C-N>:execute 'edit ' . fnameescape('{file}')<CR>:call cursor({line},{col})<CR>"
   ```

---

## 3. Configure the .NET External Editor (For C#)
Godot handles C# files in a completely separate menu. You must configure this so C# files also open in Neovim correctly.

1. In Editor Settings, scroll down to **DotNet > Editor**
2. Change **External Editor** to `Custom`
3. **Custom Exec Path**: `C:\Users\Johnny Orellana\scoop\apps\neovim\current\bin\nvim.exe`
4. **Custom Exec Args**: 
   ```text
   --server 127.0.0.1:55432 --remote-send "<C-\><C-N>:execute 'edit ' . fnameescape('{file}')<CR>:call cursor({line},{col})<CR>"
   ```

---

## 4. The "First Run" Build Rule
Before starting a coding session in Neovim, you **must build your Godot project at least once** (click the Hammer icon in the top right of Godot).

**Why?** 
Neovim's C# engine (Roslyn) relies on the `.sln` and `.csproj` files to understand your code. Godot only updates these files when you build the project from the editor.
