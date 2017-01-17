" Contains various functions that could be useful

" Deletes all trailing whitespace, include empty lines at the end of a file.
function Delete_trailing_whitespace() range
    if has("python")
python << ENDL
import vim

first = int(vim.eval("a:firstline")) - 1
last = int(vim.eval("a:lastline"))
curBuf = vim.current.buffer
lines = curBuf[first:last]

# Strip trailing whitespace
stripedLines = map((lambda line: line.rstrip(' \t')), lines)

newLines = []
foundNonBlankLine = False

# Search backwards through lines until the first non-blank line is encountered,
# then add the rest of the lines to newLines
stripedLines.reverse()

for line in stripedLines:
    if (line != "") or foundNonBlankLine:
        foundNonBlankLine = True
        newLines.append(line)
    else:
        continue

newLines.reverse()

curBuf[first:last] = newLines
ENDL
    endif
endfunction

" Factorial function
function Fact(num)
    if(a:num > 1)
        " = n * (n - 1) * ... * 2 * 1
        return a:num * Fact(a:num - 1)
    else if(a:num >= 0)
        return 1
    else
        echoerr "Can't take the factorial of a negative number"
        return -1
    endif
endfunction

" Gamma function
function Gamma(num)
    if has("python")
python << EOF
import math
import vim

# Interface directly with Python's gamma function
num = float(vim.eval("a:num"))
vim.command("return " + str(math.gamma(num)))
EOF
    endif
endfunction

" Return decimal number as approximated fraction (a string)
function Frac(num)
    if has("python")
python << EOF
import vim
from fractions import Fraction

num = float(vim.eval("a:num"))

if num == 0:
    vim.command("return 0")
else:
    limit = 1000
    if (1/num) > limit:
        limit = int(1/num) + 1

    frac = Fraction(num).limit_denominator(limit)

    vim.command("return \"" + str(frac) + "\"")
EOF
    endif
endfunction
