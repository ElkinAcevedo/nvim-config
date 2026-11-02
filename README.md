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
| vim-dadbod-ui | `dadbod.lua` | Cliente de bases de datos (con vim-dadbod y vim-dadbod-completion) |

## Servidores LSP

| Lenguaje | Servidor | Archivo |
|---|---|---|
| Bash | bash-language-server | `bash.lua` |
| C / C++ | clangd | `clangd.lua` |
| Lua | lua-language-server | `lua_ls.lua` |
| Python | pyright | `pyright.lua` |

## Base de datos (dadbod)

Plugins usados: `vim-dadbod` (motor), `vim-dadbod-ui` (interfaz) y `vim-dadbod-completion` (autocompletado, integrado en `blink.lua`).

### Configurar una conexión

Las conexiones se definen en `vim.g.dbs` dentro de `lua/config/plugins/dadbod.lua`:

```lua
vim.g.dbs = {
  alias = "postgresql://usuario:contraseña@localhost:5432/base",
}
```

Formato de la URL: `esquema://usuario:contraseña@host:puerto/base`.

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
            ├── dadbod.lua
            ├── lspconfig.lua
            ├── lualine.lua
            ├── telescope.lua
            └── treesitter.lua
```

## Instalación

Copia de seguridad:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clona el repositorio:

```bash
git clone https://github.com/ElkinAcevedo/nvim-config.git ~/.config/nvim
```

## Requisitos

- Neovim
- Git
- Un compilador de C (para los parsers de treesitter)
- Servidores LSP instalados en el sistema:

```bash
npm install -g bash-language-server pyright
# clangd y lua-language-server desde el gestor de paquetes de tu distribución
```

- Cliente de la base de datos:

```bash
sudo pacman -S postgresql
```
