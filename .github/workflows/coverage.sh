#!/bin/bash
NC='\033[0m'
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green

coverageFactor=30 # minimum percentage of unit tests coverage for each file
coverageResults=()

flutter test --coverage

# Get version of GNU tool
compare() {
    local value1="$1" operator="$2" value2="$3"
    awk -vv1="$value1" -vv2="$value2" 'BEGIN {
        split(v1, a, /\./); split(v2, b, /\./);
        if (a[1] == b[1]) {
            exit (a[2] '$operator' b[2]) ? 0 : 1
        }
        else {
            exit (a[1] '$operator' b[1]) ? 0 : 1
        }
    }'
}


path="./coverage/lcov.info"
while IFS= read -r line
do
    if [[ $line == 'SF:'* ]]; then
        currentFile=$line
        currentCov=0
    fi
    if [[ $line == 'LF:'* ]]; then
        currentLF=$(sed -r 's/^LF:([0-9]+)/\1/' <<< $line)
    fi
    if [[ $line == 'LH:'* ]]; then
        currentLH=$(sed -r 's/^LH:([0-9]+)/\1/' <<< $line)
    fi
    if [[ $line == 'end_of_record' ]]; then
        currentCov=$(printf %.2f\\n "$((10000 *   $currentLH/$currentLF))e-2")
        if compare $currentCov '>' $coverageFactor; then
            message=$(echo -e "${GREEN}$currentCov\t|\t$currentFile${NC}")
            echo "::notice ok: $message::Test coverage level"
        else
            message=$(echo -e "${RED}$currentCov\t|\t$currentFile${NC}\t<<< coverage mas be more then $coverageFactor%")
            echo "::notice low: $message::Test coverage level"
        fi
        coverageResults+=( $message )
        echo $message
    fi
done < "$path"
echo "results=$coverageResults" >> $GITHUB_OUTPUT
