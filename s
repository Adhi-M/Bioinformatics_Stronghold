# Copy and paste your values here
alphabet_letters = ["X", "X", "X", "X"]
n = X

# A recursive function to build combinations letter by letter
def build_words(current_word):
# Stops building if our word reaches the target length n
if len(current_word) == n:
print(current_word)
return

# Loops through every letter in our alphabet list in order
for letter in alphabet_letters:
# Adds the letter to our current word and keep building
build_words(current_word + letter)

# Starts the function with an empty string
build_words("")
