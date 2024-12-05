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
 

