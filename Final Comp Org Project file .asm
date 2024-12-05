.data
# Strings using for user inputs and messages
prompt_input: .asciiz "Enter a value for N (>= 25):\n"
error_msg:    .asciiz "Illegal Number! Please try again.\n"
fib_output:   .asciiz "Fibonacci sequence:\n"
space:        .asciiz " "  # Define space to avoid errors

.text
.globl main  # Create the global entry point
main:
    # Print the prompt and validate input
    jal input_loop

    # Once valid input is obtained, calculate the Fibonacci sequence
    jal fibonacci_start

    # End program
    li $v0, 10   # Exit syscall
    syscall

# Input and validation loop
input_loop:
    # Print user input prompt
    li $v0, 4
    la $a0, prompt_input
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $t0, $v0  # Store user input in $t0

    # Validate the user number input to see if (N >= 25)
    blt $t0, 25, input_invalid  # If N < 25, then the input is invalid
    j input_valid               # If N >= 25, jump to valid input

input_invalid:
    # Print the error message
    li $v0, 4
    la $a0, error_msg
    syscall

    # Loop back to prompt user again for new entry
    j input_loop

input_valid:
    # Once input is valid, return to main
    jr $ra

# Fibonacci sequence calculation
fibonacci_start:
    # Print Fibonacci output header
    li $v0, 4
    la $a0, fib_output
    syscall

    # Set Fibonacci starting variables (formula uses fn=fn-1/fn-2, so initial values to start)
    li $t1, 0    # First number (F0)
    li $t2, 1    # Second number (F1)
    move $t3, $t0  # Counter (N)
fibonacci_loop:
    # Print the current Fibonacci number (F0)
    li $v0, 1
    move $a0, $t1
    syscall

    # Print a space after the number is printed
    li $v0, 4
    la $a0, space
    syscall

    # Calculate the next Fibonacci number
    add $t4, $t1, $t2  # F_next = F0 + F1
    move $t1, $t2      # Update F0 = F1
    move $t2, $t4      # Update F1 = F_next

    # Decrease counter by 1 each iteration (N)
    sub $t3, $t3, 1
    bgtz $t3, fibonacci_loop  # Continue if N > 0

    # Return to the main after printing the Fibonacci sequence
    jr $ra
