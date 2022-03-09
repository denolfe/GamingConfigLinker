# Gaming Config Linker

Easily symbolically link your gaming configs, so that they can be version controlled in a single repository

3 types of linking are supported:

- Single file linking
- Directory linking
- All files within directory linked individually via the `linkAll: true` property

```text
symbolic link created for C:\Users\username\Saved Games\Respawn\Apex\local\settings.cfg <<===>> C:\gaming-configs\apex\settings.cfg
symbolic link created for C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\autoexec.cfg <<===>> C:\gaming-configs\csgo\autoexec.cfg
symbolic link created for C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\autoexec.cfg <<===>> C:\gaming-configs\tf2\autoexec.cfg
symbolic link created for C:\Users\username\Documents\My Games\Warfork 2.1\basewf\config.cfg <<===>> C:\gaming-configs\warfork\config.cfg
symbolic link created for C:\Users\username\Documents\My Games\Warfork 2.1\basewf\huds <<===>> C:\gaming-configs\warfork\huds
```

## Usage

- Create a new repo designed for housing all of your gaming configs and move at least 1 config into it
- Add as git submodule `git submodule add git@github.com:denolfe/GamingConfigLinker.git _linker` or `git submodule add https://github.com/denolfe/GamingConfigLinker.git _linker`
- Create a `config.json` file modelled after `config.example.json` in this repo
- Create simple script to execute the script called `link.cmd` with the following contents

```cmd
powershell _linker/link.ps1 config.json
```

- Execute that script from cmd prompt

If all goes well, you should see output of the linking commands.

```cmd
symbolic link created for C:\Game1\config.cfg <<===>> C:\MyConfigs\Game1\myconfig.cfg
```

If there are any errors, ensure your file paths are all correct.
