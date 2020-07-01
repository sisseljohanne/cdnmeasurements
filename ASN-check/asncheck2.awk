# asncheck2.awk

/AS15169/{aa++}
/AS16550/{ab++}
/AS19527/{ac++}
/AS22577/{ad++}
/AS22859/{ae++}
/AS24424/{af++}
/AS26684/{ag++}
/AS36039/{ah++}
/AS36040/{ai++}
/AS36384/{aj++}
/AS36385/{ak++}
/AS36492/{al++}
/AS36561/{am++}
/AS36987/{an++}
/AS394507/{ao++}
/AS394639/{ap++}
/AS394699/{aq++}
/AS395973/{ar++}
/AS40873/{as++}
/AS41264/{at++}
/AS43515/{au++}
/AS6185/{av++}
/AS714/{aw++}
/AS19679/{ax++}
/AS200499/{ay++}
/AS203719/{az++}
/AS393874/{ba++}
/AS54372/{bb++}
/AS62190/{bc++}
/AS397153/{bd++}
/AS46489/{be++}
/AS32934/{bf++}
/AS54115/{bg++}
/AS63293/{bh++}
/AS2906/{bi++}
/AS40027/{bj++}
/AS15133/{bk++}

END {
   printf "GoogleYoutube1: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao
   printf "GoogleYoutube2: %s, %s, %s, %s, %s, %s!\n", ap,aq,ar,as,at,au
   printf "Apple: %s, %s!\n", av,aw
   printf "Dropbox: %s, %s, %s, %s, %s, %s!\n", ax,ay,az,ba,bb,bc
   printf "Twitch.TV: %s, %s!\n", bd,be
   printf "Facebook: %s, %s, %s!\n", bf,bg,bh
   printf "Netflix: %s, %s!\n", bi,bj
   printf "Edgecast Verizon: %s!\n", bk
}
