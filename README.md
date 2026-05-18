# 💻 mips-assembly-labs1

This repository centralizes my low-level programming projects, laboratories, and challenges developed for the Computer Architecture course. The main goal is to explore CPU operations, manual memory management, and low-level software optimization.

## 🛠️ Technologies and Tools
- **Language:** MIPS Assembly
- **Simulator:** MARS (MIPS Assembler and Runtime Simulator)

## 📁 Project Structure

### 1. Perfect Square & Square Root Detector
- **File:** `main.asm`
- **Description:** An optimized algorithm that calculates the square root of integers based on the sequential addition of odd numbers, entirely bypassing native hardware division or square root instructions. It validates whether the input is a perfect square and stores the execution history using arrays aligned in physical memory (`.align 2`).
