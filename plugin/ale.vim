" let g:ale_linters = {'go': ['gometalinter' ]}
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['autopep8', 'isort'],
            \}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
