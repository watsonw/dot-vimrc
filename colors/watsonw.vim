" Vim color file
" Maintainer:   watsonw <watsonzju@gmail.com>
" Last Change:  April 15 2011
"
" Change History:
" wombat256.vim - a modified version of Wombat by Lars Nielsen that also
" works on xterms with 88 or 256 colors. The algorithm for approximating the
" GUI colors with the xterm palette is from desert256.vim by Henry So Jr.
"
" watsonw.vim - a modified version of wombat256.
"
" ********************************************************************************
" The following are the preferred 16 colors for your terminal
"           Colors      Bright Colors
" Black     #4E4E4E     #7C7C7C
" Red       #FF6C60     #FFB6B0
" Green     #A8FF60     #CEFFAB
" Yellow    #FFFFB6     #FFFFCB
" Blue      #96CBFE     #B5DCFE
" Magenta   #FF73FD     #FF9CFE
" Cyan      #C6C5FE     #DFDFFE
" White     #EEEEEE     #FFFFFF

set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "idon"

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
	finish
endif

" functions {{{
" returns an approximate grey index for the given grey level
fun <SID>grey_number(x)
	if &t_Co == 88
		if a:x < 23
			return 0
		elseif a:x < 69
			return 1
		elseif a:x < 103
			return 2
		elseif a:x < 127
			return 3
		elseif a:x < 150
			return 4
		elseif a:x < 173
			return 5
		elseif a:x < 196
			return 6
		elseif a:x < 219
			return 7
		elseif a:x < 243
			return 8
		else
			return 9
		endif
	else
		if a:x < 14
			return 0
		else
			let l:n = (a:x - 8) / 10
			let l:m = (a:x - 8) % 10
			if l:m < 5
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual grey level represented by the grey index
fun <SID>grey_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 46
		elseif a:n == 2
			return 92
		elseif a:n == 3
			return 115
		elseif a:n == 4
			return 139
		elseif a:n == 5
			return 162
		elseif a:n == 6
			return 185
		elseif a:n == 7
			return 208
		elseif a:n == 8
			return 231
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 8 + (a:n * 10)
		endif
	endif
endfun

" returns the palette index for the given grey index
fun <SID>grey_color(n)
	if &t_Co == 88
		if a:n == 0
			return 16
		elseif a:n == 9
			return 79
		else
			return 79 + a:n
		endif
	else
		if a:n == 0
			return 16
		elseif a:n == 25
			return 231
		else
			return 231 + a:n
		endif
	endif
endfun

" returns an approximate color index for the given color level
fun <SID>rgb_number(x)
	if &t_Co == 88
		if a:x < 69
			return 0
		elseif a:x < 172
			return 1
		elseif a:x < 230
			return 2
		else
			return 3
		endif
	else
		if a:x < 75
			return 0
		else
			let l:n = (a:x - 55) / 40
			let l:m = (a:x - 55) % 40
			if l:m < 20
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual color level for the given color index
fun <SID>rgb_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 139
		elseif a:n == 2
			return 205
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 55 + (a:n * 40)
		endif
	endif
endfun

" returns the palette index for the given R/G/B color indices
fun <SID>rgb_color(x, y, z)
	if &t_Co == 88
		return 16 + (a:x * 16) + (a:y * 4) + a:z
	else
		return 16 + (a:x * 36) + (a:y * 6) + a:z
	endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun <SID>color(r, g, b)
	" get the closest grey
	let l:gx = <SID>grey_number(a:r)
	let l:gy = <SID>grey_number(a:g)
	let l:gz = <SID>grey_number(a:b)

	" get the closest color
	let l:x = <SID>rgb_number(a:r)
	let l:y = <SID>rgb_number(a:g)
	let l:z = <SID>rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" there are two possibilities
		let l:dgr = <SID>grey_level(l:gx) - a:r
		let l:dgg = <SID>grey_level(l:gy) - a:g
		let l:dgb = <SID>grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = <SID>rgb_level(l:gx) - a:r
		let l:dg = <SID>rgb_level(l:gy) - a:g
		let l:db = <SID>rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" use the grey
			return <SID>grey_color(l:gx)
		else
			" use the color
			return <SID>rgb_color(l:x, l:y, l:z)
		endif
	else
		" only one possibility
		return <SID>rgb_color(l:x, l:y, l:z)
	endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun <SID>rgb(rgb)
	let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
	let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
	let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
	return <SID>color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
	if a:fg != ""
		exec "hi ".a:group." guifg=#".a:fg." ctermfg=".<SID>rgb(a:fg)
	endif
	if a:bg != ""
		exec "hi ".a:group." guibg=#".a:bg." ctermbg=".<SID>rgb(a:bg)
	endif
	if a:attr != ""
		if a:attr == 'italic'
			exec "hi ".a:group." gui=".a:attr." cterm=none"
		else
			exec "hi ".a:group." gui=".a:attr." cterm=".a:attr
		endif
	endif
