" Opções Básicas de Edição do Vim
runtime! debian.vim 	" Executa o script para programas que usam o Vim em distros Debian Like
syntax on		" Habilita o recurso de Syntaxe para identificar conteudo nos arquivos
set showcmd		" Mostra (parcialmente) o status dos comandos
set showmatch		" Mostra o fechamento de { ( [ .
set ignorecase		" Faz o Vim tratar maiúsculas e minúsculas sem diferença (case insensitive)
set smartcase		" Faz busca inteligente
set incsearch		" Faz busca incremental
set autowrite		" Salva automaticamente antes de comandos como :next e :make
set nomodeline		" Desabilita o uso de Modelines (evita ataques de execução de comandos)
set modelines=0		" Mesmo que modelines estejam habilitados ele executa 0 linhas (parse 0)
set ruler		" habilita a régua (mostrar linha e coluna no canto inferior direito)
set bg=dark		" Coloca o fundo (background) escuro, melhora o uso do vim no modo gráfico por exemplo.
set number		" habilita a numeração das linhas
set hls			" Grifa o resultado da busca
set wildmode=longest,list " Para completar com TAB igualzinho o bash faz (Use CTRL+P para completar)
set hlg=pt		" Idioma preferido para buscar ajuda
set ul=500		" máximo de mudanças que podem ser desfeitas
set ai			" Habilita a autoindentação
" F2 Para 'ocultar' e F3 voltar os comentarios do arquivo atual
noremap <F2> :hi Comment ctermfg=black guifg=black<cr>
noremap <F3> :hi Comment term=bold ctermfg=cyan guifg=cyan<cr>
" Alterna entre janelas sem sair do modo insercao (depois do :split)
map <F4> <esc><c-w><c-w>
" Aperte F5 e a tela fica embaralhada e F5 para voltar ao normal"
map <F5> ggVGg?
" Procura a primeira linha vazia e comeca a editar
map <F6> gg/^$<cr>i#
" Remove espaços redundantes no fim das linhas com F7
map <F7> <esc>mz:%s/\s\+$//g<cr>`z
" Retira os ^M que ficam no final de arquivos salvos pelo windows. Aperte F8 e suma com eles.
map <F8> :%s/\r//g
" Cria o cabecalho padrao para shell script
map <F9>  ggO#!/bin/bash
          \<c-o>:r!echo %<cr># <c-o>o
          \# Versao: <c-o>o
          \# Script para:<c-o>i
	  \<c-o>:r!date '+\%Y-\%m-\%d \%H:\%M-0300'<cr># <c-o>o
	  \# Codificacao utf-8<c-o>o
          \# Autor: Vagner Fonseca<cr>
" Com o cursor encima de alguma funcao PHP e aperte o F10 e ele vai buscar no site do php.net a definição para ela.
"map <F10> "vyiw:new:execute "r!lynx --dump http://br.php.net/manual/en/function.".@v.".php":set nonu:1
" Abreviações para quando a tecla CAPS LOCK estiver ativada."
cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq
" Função que fecha automaticamente { ( [, ao escrevê-los o vim fecha automaticamente.
imap { {}<left>
imap ( ()<left>
imap [ []<left>
" Salva os arquivos .sh com permissao de escrita
au BufWritePost *.sh  !chmod +x %
" Busca colorida em verde
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan
" Ruler e cursor sempre em branco
hi StatusLine ctermfg=white
" Faz os resultados da busca aparecerem no meio da tela
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
"Arquivos .sh sao sempre bash, e não sh
au FileType sh let b:is_bash=1
" Palavras-chave para destacar em qualquer tipo de arquivo
syn case ignore
syn keyword p_c vagner fonseca
syn keyword p_c Vagner Fonseca
hi p_c ctermbg=white ctermfg=black
" Mail: Configuracoes especiais para arquivos de email
au FileType Mail set fo=ctq tw=65 et
" Man: Paginas de manual sao na verdade textos em NROFF
au BufNewFile,BufRead *.man set ft=nroff
" TXT: Arquivos texto tem tratamento especial
au BufNewFile,BufRead *.txt   set tw=75 ts=8 ft=txt "spell
au BufNewFile,BufRead *README,*NEWS,*TODO set ft=txt "spell
" Python: TAB colorido e outras configuracoes
au FileType python set ts=8 tw=80 noet
au FileType python syn match pythonTAB '\t\+'
au FileType python hi pythonTAB ctermbg=blue
"au FileType python set list listchars=tab:··
au FileType python hi pythonString ctermfg=lightgreen
au FileType python hi pythonRawString ctermfg=lightgreen
" Habilita correcao ortografica para portugues
"set spell spelllang=pt
