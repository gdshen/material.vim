" Vim Color File
" Name: material.vim
" Maintainer: https://github.com/kaicataldo/material.vim
" License: The MIT License (MIT)

" === Configuration ===

" Clear any other set colors
highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'material'
let g:material_theme_style = get(g:, 'material_theme_style', 'default')
let g:material_terminal_italics = get(g:, 'material_terminal_italics', 0)

" For backwards compatibility
if (g:material_theme_style == 'dark')
  let g:material_theme_style = 'darker'
endif

" === Functions ===

function! s:SetHighlight(group, fg, bg, attr)
  let l:attr = a:attr

  if !g:material_terminal_italics && l:attr == 'italic'
    let l:attr = ''
  endif

  if empty(l:attr)
    let l:attr = 'none'
  endif

  if !empty(a:fg)
    exec 'hi ' . a:group . ' guifg=' . a:fg
  endif

  if !empty(a:bg)
    exec 'hi ' . a:group . ' guibg=' . a:bg
  endif

  if !empty(l:attr)
    exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
  endif
endfun

" === Color Definitions ===

" Default colors
set background=dark
let s:bg = '#263238'
let s:fg = '#eeffff'
let s:invisibles = '#65738e'
let s:comments = '#546e7a'
let s:caret = '#ffcc00'
let s:selection = '#2c3b41'
let s:guides = '#37474f'
let s:line_numbers = '#808080'
let s:line_highlight = '#000000'
let s:white = '#ffffff'
let s:black = '#000000'
let s:red = '#ff5370'
let s:orange = '#f78c6c'
let s:yellow = '#ffcb6b'
let s:green = '#c3e88d'
let s:cyan = '#89ddff'
let s:blue = '#82aaff'
let s:paleblue = '#b2ccd6'
let s:purple = '#c792ea'
let s:brown = '#c17e70'
let s:pink = '#f07178'
let s:violet = '#bb80b3'

" Theme-specific color overrides
if g:material_theme_style == 'palenight'
  let s:bg = '#292d3e'
  let s:fg = '#a6accd'
  let s:invisibles = '#4e5579'
  let s:comments = '#676e95'
  let s:selection = '#343b51'
  let s:guides = '#4e5579'
  let s:line_numbers = '#3a3f58'
elseif g:material_theme_style == 'darker'
  let s:bg = '#212121'
  let s:fg = '#eeffff'
  let s:invisibles = '#65737e'
  let s:comments = '#545454'
  let s:selection = '#2c2c2c'
  let s:guides = '#424242'
  let s:line_numbers = '#525252'
elseif g:material_theme_style == 'ocean'
  let s:bg = '#0f111a'
  let s:fg = '#8f93a2'
  let s:invisibles = '#80869e'
  let s:comments = '#464b5d'
  let s:selection = '#1f2233'
  let s:guides = '#3b3f51'
  let s:line_numbers = '#3b3f51'
elseif g:material_theme_style == 'lighter'
  set background=light
  let s:bg = '#fafafa'
  let s:fg = '#90a4ae'
  let s:invisibles = '#e7eaec'
  let s:comments = '#90a4ae'
  let s:caret = '#272727'
  let s:selection = '#ebf4f3'
  let s:guides = '#b0bec5'
  let s:line_numbers = '#cfd8dc'
  let s:line_highlight = '#ccd7da'
  let s:white = '#ffffff'
  let s:black = '#000000'
  let s:red = '#e53935'
  let s:orange = '#f76d47'
  let s:yellow = '#ffb62c'
  let s:green = '#91b859'
  let s:cyan = '#39adb5'
  let s:blue = '#6182b8'
  let s:paleblue = '#8796b0'
  let s:purple = '#7c4dff'
  let s:brown = '#c17e70'
  let s:pink = '#ff5370'
  let s:violet = '#945eb8'
endif

" Defined globally so that the Airline theme has access
let g:material_colorscheme_map = {}
let g:material_colorscheme_map.bg = s:bg
let g:material_colorscheme_map.fg = s:fg
let g:material_colorscheme_map.invisibles = s:invisibles
let g:material_colorscheme_map.comments = s:comments
let g:material_colorscheme_map.caret = s:caret
let g:material_colorscheme_map.selection = s:selection
let g:material_colorscheme_map.guides = s:guides
let g:material_colorscheme_map.line_numbers = s:line_numbers
let g:material_colorscheme_map.line_highlight = s:line_highlight
let g:material_colorscheme_map.white = s:white
let g:material_colorscheme_map.black = s:black
let g:material_colorscheme_map.red = s:red
let g:material_colorscheme_map.orange = s:orange
let g:material_colorscheme_map.yellow = s:yellow
let g:material_colorscheme_map.green = s:green
let g:material_colorscheme_map.cyan = s:cyan
let g:material_colorscheme_map.blue = s:blue
let g:material_colorscheme_map.paleblue = s:paleblue
let g:material_colorscheme_map.purple = s:purple
let g:material_colorscheme_map.brown = s:brown
let g:material_colorscheme_map.pink = s:pink
let g:material_colorscheme_map.violet = s:violet

