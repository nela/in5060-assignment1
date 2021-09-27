#!/bin/bash

file=$1

grep 'Payload' $file | awk -F'[ .]' '
  BEGIN { OFS="\t\t" }
  {
    if ($1 ~ /t/) {
      if ($4 ~ /\/NodeList\/2/) snode2[$2]+=1024
      else if ($4 ~ /\/NodeList\/3/) snode3[$2]+=1024
      else if ($4 ~ /\/NodeList\/4/) snode4[$2]+=1024
      else if ($4 ~ /\/NodeList\/5/) snode5[$2]+=1024
      else if ($4 ~ /\/NodeList\/6/) snode6[$2]+=1024
      else if ($4 ~ /\/NodeList\/7/) snode7[$2]+=1024
      else if ($4 ~ /\/NodeList\/8/) snode8[$2]+=1024
      else if ($4 ~ /\/NodeList\/9/) snode9[$2]+=1024
      else if ($4 ~ /\/NodeList\/10/) snode10[$2]+=1024
      else if ($4 ~ /\/NodeList\/11/) snode11[$2]+=1024
    } else if ($1 ~ /r/) {
      if ($4 ~ /\/NodeList\/12/) rnode12[$2]+=1024
      else if ($4 ~ /\/NodeList\/13/) rnode13[$2]+=1024
      else if ($4 ~ /\/NodeList\/14/) rnode14[$2]+=1024
      else if ($4 ~ /\/NodeList\/15/) rnode15[$2]+=1024
      else if ($4 ~ /\/NodeList\/16/) rnode16[$2]+=1024
      else if ($4 ~ /\/NodeList\/17/) rnode17[$2]+=1024
      else if ($4 ~ /\/NodeList\/18/) rnode18[$2]+=1024
      else if ($4 ~ /\/NodeList\/19/) rnode19[$2]+=1024
      else if ($4 ~ /\/NodeList\/20/) rnode20[$2]+=1024
      else if ($4 ~ /\/NodeList\/21/) rnode21[$2]+=1024
    }
  }
  END {
    print "#Sec","Sid2","Sid3","Sid4","Sid5","Sid6","Sid7","Sid8","Sid9","Sid10","Sid11",
      "Rid12","Rid13","Rid14","Rid15","Rid16","Rid17","Rid18","Rid19","Rid20","Rid21"
    for (i in snode2) {
      print i,snode2[i],snode3[i],snode4[i],snode5[i],snode6[i],snode7[i],snode8[i],snode9[i],snode10[i],snode11[i],
        rnode12[i],rnode13[i],rnode14[i],rnode15[i],rnode16[i],rnode17[i],rnode18[i],rnode19[i],rnode20[i],rnode21[i]
    }
  }' | sort -n
