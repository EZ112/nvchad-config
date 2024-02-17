# Personal NVChad Custom Config

## Pre-requisite

Follow this [link](https://nvchad.com/docs/quickstart/install) to install NVChad

## Installation

Clone this repo into `custom` directory

### Environment

```
# Connection name is parsed from the variable name (everything after `DB_UI_` lowercased)
# Example with connection name `dev`
DB_UI_DEV=#URL
```

## Included Config

| Name                                                                       | Desc                            |
| -------------------------------------------------------------------------- | ------------------------------- |
| [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)           | DB Visualization in NVIM        |
| [harpoon](https://github.com/ThePrimeagen/harpoon)                         | Hook File with Shortcuts        |
| [lspconfig](https://github.com/neovim/nvim-lspconfig)                      | Configs for the Nvim LSP client |
| [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) ⚠️`archived` | Act as LSP Server               |

## Custom config

| Sources   | LSPConfig | Null-ls |
| --------- | --------- | ------- |
| Astro     | ✔️        | ❌      |
| Deno      | ✔️        | ✔️      |
| Eslint    | ✔️        | ✔️      |
| Prettier  | ❌        | ✔️      |
| TS Server | ✔️        | ❌      |
| Stylua    | ❌        | ✔️      |