" === Highlights ===

" Vim Editor
call s:SetHighlight('ColorColumn', '', s:invisibles, '')
call s:SetHighlight('Cursor', s:bg, s:caret, '')
call s:SetHighlight('CursorColumn', '', s:line_highlight, '')
call s:SetHighlight('CursorLine', '', s:line_highlight, '')
call s:SetHighlight('CursorLineNr', s:comments, '', '')
call s:SetHighlight('Directory', s:blue, '', '')
call s:SetHighlight('DiffAdd', s:bg, s:green, '')
call s:SetHighlight('DiffDelete', s:bg, s:red, '')
call s:SetHighlight('DiffChange', s:bg, s:yellow, '')
call s:SetHighlight('DiffText', s:bg, s:orange, '')
call s:SetHighlight('ErrorMsg', s:bg, s:red, 'bold')
call s:SetHighlight('FoldColumn', s:line_numbers, s:bg, '')
call s:SetHighlight('Folded', s:brown, s:bg, 'bold')
call s:SetHighlight('LineNr', s:line_numbers, '', '')
call s:SetHighlight('MatchParen', s:comments, s:cyan, 'bold')
call s:SetHighlight('ModeMsg', s:green, '', '')
call s:SetHighlight('MoreMsg', s:green, '', '')
call s:SetHighlight('NonText', s:comments, '', '')
call s:SetHighlight('Normal', s:fg, s:bg, '')
call s:SetHighlight('Pmenu', s:fg, s:selection, '')
call s:SetHighlight('PmenuSel', s:bg, s:cyan, '')
call s:SetHighlight('PmenuSbar', '', s:selection, '')
call s:SetHighlight('PmenuThumb', '', s:comments, '')
call s:SetHighlight('Question', s:blue, '', '')
call s:SetHighlight('IncSearch', s:white, s:comments, 'none')
call s:SetHighlight('Search', s:white, s:comments, 'none')
call s:SetHighlight('SignColumn', s:fg, s:bg, '')
call s:SetHighlight('SpecialKey', s:comments, '', '')
call s:SetHighlight('SpellCap', s:blue, '', 'undercurl')
call s:SetHighlight('SpellBad', s:red, '', 'undercurl')
call s:SetHighlight('StatusLine', s:fg, s:selection, '')
call s:SetHighlight('StatusLineNC', s:comments, s:selection, '')
call s:SetHighlight('StatusLineTerm', s:bg, s:green, '')
call s:SetHighlight('StatusLineTermNC', s:bg, s:green, '')
call s:SetHighlight('TabLine', s:fg, s:line_numbers, '')
call s:SetHighlight('TabLineFill', s:fg, s:selection, '')
call s:SetHighlight('TabLineSel', s:bg, s:cyan, '')
call s:SetHighlight('Title', s:green, '', '')
call s:SetHighlight('VertSplit', s:comments, '', '')
call s:SetHighlight('Visual', s:fg, s:selection, '')
call s:SetHighlight('WarningMsg', s:red, '', '')
call s:SetHighlight('WildMenu', s:bg, s:cyan, '')

" Syntax
call s:SetHighlight('Comment', s:comments, '', 'italic')
call s:SetHighlight('Conceal', s:brown, s:bg, '')
call s:SetHighlight('Constant', s:orange, '', '')
call s:SetHighlight('String', s:green, '', '')
call s:SetHighlight('Character', s:green, '', '')
call s:SetHighlight('Identifier', s:red, '', '')
call s:SetHighlight('Function', s:blue, '', '')
call s:SetHighlight('Statement', s:purple, '', '')
call s:SetHighlight('Operator', s:cyan, '', '')
call s:SetHighlight('PreProc', s:cyan, '', '')
call s:SetHighlight('Include', s:blue, '', '')
call s:SetHighlight('Define', s:purple, '', '')
call s:SetHighlight('Macro', s:purple, '', '')
call s:SetHighlight('Type', s:yellow, '', '')
call s:SetHighlight('Structure', s:cyan, '', '')
call s:SetHighlight('Special', s:violet, '', '')
call s:SetHighlight('Underlined', s:blue, '', '')
call s:SetHighlight('Error', s:bg, s:red, '')
call s:SetHighlight('Todo', s:orange, s:bg, 'italic')

