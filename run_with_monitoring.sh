#!/bin/bash

# Start DAFoam in background
mpirun -np 4 python runScript.py &> dafoam_log.txt &
DAFOAM_PID=$!

echo "DAFoam started with PID: $DAFOAM_PID"

# Monitor memory usage
while kill -0 $DAFOAM_PID 2>/dev/null; do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    # Total RSS memory of all MPI processes
    TOTAL_MEM=$(ps --no-headers -o rss -C python | awk '{sum+=$1} END {print sum/1024/1024 " GB"}')
    echo "$TIMESTAMP - Total Memory: $TOTAL_MEM" | tee -a memory_log.txt
    sleep 1
done

echo "DAFoam finished"
