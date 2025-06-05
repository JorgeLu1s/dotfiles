" Define syntax group for keywords
syntax keyword CustomKeyword if then get else find send pass set create list var def method function for while return break continue end do in each as is not and or xor true false nil null after SELECT FROM WHERE select from where and

" Define syntax group for types
syntax keyword CustomType number string bool

" Define syntax group for operators
syntax match CustomOperator /[+\-*/%=<>!&|^~]/

" Define syntax group for numbers (integer and float)
syntax match CustomNumber /\<\d\+\(\.\d\+\)\?\>/

" Define syntax group for strings (single and double quotes)
syntax region CustomString start=/"/ end=/"/
syntax region CustomString start=/'/ end=/'/

" Define syntax group for booleans
syntax match CustomBoolean /\<true\|\<false\>/

" Define syntax group for comments (// style)
syntax match CustomComment /\/\/.*/

" Define syntax group for identifiers (variable and function names)
syntax match CustomIdentifier /\<[a-zA-Z_][a-zA-Z0-9_]*\>/

" Define syntax group for symbols (like parentheses, brackets, etc.)
syntax match CustomSymbol /[()\[\]{},.:]/

" Highlight groups (link them to built-in Vim highlight groups)
hi link CustomKeyword Keyword
hi link CustomType Type
hi link CustomOperator Operator
hi link CustomNumber Number
hi link CustomString String
hi link CustomBoolean Boolean
hi link CustomComment Comment
hi link CustomIdentifier Identifier
hi link CustomSymbol Delimiter
