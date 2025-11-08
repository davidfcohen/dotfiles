# David's Dotfiles

Clone the repository and link the desired files to the expected location.

```
$ git clone git@github.com:davidfcohen/dotfiles.git
$ cd dotfiles
$ rm -i ~/.bashrc
$ ln -s ./bashrc ~/.bashrc
```

| Dotfile(s)     | Program        | Expected Location |
| -------------- | -------------- | ----------------- |
| `bashrc`       | Bash           | `~/.bashrc`       | 
| `bash_profile` | Bash           | `~/.bash_profile` |
| `helix`        | Helix (editor) | `~/.config/helix` |
