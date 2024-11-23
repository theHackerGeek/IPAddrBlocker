#!/bin/bash



echo "===================== Log File Analyzer ===================="



# Input log file

LOG_FILE="nginx_logs.log"



# Output file for blocked IPs

OUTPUT_FILE="blocked_ip.txt"



# Clear the output file if it exists

> $OUTPUT_FILE



# Read the log file line by line and extract IPs with 401 status

while read -r line; do

    # Check if the line contains a 401 Unauthorized response
    
        if echo "$line" | grep -wq "401"; then
        
                # Extract the IP address from the line (assuming IP is the first field)
                
                        IP=$(echo "$line" | awk '{print $1}')
                        
                                echo "$IP" >> $OUTPUT_FILE
                                
                                    fi
                                    
                                    done < $LOG_FILE
                                    
                                    
                                    
                                    echo "Blocked IPs have been saved to $OUTPUT_FILE"
                                    
                            
