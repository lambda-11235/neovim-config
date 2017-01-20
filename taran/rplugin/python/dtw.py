import neovim

@neovim.plugin
class DeleteTrailingWhitespace(object):
    def __init__(self, vim):
        self.vim = vim
        self.whitespace = " \t\v\n\r"

    @neovim.command('DeleteTrailingWhitespace', range='', sync=True)
    def dtw(self, vrange):
        buf = self.vim.current.buffer

        for idx in range(vrange[0] - 1, vrange[1]):
            if self._has_trailing_whitespace(buf[idx]):
                buf[idx] = self._strip_triling_whitespace(buf[idx])


    @neovim.command('DeleteTrailingLines', sync=True)
    def dtl(self):
        buf = self.vim.current.buffer

        # Start at end of buffer and delete whitespace lines until
        # non-whitespace is found.
        for idx in range(len(buf) - 1, 0 - 1, -1):
            if self._is_whitespace(buf[idx]):
                del(buf[idx])
            else:
                break


    def _strip_triling_whitespace(self, line):
        return line.rstrip(self.whitespace)

    def _has_trailing_whitespace(self, line):
        if len(line) > 0:
            return self._is_whitespace_char(line[len(line) - 1])
        else:
            return True

    def _is_whitespace_char(self, char):
        return self.whitespace.count(char) > 0

    def _is_whitespace(self, line):
        for char in line:
            if not self._is_whitespace_char(char):
                return False

        return True
