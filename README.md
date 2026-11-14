# nvim-config

Configuración personal de Neovim: minimalista, modular y pensada para programar,
usar git y trabajar con Claude Code sin salir del editor.

![Neovim](https://img.shields.io/badge/Neovim-0.12+-57A143?logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-2C2D72?logo=lua&logoColor=white)
![lazy.nvim](https://img.shields.io/badge/plugins-lazy.nvim-blue)

---

## Contenido

- [Características](#características)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Atajos de teclado](#atajos-de-teclado)
- [Plugins](#plugins)
- [Servidores LSP](#servidores-lsp)
- [Base de datos](#base-de-datos)
- [Estructura](#estructura)

---

## Características

- **Terminal integrada** pequeña bajo el código, sin plugins, que no le quita espacio a Claude Code.
- **Git rápido y revisado**: commit mostrando los cambios antes, push con confirmación.
- **Claude Code** en un panel lateral con scroll funcional.
- **LSP nativo** (`vim.lsp`) para Bash, C/C++, Lua y Python.
- **Autocompletado** con blink.cmp y **búsqueda** con Telescope.
- **Cliente SQL** con vim-dadbod; las credenciales nunca se suben al repositorio.

## Requisitos

| Herramienta | Uso |
|---|---|
| Neovim ≥ 0.12 | Editor |
| Git | Plugins y control de versiones |
| Compilador de C y `make` | Parsers de treesitter y telescope-fzf-native |
| Node.js / npm | Instalar `bash-language-server` y `pyright` |
| `clangd`, `lua-language-server` | LSP de C/C++ y Lua |
| [Claude Code](https://claude.com/claude-code) | Integración con claudecode.nvim (opcional) |
| PostgreSQL (cliente) | dadbod (opcional) |

```bash
npm install -g bash-language-server pyright
sudo pacman -S clang lua-language-server postgresql
```

## Instalación

```bash
# 1. Respaldar la configuración actual
mv ~/.config/nvim ~/.config/nvim.bak

# 2. Clonar
git clone https://github.com/ElkinAcevedo/nvim-config.git ~/.config/nvim

# 3. (Opcional) credenciales de base de datos
cp ~/.config/nvim/lua/config/secrets.example.lua ~/.config/nvim/lua/config/secrets.lua
```

Al abrir `nvim` por primera vez, lazy.nvim instala todos los plugins automáticamente.

## Atajos de teclado

La tecla líder es **`Espacio`**.

### Terminal y ventanas

| Atajo | Acción |
|---|---|
| `Alt+o` | Abrir / cerrar la terminal bajo el código |
| `Alt+n` | Salir del modo terminal a modo normal |
| `Alt+u` | Subir media página en una terminal |
| `Alt+,` / `Alt+.` | Ventana más angosta / más ancha |
| `Alt+-` / `Alt+=` | Ventana más baja / más alta |
| `Ctrl+w` + `h j k l` | Moverse entre ventanas |

> En Hyprland, `Alt` es el `mainMod`, por eso se evitan `Alt+T`, `Alt+J` y `Alt+flechas`.

### Git

| Atajo | Acción |
|---|---|
| `Espacio g s` | `git status` |
| `Espacio g c` | Commit: muestra los cambios, pide el mensaje (vacío cancela) y hace `git add -A` + commit |
| `Espacio g p` | `git push` con confirmación |

### Claude Code

| Atajo | Acción |
|---|---|
| `Espacio a c` | Abrir / cerrar Claude |
| `Espacio a f` | Enfocar Claude |
| `Espacio a r` | Reanudar una sesión |
| `Espacio a C` | Continuar la última sesión |
| `Espacio a b` | Agregar el buffer actual al contexto |
| `Espacio a s` | Enviar la selección (modo visual) |
| `Espacio a a` / `Espacio a d` | Aceptar / rechazar un diff |

### Búsqueda (Telescope)

| Atajo | Acción |
|---|---|
| `Espacio f f` | Buscar archivos |
| `Espacio f g` | Buscar texto (live grep) |
| `Espacio f b` | Buffers abiertos |
| `Espacio f h` | Ayuda |

### Compilar y ejecutar

| Atajo | Acción |
|---|---|
| `Espacio w` | Guardar |
| `Espacio c c` | Compilar y ejecutar C (`gcc`) |
| `Espacio c o` | Compilar y ejecutar C con OpenMP |
| `Espacio c i` | Compilar y ejecutar con MPI (`mpicc`) |
| `Espacio z o` | Ejecutar Python |
| `Espacio h s` | Ejecutar Haskell (`runghc`) |

## Plugins

Gestionados con [lazy.nvim](https://github.com/folke/lazy.nvim). Cada plugin vive en su propio archivo dentro de `lua/config/plugins/`.

| Plugin | Archivo | Función |
|---|---|---|
| [blink.cmp](https://github.com/saghen/blink.cmp) | `blink.lua` | Autocompletado (preset *super-tab*) |
| [catppuccin](https://github.com/catppuccin/nvim) | `colorscheme.lua` | Tema de colores |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | `claudecode.lua` | Integración con Claude Code |
| [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) | `dadbod.lua` | Cliente de bases de datos |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | `lspconfig.lua` | Configuraciones base de LSP |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | `lualine.lua` | Barra de estado |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | `telescope.lua` | Búsqueda de archivos y texto |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | `treesitter.lua` | Resaltado de sintaxis |

La terminal y los atajos de git están hechos en Lua puro (`lua/config/custom/`), sin plugins.

## Servidores LSP

Configurados con la API nativa `vim.lsp.config` en la carpeta `lsp/`.

| Lenguaje | Servidor | Archivo |
|---|---|---|
| Bash | bash-language-server | `lsp/bash.lua` |
| C / C++ | clangd | `lsp/clangd.lua` |
| Lua | lua-language-server | `lsp/lua_ls.lua` |
| Python | pyright | `lsp/pyright.lua` |

## Base de datos

Usa `vim-dadbod` (motor), `vim-dadbod-ui` (interfaz, `:DBUI`) y `vim-dadbod-completion` (autocompletado SQL integrado en blink).

Las conexiones se definen en `lua/config/secrets.lua`, que está en `.gitignore`:

```lua
return {
  dbs = {
    mi_db = "postgresql://usuario:contraseña@localhost:5432/mi_db",
  },
}
```

Formato de la URL: `esquema://usuario:contraseña@host:puerto/base`.

## Estructura

```
nvim/
├── init.lua                  # Punto de entrada
├── lazy-lock.json            # Versiones fijadas de los plugins
├── after/plugin/lsp.lua      # Activa los LSP y formatea al guardar
├── lsp/                      # Un archivo por servidor LSP
│   ├── bash.lua
│   ├── clangd.lua
│   ├── lua_ls.lua
│   └── pyright.lua
└── lua/config/
    ├── lazy.lua              # Bootstrap de lazy.nvim y tecla líder
    ├── secrets.example.lua   # Plantilla de credenciales
    ├── custom/
    │   ├── options.lua       # Opciones del editor
    │   ├── keymaps.lua       # Atajos generales
    │   ├── diagnostic.lua    # Diagnósticos
    │   ├── terminal.lua      # Terminal, tamaño de ventanas y scroll
    │   └── git.lua           # Commit, push y status
    └── plugins/              # Un archivo por plugin
```
