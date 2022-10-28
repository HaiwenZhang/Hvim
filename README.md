# Haiwen Nvim config user guide


## COC

Create compile_commands.json for c/c++ auto complete

- cmake
``` bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -B .vscode ./

```

- make

``` bash
cd .vscode
bear -- make -jn -C ..

```
