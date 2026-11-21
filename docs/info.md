<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->


## How it works

Combinational BCD-to-7-segment decoder taking a 4-bit binary-coded decimal input on `ui_in[3:0]` and driving the 7-segment display outputs on `uo_out[6:0]`. Values `0` through `9` map to their corresponding 7-segment patterns, while `10` through `15` turn the segments off.

## How to test

Apply a 4-bit BCD value (`0000` to `1001`) on `ui_in[3:0]` and verify the active segments on `uo_out[6:0]` match the expected decimal digit on the 7-segment display.

## External hardware

Optional 7-segment display connected to `uo_out[6:0]`.
