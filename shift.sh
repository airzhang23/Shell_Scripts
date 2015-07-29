#!/bin/sh
#
# SCRIPT: shifting.sh
#
# AUTHOR: Randy Michael
#
# DATE:   12/30/2007
#
# REV:    1.1.A
#
# PLATFORM: Not platform dependent
#
# PURPOSE: This script is used to process all of the tokens which
# are pointed to by the command-line arguments, $1, $2, $3, etc…
#
# REV. LIST:
#

# Initialize all variables

TOTAL=0    # Initialize the TOTAL counter to zero

#  Start a while loop

while $TOKEN
do

    TOTAL=$TOTAL+1  # A little math in the
                            # shell script, a running
                            # total of tokens processed.

    TOKEN=$1     # We always point to the $1 argument with a shift

                           #process each $TOKEN


    shift    # Grab the next token, i.e. $2 becomes $1

done

echo “Total number of tokens processed: $TOTAL”
