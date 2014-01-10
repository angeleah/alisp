alisp
=====
In wanting to know more about what was happening under the hood, [Michael Baker](https://github.com/MichaelBaker) broke it down for me by getting me to think like a computer.  He got me started on this and had me finish it as "homework".

GETTING STARTED
---------------
- To use this:
  + Clone this repo.
  + cd into the project directory.
  + This program takes an expression wrapped in a string and can add or multiply. Try feeding it the examples below and varify the results.(ex:$ ruby parse.rb "(+ 1 1)") Each one of these examples is what drove the design of the program, starting with a simple case and moving forward.
    - "(+ 1 1)"
    - "(+ 1 (+ 3 4))"
    - "(+ (* 2 2) (+ 3 4))"
    - "(+ (* 2 2) (+ 3 (+ 1 1)))"
