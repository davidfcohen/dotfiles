if status is-login
    keychain --eval $HOME/.ssh/id_* | source
end
