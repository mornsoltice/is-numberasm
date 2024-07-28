# is-numberasm

is-number package but for asm!

## how to run
```sh
nasm -f elf32 is_number.asm -o is_number.o
ld -m elf_i386 is_number.o -o is_number
./is_number 
```

to change the input you can edit it at the 
`input_db` at line 2 to change whatever input you want

