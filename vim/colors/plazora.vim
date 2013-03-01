  " Vim color scheme
  "
  " Name:         plazora.vim 
  " Maintainer:   Georgi Mitrev <gvmitrev@gmail.com> 
  " Last Change:  02.09.2012
  " License:      public domain
  " Version:      1.0.1
  "
  " This scheme should work in the GUI and in xterm's 256 color mode. It won't
  " work in 8/16 color terminals.
  "
  " I based it on John Lam's initial VibrantInk port to Vim [1]. Thanks to a
  " great tutorial [2], I was able to convert it to xterm 256 color mode. And
  " of course, credits go to Justin Palmer for creating the original VibrantInk
  " TextMate color scheme [3].
  "
  " [1] http://www.iunknown.com/articles/2006/09/04/vim-can-save-your-hands-too
  " [2] http://frexx.de/xterm-256-notes/
  " [3] http://encytemedia.com/blog/articles/2006/01/03/textmate-vibrant-ink-theme-and-prototype-bundle

  set background=dark
  hi clear
  if exists("syntax_on")
     syntax reset
  endif

  let g:colors_name = "plazora"

if has("gui_running")
    highlight Normal guifg=White   guibg=Black
    highlight Cursor guifg=Black   guibg=Yellow
    highlight Keyword guifg=#FF6600
    highlight Define guifg=#FF6600
    highlight Comment guifg=#9933CC
    highlight Type guifg=White gui=NONE
    highlight rubySymbol guifg=#339999 gui=NONE
    highlight Identifier guifg=White gui=NONE
    highlight rubyStringDelimiter guifg=#66FF00
    highlight rubyInterpolation guifg=White
    highlight rubyPseudoVariable guifg=#339999
    highlight Constant guifg=#FFEE98
    highlight Function guifg=#FFCC00 gui=NONE
    highlight Include guifg=#FFCC00 gui=NONE
    highlight Statement guifg=#FF6600 gui=NONE
    highlight String guifg=#66FF00
    highlight Search guibg=White
    highlight CursorLine guibg=#323300
else
    set t_Co=256
    highlight Normal ctermfg=White  
    highlight Cursor ctermfg=Black ctermbg=Yellow 
    highlight Keyword ctermfg=202 
    highlight Define ctermfg=202
    highlight Comment ctermfg=222
    highlight Type ctermfg=15
    highlight rubySymbol ctermfg=111
    highlight rubyClass ctermfg=166 cterm=bold
    highlight rubyRailsUserClass ctermfg=white cterm=bold
    highlight rubyConstant ctermfg=white cterm=bold
    highlight Identifier ctermfg=White 
    highlight rubyInterpolation ctermfg=White 
    highlight Constant ctermfg=228 
    highlight Function ctermfg=220 
    highlight Include ctermfg=220 cterm=bold 
    highlight Statement ctermfg=202
    highlight String ctermfg=82 
    highlight Search ctermbg=153 ctermfg=18
    highlight CursorLine cterm=NONE ctermbg=235
    highlight LineNr ctermfg=245 
    highlight rubyDefine ctermfg=166 cterm=bold
    highlight rubyAttribute ctermfg=166 cterm=bold
    highlight rubyControl ctermfg=166 cterm=bold
    highlight rubyConditional ctermfg=166 cterm=bold
    highlight rubyInstanceVariable ctermfg=147 cterm=bold
    highlight rubyFunction ctermfg=179 cterm=bold
    highlight rubyException ctermfg=167 cterm=bold
    highlight rubyRailsFilterMethod ctermfg=179 cterm=bold
    highlight rubyString ctermfg=149
    highlight rubyStringDelimiter ctermfg=149
    highlight rubyRailsMethod ctermfg=167 cterm=bold
    " highlight rubyPseudoVariable ctermfg=167 cterm=bold
    highlight rubyPseudoVariable ctermfg=223 cterm=bold
    highlight rubyLocalVariableOrMethod ctermfg=167
    highlight rubyBoolean ctermfg=167 cterm=bold
    
    " gemfile
    highlight rubyGemfileMethod ctermfg=166 cterm=bold

    " css
    highlight cssBoxProp ctermfg=111 cterm=bold
    highlight cssFontProp ctermfg=111 cterm=bold
    highlight cssColorProp ctermfg=111 cterm=bold
    highlight cssTextProp ctermfg=111 cterm=bold
    highlight cssRenderProp ctermfg=111 cterm=bold
    highlight cssUIProp ctermfg=111 cterm=bold
    highlight cssTagName ctermfg=179 cterm=bold
    highlight cssClassName ctermfg=179 cterm=bold
    highlight cssIdentifier ctermfg=179 cterm=bold
    highlight cssBraces ctermfg=179 cterm=bold
    highlight cssURL ctermfg=149
    highlight cssValueLength ctermfg=149
    highlight cssColor ctermfg=149 cterm=bold
    highlight cssFontAttr ctermfg=149
    highlight cssComment ctermfg=grey 

    " javascript
    highlight javaScriptStringD ctermfg=149
    highlight confstring  ctermfg=149
    highlight javaScriptStringS ctermfg=149
    highlight javaScriptFunction ctermfg=166
    highlight javascriptRailsFunction ctermfg=111 cterm=bold 
    highlight javascriptBraces ctermfg=white
    highlight javascriptMember ctermfg=166 cterm=bold
    highlight javascriptOperator ctermfg=166 cterm=bold
    highlight javascriptFunction ctermfg=166 cterm=bold
    highlight javascriptConditional ctermfg=166 cterm=bold

    " html
    highlight htmlTagName ctermfg=222 cterm=bold
    highlight htmlSpecialTagName ctermfg=222 cterm=bold
    highlight htmlEndTag ctermfg=222 cterm=bold
    highlight htmlTag ctermfg=222 cterm=bold
    highlight htmlString ctermfg=149
    highlight htmlValue ctermfg=149

    " coffeescript
    highlight coffeeString ctermfg=149
    highlight coffeeExtendedOp ctermfg=166 cterm=bold
    highlight coffeeConditional ctermfg=166 cterm=bold
    highlight coffeeKeyword ctermfg=166 cterm=bold
    highlight coffeeStatement ctermfg=166 cterm=bold
    highlight coffeeBoolean ctermfg=167 cterm=bold
    highlight coffeeSpecialVar ctermfg=223 cterm=bold
    highlight coffeeParen ctermfg=white cterm=bold


    " eruby
    highlight erubyDelimiter ctermfg=white
    highlight erubyRailsHelperMethod ctermfg=167 cterm=bold
    highlight erubyRailsRenderMethod ctermfg=167 cterm=bold
    highlight rubyLocalVariableOrMethod ctermfg=167
    highlight rubyKeyword ctermfg=166 cterm=bold 

    " yaml
    highlight yamlFlowString ctermfg=149
    highlight yamlFlowStringDelimiter ctermfg=149
    highlight yamlBlockMappingKey ctermfg=111

    " vim
    highlight vimHighlight ctermfg=166 cterm=bold
    highlight vimCommand ctermfg=166 cterm=bold
    highlight vimString ctermfg=149
    highlight vimOption ctermfg=111
    highlight vimHiAttrib ctermfg=111
endif
