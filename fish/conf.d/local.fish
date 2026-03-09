set LOCAL_BIN "/home/jesus/.local/bin"
if not string match -q -- $LOCAL_BIN $PATH
    set PATH "$LOCAL_BIN" $PATH
end
