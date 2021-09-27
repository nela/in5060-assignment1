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
    r12[NR]=$12; r12sum+=$12;
    r13[NR]=$13; r13sum+=$13;
    r14[NR]=$14; r14sum+=$14;
    r15[NR]=$15; r15sum+=$15;
    r16[NR]=$16; r16sum+=$16;
    r17[NR]=$17; r17sum+=$17;
    r18[NR]=$18; r18sum+=$18;
    r19[NR]=$19; r19sum+=$19;
    r10[NR]=$10; r10sum+=$10;
    r21[NR]=$12; r21sum+=$12;
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
    r12sum-=r12[NR-n]
    r13sum-=r13[NR-n]
    r14sum-=r14[NR-n]
    r15sum-=r15[NR-n]
    r16sum-=r16[NR-n]
    r17sum-=r17[NR-n]
    r18sum-=r18[NR-n]
    r19sum-=r19[NR-n]
    r10sum-=r10[NR-n]
    r21sum-=r21[NR-n]
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
    r12sumc[++r12i]=r12sum/n
    r13sumc[++r13i]=r13sum/n
    r14sumc[++r14i]=r14sum/n
    r15sumc[++r15i]=r15sum/n
    r16sumc[++r16i]=r16sum/n
    r17sumc[++r17i]=r17sum/n
    r18sumc[++r18i]=r18sum/n
    r19sumc[++r19i]=r19sum/n
    r10sumc[++r10i]=r10sum/n
    r21sumc[++r21i]=r21sum/n
  } END {
    print "#Sec","Sid2","Sid3","Sid4","Sid5","Sid6","Sid7","Sid8","Sid9","Sid10","Sid11",
      "Rid12","Rid13","Rid14","Rid15","Rid16","Rid17","Rid18","Rid19","Rid20","Rid21",
      "MASid2","MASid3","MASid4","MASid5","MASid6","MASid7","MASid8","MASid9","MASid10","MASid11",
      "MARid12","MARid13","MARid14","MARid15","MARid16","MARid17","MARid18","MARid19","MARid20","MARid21"

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
            s11sumc[j],
            r12sumc[j],
            r13sumc[j],
            r14sumc[j],
            r15sumc[j],
            r16sumc[j],
            r17sumc[j],
            r18sumc[j],
            r19sumc[j],
            r10sumc[j],
            r21sumc[j]
          }
      }'
