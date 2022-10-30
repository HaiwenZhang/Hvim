# Haiwen Nvim config user guide


## LSP

Create compile_commands.json for c/c++ auto complete

- cmake project
``` bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1

```

- make project
``` bash
make clean
bear -- make 
```
