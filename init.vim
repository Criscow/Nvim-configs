set number              "Numero de linea
set mouse=a		"Seleccionar con mouse
syntax enable		"Activar sintaxis
set showcmd		"Ver salida de comandos
set encoding=utf-8	"Codificacion
set showmatch		"Ver donde comienza y donde termina los {}
set relativenumber	"Numeros relativos
set sw=4
set nowrap
set clipboard=unnamed "I don't remember
set autoindent  "Auto identado
set background=dark
set termguicolors

" Instalar el complemento de gestion de paquetes
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter'  "resaltado
Plug 'preservim/nerdtree'		"gestor de archivos en forma de arbol.
Plug 'jiangmiao/auto-pairs'		"autocompletado de llaves, corchetes, etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}	"autocompletado inteligente
Plug 'nvim-lua/plenary.nvim'            "complemento para telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " telescope
Plug 'neovim/nvim-lspconfig'      " Configuración de LSP para Neovim
Plug 'nvim-lua/completion-nvim'   " Completado de LSP
Plug 'lukas-reineke/indent-blankline.nvim' " Para linnea de identado
Plug 'romgrk/barbar.nvim' " Para la cabecera
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'

call plug#end()

colorscheme gruvbox

" Configuracion de LSP
lua <<EOF
  local nvim_lsp = require('lspconfig')

  -- Configurar el servidor LSP para el lenguaje que desees (por ejemplo, Python)
  nvim_lsp.pyright.setup{}

  -- Configurar el complemento de completado de LSP
  require('completion').on_attach()

  require("indent_blankline").setup {
      -- for example, context is off by default, use this to turn it on
      show_current_context = true,
      show_current_context_start = true,
}

require("lualine").setup {

options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF


"configuracion de nerdtree
"mapeando el abrir y cerrar de nerdtree con nerdtreetoggle vemos los archivos en el arbol y podemos cerrarlo a la vez, map es la C mayuscula representa el
"control y -n la tecla n lo que indica que realizará la siguiente funcion de excribir el comando NERDTreeToggle y CR significa ENTER.
map <C-n> :NERDTreeToggle<CR>


"-------------------------------------------------------------------------------
" Coc configuracion
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes



" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>



