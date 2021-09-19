#!/bin/bash

file=$1
enq=0
deq=0
rec=0
drp=0

# awk '$1=="+" { $enq+=1; }' $file

# awk ' { if ( $1 == "+") { counter++; print counter;} else if ( $1 == "-") { counter--; print counter; }}' $file

# awk ' { if ( $1 == "+") { counter++; print counter;} else if ( $1 == "-") { counter--; print counter; } else if ( $1 == "d") { drp++: print $1 "\t" drp; } }' $file

awk '
      BEGIN { enq=0; deq=0; drp=0; rcv=0; }
      { if ( $1 == "+") {
          enq++;
          counter++;
          print counter;
        } else if ( $1 == "-") {
          deq++;
          counter--;
          print counter;
        } else if ($1 == "d") {
          drp++;
        } else if ( $1 == "r") {
          rcv++;
      }

      }
      END {
        print "Dropped:" drp "\nEnq:" enq "\nDeq: " deq " \nRcv: " rcv;
      }
    ' $file

# awk ' { ++count[$1] }
#     {
#       for (c in count )
#         print c;
#     }
#     ' $file
