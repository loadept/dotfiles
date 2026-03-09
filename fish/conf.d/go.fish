set GO_PATH $(go env GOPATH)/bin
if [ -d "$GO_PATH" ]
    set PATH "$GO_PATH" $PATH
end
