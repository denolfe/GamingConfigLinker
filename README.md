# Gaming Config Linker

Easily symbolically link your gaming configs, so that they can be version controlled in a single repository

3 types of linking are supported:

- Single file linking
- Directory linking
- All files within directory linked individually via the `linkAll: true` property

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
symbolic link created for C:\MyConfigs\Game1\myconfig.cfg <<===>> C:\Game1\config.cfg
```

If there are any errors, ensure your file paths are all correct.
