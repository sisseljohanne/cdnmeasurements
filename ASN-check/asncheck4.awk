# asncheck4.awk

/AS394192/{aa++}
/AS54113/{ab++}
/AS11588/{ac++}
/AS12989/{ad++}
/AS18607/{ae++}
/AS20446/{af++}
/AS29798/{ag++}
/AS33438/{ah++}
/AS54104/{ai++}
/AS199156/{aj++}
/AS64259/{ak++}
/AS31936/{al++}
/AS29789/{am++}
/AS12411/{an++}
/AS22822/{ao++}
/AS23059/{ap++}
/AS23135/{aq++}
/AS23164/{ar++}
/AS25804/{as++}
/AS26506/{at++}
/AS27191/{au++}
/AS37277/{av++}
/AS38621/{aw++}
/AS38622/{ax++}
/AS45396/{ay++}
/AS55429/{az++}
/AS60261/{ba++}
/AS132892/{bb++}
/AS13335/{bc++}
/AS133877/{bd++}
/AS14789/{be++}
/AS202623/{bf++}
/AS203898/{bg++}
/AS394536/{bh++}
/AS395747/{bi++}
/AS139242/{bj++}
/AS209242/{bk++}
/AS16509/{bl++}
/AS14618/{bm++}
/AS55960/{bn++}
/AS135629/{bo++}
/AS8987/{bp++}
/AS19047/{bq++}
/AS9059/{br++}
/AS7224/{bs++}
/AS3356/{bt++}
/AS3549/{bu++}
/AS12576/{bv++}
/AS560/{bw++}

END {
   printf "Fastly: %s, %s!\n", aa,ab
   printf "Stackpath MaxCDN NetDNA Highwinds: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", ac,ad,ae,af,ag,ah,ai,aj,ak,al
   printf "Reflected Networks - Swift: %s!\n", am
   printf "Limelight: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,ba
   printf "Cloudflare: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", bb,bc,bd,be,bf,bg,bh,bi,bj,bk
   printf "Amazon + AWS: %s, %s, %s, %s, %s, %s, %s, %s!\n", bl,bm,bn,bo,bp,bq,br,bs
   printf "Level3: %s, %s, %s, %s!\n", bt,bu,bv,bw
}
