function theme#settheme(theme)
    let &background=a:theme

    " Airline
    let g:airline_theme = g:theme_config[a:theme].airline_theme
    if exists(':AirlineTheme')
      execute 'AirlineTheme ' . g:theme_config[a:theme].airline_theme
    end

    execute 'colorscheme ' .g:theme_config[a:theme].colorscheme
endfunction

function theme#backgroundtoggle()
    if  &background == "dark"
        call SetTheme("light")
    elseif &background == "light"
        call SetTheme("dark")
    endif
endfunction

nnoremap <unique> <Plug>BackgroundToggle :call theme#backgroundtoggle()<CR>