" Git Commit Messages
call s:SetHighlight('gitcommitHeader', s:purple, '', '')
call s:SetHighlight('gitcommitUnmerged', s:green, '', '')
call s:SetHighlight('gitcommitSelectedFile', s:green, '', '')
call s:SetHighlight('gitcommitDiscardedFile', s:red, '', '')
call s:SetHighlight('gitcommitUnmergedFile', s:yellow, '', '')
call s:SetHighlight('gitcommitSelectedType', s:green, '', '')
call s:SetHighlight('gitcommitSummary', s:blue, '', '')
call s:SetHighlight('gitcommitDiscardedType', s:red, '', '')
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" Javascript
call s:SetHighlight('javaScriptBraces', s:fg, '', '')
call s:SetHighlight('javaScriptNull', s:orange, '', '')
call s:SetHighlight('javaScriptIdentifier', s:purple, '', '')
call s:SetHighlight('javaScriptNumber', s:orange, '', '')
call s:SetHighlight('javaScriptRequire', s:cyan, '', '')
call s:SetHighlight('javaScriptReserved', s:purple, '', '')

" pangloss/vim-javascript
call s:SetHighlight('jsArrowFunction', s:purple, '', '')
call s:SetHighlight('jsAsyncKeyword', s:purple, '', '')
call s:SetHighlight('jsExtendsKeyword', s:purple, '', '')
call s:SetHighlight('jsClassKeyword', s:purple, '', '')
call s:SetHighlight('jsDocParam', s:green, '', '')
call s:SetHighlight('jsDocTags', s:cyan, '', '')
call s:SetHighlight('jsForAwait', s:purple, '', '')
call s:SetHighlight('jsFlowArgumentDef', s:yellow, '', '')
call s:SetHighlight('jsFrom', s:purple, '', '')
call s:SetHighlight('jsImport', s:purple, '', '')
call s:SetHighlight('jsExport', s:purple, '', '')
call s:SetHighlight('jsExportDefault', s:purple, '', '')
call s:SetHighlight('jsFuncCall', s:blue, '', '')
call s:SetHighlight('jsFunction', s:purple, '', '')
call s:SetHighlight('jsGlobalObjects', s:yellow, '', '')
call s:SetHighlight('jsGlobalNodeObjects', s:yellow, '', '')
call s:SetHighlight('jsModuleAs', s:purple, '', '')
call s:SetHighlight('jsNull', s:orange, '', '')
call s:SetHighlight('jsStorageClass', s:purple, '', '')
call s:SetHighlight('jsTemplateBraces', s:red, '', '')
call s:SetHighlight('jsTemplateExpression', s:red, '', '')
call s:SetHighlight('jsThis', s:red, '', '')
call s:SetHighlight('jsUndefined', s:orange, '', '')

" JSON
call s:SetHighlight('jsonBraces', s:fg, '', '')

" CSS
call s:SetHighlight('cssAttrComma', s:fg, '', '')
call s:SetHighlight('cssPseudoClassId', s:yellow, '', '')
call s:SetHighlight('cssBraces', s:fg, '', '')
call s:SetHighlight('cssClassName', s:yellow, '', '')
call s:SetHighlight('cssClassNameDot', s:yellow, '', '')
call s:SetHighlight('cssFunctionName', s:blue, '', '')
call s:SetHighlight('cssImportant', s:cyan, '', '')
call s:SetHighlight('cssIncludeKeyword', s:purple, '', '')
call s:SetHighlight('cssTagName', s:red, '', '')
call s:SetHighlight('cssMediaType', s:orange, '', '')
call s:SetHighlight('cssProp', s:fg, '', '')
call s:SetHighlight('cssSelectorOp', s:cyan, '', '')
call s:SetHighlight('cssSelectorOp2', s:cyan, '', '')

" Sass
call s:SetHighlight('sassAmpersand', s:red, '', '')
call s:SetHighlight('sassClassChar', s:yellow, '', '')
call s:SetHighlight('sassMixinName', s:blue, '', '')
call s:SetHighlight('sassVariable', s:purple, '', '')

" Less
call s:SetHighlight('lessAmpersand', s:red, '', '')
call s:SetHighlight('lessClassChar', s:yellow, '', '')
call s:SetHighlight('lessCssAttribute', s:fg, '', '')
call s:SetHighlight('lessFunction', s:blue, '', '')
call s:SetHighlight('lessVariable', s:purple, '', '')

" HTML
call s:SetHighlight('htmlEndTag', s:blue, '', '')
call s:SetHighlight('htmlLink', s:red, '', '')
call s:SetHighlight('htmlTag', s:blue, '', '')
call s:SetHighlight('htmlTitle', s:fg, '', '')
call s:SetHighlight('htmlSpecialTagName', s:purple, '', '')
call s:SetHighlight('htmlArg', s:yellow, '', 'italic')

