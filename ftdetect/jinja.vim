" Figure out which type of hilighting to use for html.
fun! s:SelectHTML()
  let n = 1
  while n < 50 && n <= line("$")
    " check for jinja
    if getline(n) =~ '{{.*}}\|{%-\?\s*\(end.*\|extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      set ft=jinja.html
      return
    endif
    let n = n + 1
  endwhile
endfun
autocmd BufNewFile,BufRead *.html,*.htm,*.nunjucks,*.nunjs,*.njk  call s:SelectHTML()
autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja set ft=jinja
autocmd BufNewFile,BufRead *.sh.jinja set ft=sh isk-=$
autocmd BufNewFile,BufRead *.cfg.jinja set ft=cfg
autocmd BufNewFile,BufRead *.yaml.jinja set ft=yaml
