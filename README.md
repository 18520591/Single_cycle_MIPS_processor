# Verilog code for 16-bit single cycle MIPS processor
* In this project, a 32-bit single-cycle MIPS processor is implemented in Verilog HDL. MIPS is an RISC processor, which is widely used by many universities in academic courses related to computer organization and architecture.
* The Instruction Format and Instruction Set Architecture for the 32-bit single-cycle MIPS are as follows:
![image](https://user-images.githubusercontent.com/67142437/115213108-67ad2c00-a12b-11eb-8278-8cb1d28b3a10.png)

* Below is the description for instructions being implemented in Verilog:
  * Add: R[rd] = R[rs] + R[rt]
  * Subtract: R[rd] = R[rs] - R[rt]
  * And: R[rd] = R[rs] & R[rt]
  * Or: R[rd] = R[rs] | R[rt]
  * Xor: R[rd] = R[rs] xor R[rt]
  * SLT: R[rd] = 1 if R[rs] < R[rt] else 0
  * Jr: PC = R[rs]
  * Lw: R[rt] = M[R[rs] + SignExtImm]
  * Sw: M[R[rs] + SignExtImm] = R[rt]
  * Beq: if(R[rs] == R[rt]) PC = PC + 4 + BranchAddr
  * Addi: R[rt] = R[rs] + SignExtImm
  * J: PC = JumpAddr
  * Jal: R[31] = PC + 4; PC = JumpAddr
  * SLTI: R[rt] = 1 if R[rs] < imm else 0
  * SignExtImm = {16{immediate[15],imm}
  * jumpAddr = {(PC+4)[31:28], {address[25:0], 2'b00}}
  * BranchAddr = {SignExtImm[29:0], 2'b00}
* Based on the provided instruction set, the data-path and control unit are designed and implemented.
* Control unit design:
![image](https://user-images.githubusercontent.com/67142437/115217205-75fd4700-a12f-11eb-895c-b146b59c8407.png)
![image](https://user-images.githubusercontent.com/67142437/115217340-9af1ba00-a12f-11eb-86db-fd5327d66fde.png)

