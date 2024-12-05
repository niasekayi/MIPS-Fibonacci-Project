#COMP ORG PROJECT

#testing loop for N, is it legal or naw

while True:
    try:
        N = int(input("Enter a value for N:\n"))  

        # Check if the input is legal
        if N <= 0:
            print("Illegal Number! ")
        elif N < 25:
            print("Illegal Number!")
        else:
            print("Number is legal!")
            break  # stop the loop
    except ValueError:
        print("Invalid input! Please enter a valid integer.")
 
#create the Fibonacci sequence using numbers entered by the user
a, b = 0, 1
print(f"The first {N} numbers in the Fibonacci sequence are:")
for _ in range(N):
    print(a, end=" ")
    a, b = b, a + b
