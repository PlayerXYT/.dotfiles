if exists("b:current_syntax")
	finish
endif

sy match Comment "//.*"
sy region Comment start="\/\*" end="\*\/"

sy match String "\".*\""
sy match Character "\'\(\\\([0rn\'btfv\\]\|\d\{3\}\)\|.\)\'"
sy match Number "\d"
sy keyword Boolean true false
sy match Float "\d*\.\d\+"

"sy match Function "[a-z_][a-zA-Z_]*(.*)"

hi link Output Statement
sy keyword Conditional if else switch
sy keyword Repeat for do while
sy keyword Label case default break continue
sy keyword Operator + * - / <+ <- < > <= >= >> << -> "TODO: Doesn't work
sy keyword Output return yield
sy keyword Exception try catch throw

hi link Info PreProc
hi link Pragma PreProc
sy match Include "#include .*" "TODO: Does not catch errorous statements yet
sy match Define "#\(define\|defpragma\) .*"
sy match Info "#\(info\|warn\|error\|deprecated\|ignore\) .*"
sy match PreCondit "#\(ifdef\|ifndef\|endif\) .*"
sy match Pragme "#pragma .*"

hi link Primitive Type
hi link Visibility Type
hi link StructLink Type
hi link Functionals Type
sy keyword Primitive byte short int long ubyte uint ushort ulong float double str bool var void
sy keyword Visibility pub priv
sy keyword StorageClass stat final mut imu abs
sy keyword Structure struct union enum class inter
sy keyword StructLink ext impl
sy keyword Functionals getter setter

sy keyword Todo TODO FIXME XXX

let b:current_syntax = "cb"
