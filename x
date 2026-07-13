# Put your Rosalind FASTA dataset here
dataset = """
XXX
"""

# To split the dataset into separate lines
lines = dataset.split("\n")

# WUsing dictionaries to store the DNA strings and their corresponding IDs
# Key will be the ID (like 'Rosalind_0101') and value will be the DNA string.
dna_dict = {}
current_id = ""
current_dna = ""

# Loop through the lines to read the FASTA format
for line in lines:
  if line.startswith(">"):
  # Puts the saved ID into our dictionary before moving to the next
  if current_id != "":
  dna_dict[current_id] = current_dna
  # Gets the new ID name by removing the '>' symbol
  current_id = line[1:].strip()
  current_dna = ""
  else:
  # Combines the DNA text lines
  current_dna = current_dna + line.strip()

# Telling it to add the very last entry to the dictionary
if current_id != "":
dna_dict[current_id] = current_dna

# Compares every DNA string with every OTHER DNA string
for id1 in dna_dict:
for id2 in dna_dict:

# A string cannot connect to itself as per the problem (s != t)
if id1 == id2:
continue

dna1 = dna_dict[id1]
dna2 = dna_dict[id2]

# Gets the last 3 letters of the first DNA string
suffix = dna1[-3:]

# Gets the first 3 letters of the second DNA string
prefix = dna2[:3]

# If they match, prints out the two IDs separated by a space
if suffix == prefix:
print(id1, id2)
