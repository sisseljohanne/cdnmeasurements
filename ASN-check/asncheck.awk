# asnchechk.awk

/AS12222/{aa++}
/AS16625/{ab++}
/AS16702/{ac++}
/AS17334/{ad++}
/AS18680/{ae++}
/AS18717/{af++}
/AS20189/{ag++}
/AS20940/{ah++}
/AS22207/{ai++}
/AS23455/{aj++}
/AS23903/{ak++}
/AS24319/{al++}
/AS30675/{am++}
/AS31107/{an++}
/AS31108/{ao++}
/AS31109/{ap++}
/AS31110/{aq++}
/AS31377/{ar++}
/AS32787/{as++}
/AS33905/{at++}
/AS34164/{au++}
/AS34850/{av++}
/AS35204/{aw++}
/AS35993/{ax++}
/AS35994/{ay++}
/AS36183/{az++}
/AS393234/{ba++}
/AS393560/{bb++}
/AS39836/{bc++}
/AS43639/{bd++}
/AS45700/{be++}
/AS48163/{bf++}
/AS49846/{bg++}
/AS55770/{bh++}
/AS17204/{bi++}
/AS21342/{bj++}
/AS21357/{bk++}
/AS21399/{bl++}
/AS22452/{bm++}
/AS23454/{bn++}
/AS26008/{bo++}
/AS55409/{bp++}

END {
   printf "AKAMAI1: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao
   printf "AKAMAI2: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", ap,aq,ar,as,at,au,av,aw,ax,ay,az,ba,bb,bc,bd
   printf "AKAMAI3: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", be,bf,bg,bh,bi,bj,bk,bl,bm,bn,bo,bp
}
