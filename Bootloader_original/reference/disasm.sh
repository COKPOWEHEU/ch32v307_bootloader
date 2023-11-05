#!/bin/bash



echo "MEMORY{ flash (rxai!w) : ORIGIN = 0x00000000, LENGTH = 128K }" > ld.ld
echo -e ".global _start\n.text\n_start:\n.org 0\n" > res.S

echo "j	0x16d2" >> res.S

#start: vector table
riscv64-unknown-elf-objdump -b binary -m riscv:rv32 -D -z --start-address=0x04 --stop-address=0x200 Boot_V307_.bin > boot_vector.lss
cat boot_vector.lss |
sed -E "s/\s+([0-9a-f]*:)\s+([0-9a-f]{8}).*/_\1\t.word 0x\2/" |
sed -E "s/\s+([0-9a-f]*:)\s+([0-9a-f]{4}).*/_\1\t.half 0x\2/" |
tail -n +8 >> res.S

#-Mno-aliases
riscv64-unknown-elf-objdump -b binary -m riscv:rv32 -D -z --start-address=0x200 --stop-address=0x1802 Boot_V307_.bin > boot.lss

cat boot.lss |
# неверная трактовка сырых данных как инструкций (2 байта). Заменяем на .half
sed -E "s/(\s*[0-9a-f]+):\s+(([0-9a-f]+)\s*(unimp|c.fld|c.fsd)(.*))/\1:\t\3\t\t.half\t0x\3\t\t#\2/" |
# неверная трактовка сырых данный как инструкций (4 байта). Заменяем на .word
sed -E "s/(\s*[0-9a-f]+):\s+(([0-9a-f]+)\s*(fmadd.s)(.*))/\1:\t\3\t\t.word\t0x\3\t\t#\2/" |
# j addr -> j _start+addr
sed -E "s/(\s*[0-9a-f]+):\s+(([0-9a-f]+)\s*(j|jal|c.jal|c.j)\s(.*))/\1:\t\t\3 \4 _start+\5\t#\2/" |
# j rx,addr -> j rx, _start+addr
sed -E "s/(\s*[0-9a-f]+):\s+(([0-9a-f]+)\s*(bnez|beqz|bltz|bgez|jal|c.bnez|c.beqz|c.bltz|c.jal)\s(\s*[a-z0-9]*),(.*))/\1:\t\t\3 \4 \5, _start+\6\t#\2/" |
# j rx, ry,addr -> j rx,ry, _start+addr
sed -E "s/(\s*[0-9a-f]+):\s+(([0-9a-f]+)\s*(bne|beq|blt|bltu|bgeu)\s(\s*[a-z0-9]*),(\s*[a-z0-9]*),(.*))/\1:\t\t\3 \4 \5,\6, _start+\7\t#\2/" |

# костыли с неверным ассемблированием. Наверное, там сырые данные
sed -E "s/lui	a5,0x2$/.word 0x000027b7/" |
sed -E "s/(\s*9ba:\s*[0-9a-f]*\s*).*/\1.word 0x76c000ef/" |
sed -E "s/(\s*cb8:\s*[0-9a-f]*\s*).*/\1.word 0xf40784e3/" |
sed -E "s/(\s*f9a:\s*[0-9a-f]*\s*).*/\1.word 0x00078793/" |
sed -E "s/(\s*1130:\s*[0-9a-f]*\s*).*/\1.word 0x756000ef/" |
sed -E "s/(\s*1494:\s*[0-9a-f]*\s*).*/\1.word 0x00078793/" |
sed -E "s/(\s*172c:\s*[0-9a-f]*\s*).*/\1.word 0x000062b7/" |



tail -n +8 |
sed -E "s/\s*([0-9a-f]+:)\s*([0-9a-f]+)(.*)/_\1\t\3\t#(code= \2 )/" |
sed -E "s/.*:	Address .* is out of bounds./.half 0x00FF /">> res.S

echo "//---end---" >> res.S

#finish: raw data
riscv64-unknown-elf-objdump -b binary -m riscv:rv32 -D -z --start-address=0x1802 --stop-address=0x2100 Boot_V307_.bin > boot_end.lss
cat boot_end.lss |
sed -E "s/\s+([0-9a-f]*:)\s+(([0-9a-f]{4} )([0-9a-f]{4} )([0-9a-f]{4} )([0-9a-f]{4} )).*/_\1\t.half 0x\3, 0x\4, 0x\5, 0x\6/" |
sed -E "s/\s+([0-9a-f]*:)\s+([0-9a-f]{8}).*/_\1\t.word 0x\2/" |
sed -E "s/\s+([0-9a-f]*:)\s+([0-9a-f]{4}).*/_\1\t.half 0x\2/" |
tail -n +8 >> res.S

#проверка: собираем ассемблерный файл обратно и сравниваем с оригиналом
echo "--- Testing ---"
riscv64-unknown-elf-gcc -march=rv32imafc -mabi=ilp32 -mcmodel=medany -nostdlib res.S -T ld.ld -o res.elf
riscv64-unknown-elf-objcopy -O binary res.elf res.bin
riscv64-unknown-elf-objdump -D -z res.elf > res.lss

hexdump Boot_V307_.bin > src.hex
hexdump res.bin > res.hex
diff res.hex src.hex | head

rm src.hex res.hex ld.ld boot.lss boot_end.lss boot_vector.lss