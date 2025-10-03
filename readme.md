# Luanti IDE Helper
[![Maintained By: Lord Team](https://img.shields.io/badge/Maintained%20By-Lord%20Team-659b4b?style=for-the-badge)](https://github.com/lord-server/lord?tab=readme-ov-file#contributors--%D1%83%D1%87%D0%B0%D1%81%D1%82%D0%BD%D0%B8%D0%BA%D0%B8)
[![Donate: Boosty](https://img.shields.io/badge/Donate-Boosty-f15f2c?style=for-the-badge)](https://boosty.to/lord-server)
[![License: MIT](https://img.shields.io/badge/License-MIT-444?style=for-the-badge)](./license.md)


A helper package for [Luanti](https://www.luanti.org/) (Minetest) mod/game development that provides autocompletion and documentation for IDE integration.


## Supported IDEs & Plugins

 - IntelliJ IDEA (or compatible) with [EmmyLua2 Plugin](https://plugins.jetbrains.com/plugin/25076-emmylua2)
 - VS Code with [EmmyLua Extension](https://marketplace.visualstudio.com/items?itemName=tangzx.emmylua) (recommended for VS Code)
 - VS Code with [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
 - Any editor with LSP support.  
   Install Lua LS: `cargo install emmylua_ls` (or see [instalation guide](https://github.com/EmmyLuaLs/emmylua-analyzer-rust?tab=readme-ov-file#-installation))


## Installation

### For Mod Developers

1. Download or clone this repository to your local machine:
   ```bash
   git clone https://github.com/Voxrame/luanti-ide-helper.git
   ```
2. Configure your IDE to use the library path:
   - VS Code with [EmmyLua](https://marketplace.visualstudio.com/items?itemName=tangzx.emmylua) (recommended):  
      Add to your workspace settings (`.vscode/settings.json`):
      ```json
      {
        "emmylua.workspace.library": [
          "path/to/luanti-ide-helper"
        ]
      }
      ```

### For Game Developers

We recommend to keep this annotation package right in your repository as a Git submodule. This ensures all team members and contributors automatically get the same IDE assistance without additional configuration.

1. Add this repository as a submodule to your project:
    ```bash
    git submodule add https://github.com/Voxrame/luanti-ide-helper.git util/ide-helper
    ```
1. Create configuration files for your team in repository:  
    `.emmyrc.json` (for all IDEs):
    ```json
    {
      "$schema": "https://raw.githubusercontent.com/EmmyLuaLs/emmylua-analyzer-rust/refs/heads/main/crates/emmylua_code_analysis/resources/schema.json",
      "workspace.library": [
        "util/ide-helper"
      ]
    }
    ```
    `.vscode/extensions.json` (recommends EmmyLua for VS Code users):
    ```json
    {
      "recommendations": [
        "tangzx.emmylua"
      ]
    }
    ```
1. Update the submodule when needed:
    ```bash
    git submodule update --remote util/ide-helper
    ```


## Development

Issues & PRs welcome.
> **Info:** This project was started as part of [Lord Game](https://github.com/lord-server/lord). And then was extracted with original commit history and issue references are preserved as `lord-server/lord#<issue_number>`.


## License

This project is licensed under the MIT License - see [`license.md`](./license.md) file for details.