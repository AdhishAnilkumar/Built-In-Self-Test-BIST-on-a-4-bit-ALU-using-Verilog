# Built-In-Self-Test-BIST-on-a-4-bit-ALU-using-Verilog
**Objective of this project:** To implement Built in Self Test(BIST) on a 4-Bit ALU in Verilog.<br>
**Software Used:** Vivado<br>
<br>
**Theory**<br>
Built-In Self-Test (BIST) is a Design for Testability (DFT) technique in which additional hardware is integrated into a digital circuit to enable it to generate test patterns, analyze responses, and verify its own functionality without relying on extensive external test equipment. <br>
A BIST architecture comprises of mainly 4 blocks:<br>
1)**Test Pattern Generator(TPG):** This generates various test patterns which are given to Circuit Under Test (CUT) to verify its functional correctness and detect faults.<br>
2)**Circuit Under Test (CUT):**Here the circuit in which BIST is tested on is placed to identify whether it is fault free or not.
3)**Ouput Response Analyser(ORA):**
