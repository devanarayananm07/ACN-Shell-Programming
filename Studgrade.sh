  grades.txt file
  ==============

Alice, 50%
Bob, 45%
Charlie, 70%
David, 90%


                    Student grade.sh file
                    ==================
                        
INPUT_FILE="grades.txt"

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Input file not found!"
    exit 1
fi

declare -A grades

while IFS=',' read -r name grade; do
    grades["$name"]=$grade
done < "$INPUT_FILE"

echo "Contents of $INPUT_FILE:"
echo "--------------------------"
cat "$INPUT_FILE"
echo "--------------------------"
echo "Parsing and displaying grades:"
for name in "${!grades[@]}"; do
    echo "$name: ${grades[$name]}"
done