endfun
" }}}

call <SID>X("Normal",		"cccccc",	"242424",	"none")
call <SID>X("Cursor",		"000000",	"00ff00",	"none")
call <SID>X("CursorLine",	"",			"32322e",	"none")
call <SID>X("CursorColumn",	"",			"2d2d2d",	"")
			"CursorIM
			"Question
			"IncSearch
call <SID>X("Search",		"000000",	"ecee90",	"bold")
call <SID>X("MatchParen",	"ecee90",	"857b6f",	"bold")
call <SID>X("SpecialKey",	"6c6c6c",	"2d2d2d",	"none")
call <SID>X("Visual",		"ecee90",	"597418",	"none")
call <SID>X("LineNr",		"857b6f",	"121212",	"none")
call <SID>X("Folded",		"a0a8b0",	"404048",	"none")
call <SID>X("Title",		"f6f3e8",	"",			"bold")
call <SID>X("VertSplit",	"666666",	"444444",	"none")
call <SID>X("StatusLine",	"f6f3e8",	"444444",	"italic")
call <SID>X("StatusLineNC",	"857b6f",	"444444",	"none")
			"Scrollbar
			"Tooltip
			"Menu
			"WildMenu
call <SID>X("Pmenu",		"f6f3e8",	"444444",	"")
call <SID>X("PmenuSel",		"121212",	"caeb82",	"")
call <SID>X("WarningMsg",	"ff0000",	"",			"")
			"ErrorMsg
			"ModeMsg
			"MoreMsg
			"Directory
call <SID>X("DiffAdd",		"", 		"00008b", 	"")
call <SID>X("DiffDelete", 	"00008b", 	"008b8b", 	"bold")
call <SID>X("DiffChange", 	"", 		"8b008b", 	"")
call <SID>X("DiffText", 	"001100",	"ff008b", 	"bold")

" syntax highlighting
call <SID>X("Comment",		"c0bc6c",	"",			"italic")

call <SID>X("Constant",		"e5786d",	"",			"none")
			"Character
			"Boolean
call <SID>X("String",		"95e454",	"",			"italic")
call <SID>X("Number",		"e5786d",	"",			"none")
			"Float

call <SID>X("Identifier",	"caeb82",	"",			"none")
call <SID>X("Function",		"caeb82",	"",			"none")

call <SID>X("Statement",	"87afff",	"",			"none")
			"Conditional
			"Repeat
			"Label
			"Operator
			"Exception
call <SID>X("Keyword",		"87afff",	"",			"none")

call <SID>X("PreProc",		"9970cf",	"",			"none")
			"Define
			"Marco
			"PreCondit
call <SID>X("Include",		"ff9800",	"",			"none")

call <SID>X("Type",			"ffcc02",	"",			"none")
			"StorageClass
			"Structure
			"Typedef

call <SID>X("Special",		"ffdead",	"",			"none")
call <SID>X("Todo",			"857b6f",	"",			"italic")
			"Underlined
			"Error
			"Ignore

call <SID>X("SignColumn", 	"0000ff", 	"bebebe", 	"")

hi! link VisualNOS	Visual
hi! link NonText	LineNr
hi! link FoldColumn	Folded

"hi MarkWord1  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
"hi MarkWord2  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
"hi MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
"hi MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
"hi MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
"hi MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black
"hi SignColor  ctermbg=Blue     ctermfg=Black  guibg=#BEBEBE    guifg=Black
" delete functions {{{
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" }}}

" vim:set ts=4 sw=4 noet fdm=marker:
