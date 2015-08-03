A proof of concept application that can be interrupted, provided the heavy calculation is being done in at least two parts or you have access to the part of the code that is involved in this heavy computation. In the following example, a big `data.frame` is created in two parts. If you manage to press the button before the second part is executed, the program will stop. To stop a calculation per-se, it may require some manual override, perhaps by passing a "CTRL+c" to console?

To start, move slider to generate a large data.frame, which is being built in two parts. If you press 'Stop computation' before the second part is being initiated, the program will exit and wait for your further input.

You can run this example from R by typing

```r
library(shiny)
runGitHub("romunov/shinyapps", subdir = "breaker")
```