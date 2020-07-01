# asncheck3.awk

/AS12076/{aa++}
/AS13399/{ab++}
/AS13811/{ac++}
/AS14719/{ad++}
/AS17345/{ae++}
/AS20046/{af++}
/AS200517/{ag++}
/AS22692/{ah++}
/AS23468/{ai++}
/AS25796/{aj++}
/AS26222/{ak++}
/AS30135/{al++}
/AS30575/{am++}
/AS31792/{an++}
/AS32476/{ao++}
/AS35106/{ap++}
/AS3598/{aq++}
/AS36006/{ar++}
/AS395496/{as++}
/AS395524/{at++}
/AS395851/{au++}
/AS396463/{av++}
/AS397466/{aw++}
/AS40066/{ax++}
/AS45139/{ay++}
/AS5761/{az++}
/AS58862/{ba++}
/AS59067/{bb++}
/AS6182/{bc++}
/AS6194/{bd++}
/AS6291/{be++}
/AS63314/{bf++}
/AS6584/{bg++}
/AS8068/{bh++}
/AS8069/{bi++}
/AS8070/{bj++}
/AS8071/{bk++}
/AS8072/{bl++}
/AS8073/{bm++}
/AS8074/{bn++}
/AS8075/{bo++}
/AS8812/{bp++}

END {
   printf "Microsoft Azure1: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao
   printf "Microsoft Azure2: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", ap,aq,ar,as,at,au,av,aw,ax,ay,az,ba,bb,bc,bd
   printf "Microsoft Azure3: %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s!\n", be,bf,bg,bh,bi,bj,bk,bl,bm,bn,bo,bp
}
