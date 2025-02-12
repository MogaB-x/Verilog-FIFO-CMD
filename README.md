# Verilog FIFO with Double-Port RAM

This project implements a FIFO buffer in Verilog using a double-port RAM and a command logic module. 
The FIFO is designed to handle push and pop operations with control signals for full and empty states. 
The write and read pointers are managed by the command logic to ensure proper operation.

## Features
- FIFO buffer using double-port RAM
- Control logic for push/pop operations
- Full and empty flags to manage FIFO state
- Simulated in Verilog for testing

## Usage
- Simulate the FIFO behavior using a Verilog simulator (e.g. Vivado).
- Modify the `NADDR` and `WIDTH` parameters to adjust the FIFO's depth and data.
- Use the FIFO in designs requiring a simple, efficient first-in-first-out buffer with push/pop operations and full/empty state control.
