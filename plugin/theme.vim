
function! SetTheme(theme)
    let &background=a:theme
    execute 'colorscheme ' .g:theme_config[a:theme].colorscheme

    " Airline
    let g:airline_theme = g:theme_config[a:theme].airline_theme
    if exists("*AirlineTheme")
      execute 'AirlineTheme ' . g:theme_config[a:theme].airline_theme
    end
endfunction

function! BackgroundToggle()
    if  &background == "dark"
        call SetTheme("light")
    elseif &background == "light"
        call SetTheme("dark")
    endif
endfunction
