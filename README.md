# x86 Assembly (8086) Examples

A small collection of **x86 (8086) assembly programs for DOS**, demonstrating low-level programming concepts such as memory manipulation, keyboard input handling, and direct access to video memory.

These examples were written as part of academic coursework and are published with permission.

---

## 📂 Included Programs

### `sorts.asm`
A comprehensive implementation of three classic sorting algorithms: **Insertion Sort**, **Selection Sort**, and **Bubble Sort**.
* Demonstrates modular programming using **procedures**.
* Uses **stack-based parameter passing** for function calls.
* Includes a custom routine for printing **signed decimal numbers** to the console.

---

### `data_changing.asm`
Demonstrates basic data manipulation and memory operations in 8086 assembly.  
Focuses on register usage, data movement, and simple logic.

---

### `israel_flag.asm`
Draws the Israeli flag in **text mode** using direct access to video memory at `0xB800`.  
Illustrates screen manipulation, loops, and color attributes.

---

### `visual_0B800h_running_dot.asm`
An interactive visual demo that displays a moving dot on the screen.  
Demonstrates keyboard input handling and real-time updates using video memory.

---

## 🧠 Key Concepts Demonstrated

- 8086 instruction set
- **Stack frames & Procedure parameters**
- **Sorting algorithms implementation**
- Segment and offset addressing
- Direct video memory access (`0xB800`)
- Keyboard input via BIOS interrupts
- Loops, conditional jumps, and signed arithmetic
- Low-level screen rendering in text mode

---

## ▶️ How to Run

These programs are intended to run in a DOS environment.

They can be assembled using **TASM** or **MASM** and executed in **DOSBox** or **DOSBox-X**.

Example (TASM):
```text
tasm program.asm
tlink program.obj
program.exe
