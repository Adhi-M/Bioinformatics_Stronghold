# Copy and paste your Rosalind dataset inside these triple quotes
dataset = """
XXX
"""

# Makes the dataset into a clean list of DNA strings
lines = dataset.split("\n")
dna_strings = []
current_dna = ""

for line in lines:
if line.startswith(">"):
if current_dna != "":
dna_strings.append(current_dna)
current_dna = ""
else:
current_dna = current_dna + line.strip()

if current_dna != "":
dna_strings.append(current_dna)

# To find out the length of the DNA strings
dna_length = len(dna_strings[0])

# Counts matrix lists
# Each list will have a length equal to the length of our DNA strings
count_A = [0] * dna_length
count_C = [0] * dna_length
count_G = [0] * dna_length
count_T = [0] * dna_length

# Counts the letters column by column
for dna in dna_strings:
for i in range(dna_length):
letter = dna[i]
if letter == "A":
count_A[i] += 1
elif letter == "C":
count_C[i] += 1
elif letter == "G":
count_G[i] += 1
elif letter == "T":
count_T[i] += 1

# Builds the consensus string
consensus = ""
for i in range(dna_length):
# Finds out which letter has the largest count at position i
max_count = count_A[i]
best_letter = "A"

if count_C[i] > max_count:
max_count = count_C[i]
best_letter = "C"
if count_G[i] > max_count:
max_count = count_G[i]
best_letter = "G"
if count_T[i] > max_count:
max_count = count_T[i]
best_letter = "T"

consensus = consensus + best_letter

# Prints out the outputs. The same way Rosalind wants
print(consensus)


# Helps print the counts nicely row by row
def print_row(label, counts_list):
row_text = label + ":"
for num in counts_list:
row_text = row_text + " " + str(num)
print(row_text)


print_row("A", count_A)
print_row("C", count_C)
print_row("G", count_G)
print_row("T", count_T)
