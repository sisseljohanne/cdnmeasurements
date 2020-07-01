# asncheck6.awk

/AS11855/{aa++}
/AS12179/{ab++}
/AS12180/{ac++}
/AS12182/{ad++}
/AS13789/{ae++}
/AS13792/{af++}
/AS14742/{ag++}
/AS14744/{ah++}
/AS14745/{ai++}
/AS15570/{aj++}
/AS17675/{ak++}
/AS19024/{al++}
/AS24245/{am++}
/AS24246/{an++}
/AS24247/{ao++}
/AS30282/{ap++}
/AS48910/{aq++}
/AS36408/{ar++}
/AS38107/{as++}
/AS38670/{at++}
/AS40366/{au++}
/AS43303/{av++}
/AS63541/{aw++}
/AS52580/{ax++}
/AS22518/{ay++}
/AS40428/{az++}
/AS200325/{ba++}
/AS393676/{bb++}

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
   printf "Internap: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao
   printf "Internap2: %s, %s!\n", ap,aq
   printf "CDNetworks: %s, %s, %s, %s, %s!\n", ar,as,at,au,av 
   printf "ChinaCache: %s!\n", aw
   printf "Azion: %s!\n", ax
   printf "Pandora: %s, %s!\n", ay,az
   printf "BunnyCDN: %s!\n", ba
   printf "Zenedge: %s!\n", bb
}
