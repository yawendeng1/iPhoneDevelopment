# iPhone Development
## Week 1: Basic Calculator
Continue the calculator app we started in class. Add the necessary
buttons and the logic necessary to implement the following
operations: +, -, ×, ÷, +/-, %, AC, . (decimal point).
- Use color on the UI, make the operation buttons look different
than the number ones.
- You might want to add a isPartialResult property to your
code to keep track pending binary operations (+, -, ×, ÷).
- Highlight current operation button (like the iPhone calculator).
- Don’t worry about the difference between AC and C.

### Tests
In order for your assignment to receive the highest grade the
calculator must compile and pass all the following tests:
- Prevent the user from adding multiple decimal points in a number
(e.g., user shouldn’t be able to enter “0.12321.121.11”).
- When the calculator starts up it should display the number 0, pressing 0 multiple times should
not change the display.
- The button -/+ should not change the display for the number 0.
- Your calculator should be able to re-apply the same operation multiple times. So if the user hits
the following sequence of keys “7”, “+”, “1”, “=”, “=”, “=”, the final result should be 10. The same
applies to any of the binary operations.
Don’t worry about what happens when you type multiple operations in sequence. For instance,
when you type “1 + 2 x 3” on the iPhone calculator you get 7. We are not going to test for this.



## Week 2: Graphing Calculator
