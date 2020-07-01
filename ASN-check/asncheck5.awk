# asncheck5.awk

/AS54994/{aa++}
/AS60068/{ab++}
/AS24429/{ac++}
/AS199524/{ad++}
/AS202422/{ae++}
/AS59245/{af++}
/AS23393/{ag++}
/AS30081/{ah++}
/AS34789/{ai++}
/AS10310/{aj++}
/AS14776/{ak++}
/AS14777/{al++}
/AS14778/{am++}
/AS14779/{an++}
/AS14780/{ao++}
/AS14781/{ap++}
/AS23879/{aq++}
/AS24506/{ar++}
/AS26085/{as++}
/AS26101/{at++}
/AS34010/{au++}
/AS36088/{av++}
/AS36229/{aw++}
/AS36646/{ax++}
/AS36647/{ay++}
/AS56173/{az++}
/AS5779/{ba++}
/AS7233/{bb++}
/AS40009/{bc++}
/AS137280/{bd++}
/AS59019/{be++}
/AS21245/{bf++}
/AS57363/{bg++}
/AS60626/{bh++}
/AS132591/{bi++}
/AS133478/{bj++}
/AS58835/{bk++}
/AS21030/{bl++}
/AS19551/{bm++}
/AS62571/{bn++}
/AS133103/{bo++}
/AS33047/{bp++}

END {
   printf "QUANTIL China NetCenter: %s!\n", aa
   printf "CDN77: %s!\n", ab
   printf "Alibaba Cloud: %s!\n", ac
   printf "G-Core CDN: %s, %s, %s!\n", ad,ae,af
   printf "BelugaCDN: %s!\n", ag
   printf "Cachefly: %s!\n", ah
   printf "Ngenix: %s!\n", ai
   printf "Yahoo: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax
   printf "Yahoo2: %s, %s, %s, %s!\n", ay,az,ba,bb
   printf "Tata Communications: %s!\n", bc
   printf "Kingsoft Cloud: %s, %s!\n", bd,be
   printf "Medianova: %s!\n", bf
   printf "CDNvideo: %s!\n", bg
   printf "LeaseWeb CDN: %s!\n", bh
   printf "Tencent Cloud: %s, %s, %s!\n", bi,bj,bk
   printf "cdnnow: %s!\n", bl
   printf "Imperva Incapsula: %s, %s!\n", bm,bn
   printf "Instartlogic: %s, %s!\n", bo,bp
}
