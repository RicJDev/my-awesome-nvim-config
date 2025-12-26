" Vim syntax file
" Language:    GaboScript
" Maintainer:  Generated from TextMate grammar
" Filenames:   *.gabo

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "gaboscript"

" Case-insensitive matching for keywords (matching TextMate's (?i))
syntax case ignore

" Strings
syntax region gaboString start=/"/ skip=/\\"/ end=/"/ contains=gaboEscape
syntax match gaboEscape "\\." contained

" Numbers
syntax match gaboNumber "\<\d\+\(\.\d\+\)\?\>"

" Keywords - Control
syntax keyword gaboKeyword Si Entonces Fin_Si Sino Para Hacer Fin_Para
syntax keyword gaboKeyword Repetir Hasta Mientras Fin_Mientras En_Caso
syntax keyword gaboKeyword Sea Fin_Caso Caso Otro_Caso Devolver Fin_Repetir

" Keywords - Other
syntax keyword gaboKeyword Algoritmo Inicio Fin Procedimiento Fin_Procedimiento
syntax keyword gaboKeyword Funcion Fin_Funcion Registro Fin_Registro var null

" Built-in functions
syntax keyword gaboBuiltin Mostrar Leer Imprimir

" Identifiers
syntax match gaboIdentifier "\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match gaboConstant "\C\<[A-Z][a-zA-Z0-9_]*\>" 

" Function calls
syntax match gaboFunctionCall "\s*\zs\w\+\ze\s*("

" Special: Algorithm declaration
syntax match gaboAlgorithmDecl "\<Algoritmo\>\s*\zs.*" contains=gaboIdentifier

" Operators
syntax match gaboOperator "<<\|="
syntax match gaboOperator "[\^+\-*/%]"
syntax match gaboOperator "[=<>]\|==\|!=\|<=\|>="
syntax keyword gaboOperator And Or

" Punctuation
syn match gaboSpecial "\[\|\]\|(\|)\|,"
syn match gaboOperator "+\|-\|=\|\*\|\^\|MOD\|And\|Or\|!=\|<\|>"

" Types
syntax keyword gaboType entero cadena booleano real caracter e s
syntax match gaboType "\c\<e\s*\/\s*s\>"

" Comments
syntax region gaboCommentBlock start="\/\*" end="\*\/"
syntax match gaboCommentLine "\/\/.*$"

" Linking to standard Vim highlighting groups
highlight link gaboTodo Todo
highlight link gaboString String
highlight link gaboEscape Special
highlight link gaboNumber Number
highlight link gaboKeyword Keyword
highlight link gaboBuiltin Function
highlight link gaboConstant Constant
highlight link gaboIdentifier Identifier
highlight link gaboType Type
highlight link gaboSpecial Special
highlight link gaboOperator Operator
highlight link gaboFunctionCall Function
highlight link gaboAlgorithmDecl Title
highlight link gaboPunctComma Delimiter
highlight link gaboPunctColon Delimiter
highlight link gaboParen Delimiter
highlight link gaboBracket Delimiter
highlight link gaboCommentBlock Comment
highlight link gaboCommentLine Comment

" Case-sensitive matching for non-keyword elements
syntax case match
