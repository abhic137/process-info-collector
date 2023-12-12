echo "Timestamp,Memory(%),CPU(%)" > process_info.csv  # Header line

for i in {1..10}; do
    ps -p 91132 -o pid,%mem,%cpu --no-headers \
    | awk -v date="$(date +"%Y-%m-%d %H:%M:%S")" '{print date "," $2 "," $3}' \
    >> process_info.csv

    sleep 1  # Wait for 1 second
done
echo "DONE !"
