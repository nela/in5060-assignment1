#!/bin/bash

file=$1

if [ -z $2 ]; then
  moving_avg=10
else
  moving_avg=$2
fi

grep 'Payload' $file | awk -F'[ .]' '
  BEGIN { OFS="\t" }
  {
    if ($1 ~ /r/) {
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
    }
  }
  END {
    print "#Sec","Sid2","Sid3","Sid4","Sid5","Sid6","Sid7","Sid8","Sid9","Sid10","Sid11"
    for (i in snode2) {
      print i,snode2[i],snode3[i],snode4[i],snode5[i],snode6[i],snode7[i],snode8[i],snode9[i],snode10[i],snode11[i]
    }
  }' | sort -n | awk -vn=$moving_avg '
    BEGIN { FS=OFS="\t"; m = int((n + 1)/2) } {
     s2[NR]=$2;   s2sum+=$2;
     s3[NR]=$3;   s3sum+=$3;
     s4[NR]=$4;   s4sum+=$4;
     s5[NR]=$5;   s5sum+=$5;
     s6[NR]=$6;   s6sum+=$6;
     s7[NR]=$7;   s7sum+=$7;
     s8[NR]=$8;   s8sum+=$8;
     s9[NR]=$9;   s9sum+=$9;
    s10[NR]=$10; s10sum+=$10;
    s11[NR]=$11; s11sum+=$11;
  } NR < m {
    print $0
  } NR >= m {
    d[++i] = $0
  } NR > n {
     s2sum-= s2[NR-n]
     s3sum-= s3[NR-n]
     s4sum-= s4[NR-n]
     s5sum-= s5[NR-n]
     s6sum-= s6[NR-n]
     s7sum-= s7[NR-n]
     s8sum-= s8[NR-n]
     s9sum-= s9[NR-n]
    s10sum-=s10[NR-n]
    s11sum-=s11[NR-n]
  } NR >=n {
     s2sumc[++ s2i]= s2sum/n
     s3sumc[++ s3i]= s3sum/n
     s4sumc[++ s4i]= s4sum/n
     s5sumc[++ s5i]= s5sum/n
     s6sumc[++ s6i]= s6sum/n
     s7sumc[++ s7i]= s7sum/n
     s8sumc[++ s8i]= s8sum/n
     s9sumc[++ s9i]= s9sum/n
    s10sumc[++s10i]=s10sum/n
    s11sumc[++s11i]=s11sum/n
  } END {
    print "#Sec","Sid2","Sid3","Sid4","Sid5","Sid6","Sid7","Sid8","Sid9","Sid10","Sid11",
      "MASid2","MASid3","MASid4","MASid5","MASid6","MASid7","MASid8","MASid9","MASid10","MASid11"

    for (j=1; j <=s2i+(n-m);j++) {
      print  d[j], s2sumc[j],
             s3sumc[j],
             s4sumc[j],
             s5sumc[j],
             s6sumc[j],
             s7sumc[j],
             s8sumc[j],
             s9sumc[j],
            s10sumc[j],
            s11sumc[j]
          }
      }'