" XML
call s:SetHighlight('xmlAttrib', s:yellow, '', 'italic')
call s:SetHighlight('xmlEndTag', s:blue, '', '')
call s:SetHighlight('xmlTag', s:blue, '', '')
call s:SetHighlight('xmlTagName', s:blue, '', '')

" Golang
call s:SetHighlight('goFunctionCall', s:blue, '', '')
call s:SetHighlight('goReceiverType', s:green, '', '')
call s:SetHighlight('goParamName', s:orange, '', '')
call s:SetHighlight('goParamType', s:green, '', '')
call s:SetHighlight('goTypeDecl', s:purple, '', '')
call s:SetHighlight('goTypeName', s:yellow, '', '')
call s:SetHighlight('goBuiltins', s:red, '', '')
call s:SetHighlight('goType', s:purple, '', '')
call s:SetHighlight('goSignedInts', s:purple, '', '')
call s:SetHighlight('goUnsignedInts', s:purple, '', '')
call s:SetHighlight('goFloats', s:purple, '', '')
call s:SetHighlight('goComplexes', s:purple, '', '')

" Ruby
call s:SetHighlight('rubyInterpolation', s:cyan, '', '')
call s:SetHighlight('rubyInterpolationDelimiter', s:violet, '', '')
call s:SetHighlight('rubyRegexp', s:cyan, '', '')
call s:SetHighlight('rubyRegexpDelimiter', s:violet, '', '')
call s:SetHighlight('rubyStringDelimiter', s:green, '', '')

" TeX
call s:SetHighlight('texBeginEndName', s:blue, '', '')
call s:SetHighlight('texMathMatcher', s:blue, '', '')
call s:SetHighlight('texCite', s:green, '', '')
call s:SetHighlight('texRefZone', s:green, '', '')
call s:SetHighlight('texInputFile', s:green, '', '')
call s:SetHighlight('texMath', s:orange, '', '')
call s:SetHighlight('texMathOper', s:yellow, '', '')

" Markdown
call s:SetHighlight('markdownBold', s:yellow, '', 'bold')
call s:SetHighlight('markdownCode', s:cyan, '', '')
call s:SetHighlight('markdownCodeBlock', s:cyan, '', '')
call s:SetHighlight('markdownCodeDelimiter', s:cyan, '', '')
call s:SetHighlight('markdownHeadingDelimiter', s:green, '', '')
call s:SetHighlight('markdownHeadingRule', s:comments, '', '')
call s:SetHighlight('markdownId', s:purple, '', '')
call s:SetHighlight('markdownItalic', s:blue, '', 'italic')
call s:SetHighlight('markdownListMarker', s:orange, '', '')
call s:SetHighlight('markdownOrderedListMarker', s:orange, '', '')
call s:SetHighlight('markdownRule', s:comments, '', '')
call s:SetHighlight('markdownUrl', s:purple, '', '')
call s:SetHighlight('markdownUrlTitleDelimiter', s:green, '', '')

" vim-gitgutter
call s:SetHighlight('GitGutterAdd', s:green, '', '')
call s:SetHighlight('GitGutterChange', s:yellow, '', '')
call s:SetHighlight('GitGutterChangeDelete', s:orange, '', '')
call s:SetHighlight('GitGutterDelete', s:red, '', '')

" vim-signify
hi link SignifySignAdd GitGutterAdd
hi link SignifySignChange GitGutterChange
hi link SignifySignDelete GitGutterDelete

" vim-better-whitespace
call s:SetHighlight('ExtraWhitespace', '', s:red, '')

" Neovim terminal colors
if has('nvim')
  let g:terminal_color_background = s:bg
  let g:terminal_color_foreground = s:fg
  let g:terminal_color_0 = s:black
  let g:terminal_color_1 = s:red
  let g:terminal_color_2 = s:green
  let g:terminal_color_3 = s:yellow
  let g:terminal_color_4 = s:blue
  let g:terminal_color_5 = s:purple
  let g:terminal_color_6 = s:cyan
  let g:terminal_color_7 = s:white
  let g:terminal_color_8 = g:terminal_color_0
  let g:terminal_color_9 = g:terminal_color_1
  let g:terminal_color_10 = g:terminal_color_2
  let g:terminal_color_11 = g:terminal_color_3
  let g:terminal_color_12 = g:terminal_color_4
  let g:terminal_color_13 = g:terminal_color_5
  let g:terminal_color_14 = g:terminal_color_6
  let g:terminal_color_15 = g:terminal_color_7
endif

