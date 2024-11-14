if exists("b:current_syntax")
	finish
endif

sy keyword type pub priv class inter enum struct union ext impl stat final mut
hi link type Keyword

let b:current_syntax = "cb"
