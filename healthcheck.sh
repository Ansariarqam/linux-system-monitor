#!/bin/bash

LOG_DIR=~/linux-monitoring-project/logs
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/health_$(date +%F).log"

# Colors
RED='\033[0;31m'
NC='\033[0m' # No Color

{
    echo "System Health Check - $(date)"
    echo "----------------------------------"

    # CPU Usage
    CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
    CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)
    echo "CPU Usage: $CPU_USAGE%"

    if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
        echo -e "${RED}⚠️  ALERT: High CPU usage detected!${NC}"
    fi

    echo

    # Memory Usage
    FREE_MEM=$(free -m | awk '/^Mem:/ {print $4}')
    echo "Free Memory: ${FREE_MEM}MB"

    if [ "$FREE_MEM" -lt 100 ]; then
        echo -e "${RED}⚠️  ALERT: Low available memory!${NC}"
    fi

    echo
    echo "Disk Usage:"
    df -h /

} | tee -a "$LOG_FILE"




