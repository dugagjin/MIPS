# Microprocessor without Interlocked Pipeline Stages (MIPS)

MIPS VHDL implementation for Spartan-6 FPGA using ISE.

## Files

The project has simulation and required files in order to upload to the FPGA.

## VHDL code
### What is already implemented

- Multiplexer
- Sign extender
- ALU
- Register file
- Instruction Memory
- Data memory
- ALU controller
- Controller
- Program counter adder
- Program counter

## Tested
### What is already tested

- Multiplexer
- Sign extender
- ALU
- Register file
- Instruction Memory
- Data memory
- ALU controller
- Controller
- Program counter adder
- Program counter

### What has to be tested

- reset at program counter
- check if program counter has to output per 4 bits starting from higher than 003FFFFC (hex)

## Built With

* [ISE 14.7 Webpack](https://www.xilinx.com/products/design-tools/ise-design-suite.html) - IDE
* [Spartan-6](https://www.xilinx.com/products/silicon-devices/fpga/spartan-6.html) - FPGA
* [MIPS Green Sheet](https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_Green_Sheet.pdf) - Reference Data
* [MIPS](https://i.imgur.com/6R3Xz.png) - Reference architecture

## Author

Dugagjin Lashi

## License

MIT
