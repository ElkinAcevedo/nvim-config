# Neovim Config

Configuración de Neovim. 
## Plugins

| Plugin | Archivo | Función |
|---|---|---|
| blink.cmp | `blink.lua` | Autocompletado |
| Colorscheme | `colorscheme.lua` | Tema de colores |
| nvim-lspconfig | `lspconfig.lua` | Configuración de LSP |
| lualine.nvim | `lualine.lua` | Barra de estado |
| telescope.nvim | `telescope.lua` | Búsqueda de archivos, texto y más |
| nvim-treesitter | `treesitter.lua` | Resaltado de sintaxis y análisis de código |

## Servidores LSP

| Lenguaje | Servidor | Archivo |
|---|---|---|
| Bash | bash-language-server | `bash.lua` |
| C / C++ | clangd | `clangd.lua` |
| Lua | lua-language-server | `lua_ls.lua` |
| Python | pyright | `pyright.lua` |

## Estructura

```
nvim/
├── init.lua
├── lazy-lock.json
├── lazyvim.json
├── after/
│   ├── ftplugin/
│   └── plugin/
│       └── lsp.lua
├── lsp/
│   ├── bash.lua
│   ├── clangd.lua
│   ├── lua_ls.lua
│   └── pyright.lua
└── lua/
    └── config/
        ├── lazy.lua
        ├── custom/
        │   ├── diagnostic.lua
        │   ├── keymaps.lua
        │   └── options.lua
        └── plugins/
            ├── blink.lua
            ├── colorscheme.lua
            ├── lspconfig.lua
            ├── lualine.lua
            ├── telescope.lua
            └── treesitter.lua
```

## Instalación

Copia de seguridad 

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clona el repositorio:

```bash
git clone https://github.com/TU_USUARIO/TU_REPO.git ~/.config/nvim
```
## Requisitos

- Neovim
- Git
- Un compilador de C (para los parsers de treesitter)
- Servidores LSP instalados en el sistema:
