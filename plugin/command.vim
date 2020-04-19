command! PPJSON %! jq --indent 4 .
command! PPHTML !tidy -mi -html -wrap 0 %
command! PPXML !tidy -mi -xml -wrap 0 %

command! W :w
command! Q :q
