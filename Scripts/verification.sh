#verifikasjon.sh
DATA=/dynga/data/silk-data/oslo-gw/
SILKCONF=/dynga/data/silk-data/oslo-gw/silk.conf
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
#NB! ASN må tilpasses dato! I denne fila er de tilpasset 20200311
echo Count all traffic, type=int
rwfilter --data=$DATA --start=$START --end=$END --type=int2int --all=countalltrafficint.rw
rwcount countalltrafficint.rw --bin-size=$BIN --no-col --column-separator=";" > countalltrafficint.txt
echo Gjentester noen aktører midt inni: Apple in, Level3 out, Edgecast ext dst
rwfilter --data=$DATA --start=$START --end=$END --type=in,inweb --pmap-file=APPLE:$pmapfile --pmap-src-APPLE=AS6185,AS714 --pass=passinretestapple.rw 
rwuniq passinretestapple.rw --pmap-file=APPLE:$pmapfile --fields=src-APPLE --values=records,bytes,packets --no-col --output=passinretestapple.txt --copy-input=stdout | rwcount  --bin-size=$BIN --no-col --column-separator=";" > countinretestapple.txt
echo Apple in done!
rwfilter --data=$DATA --start=$START --end=$END --type=out,outweb --pmap-file=LEVEL:$pmapfile --pmap-dst-LEVEL=AS3356,AS3549,AS12576 --pass=passoutretestlevel.rw 
rwuniq passoutretestlevel.rw --pmap-file=LEVEL:$pmapfile --fields=dst-LEVEL --values=records,bytes,packets --no-col --output=passoutretestlevel.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutretestlevel.txt
echo Level3 out done!
rwfilter --data=$DATA --start=$START --end=$END --type=ext2ext --pmap-file=EDGECASTV:$pmapfile --pmap-dst-EDGECASTV=AS15133 --pass=passextdstretestedgec.rw 
rwuniq passextdstretestedgec.rw --pmap-file=EDGECASTV:$pmapfile --fields=dst-EDGECASTV --values=records,bytes,packets --no-col --output=passextdstretestedgec.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstretestedgec.txt
echo Edgecast Verizon ext dst done!
echo Tester Microsoft Azure in
rwfilter --data=$DATA --start=$START --end=$END --type=in,inweb --pmap-file=MSFT:$pmapfile --pmap-src-MSFT=AS12076,AS23468,AS35106,AS3598,AS45139,AS5761,AS58862,AS59067,AS6182,AS6194,AS6291,AS63314,AS6584,AS8068,AS8069,AS8070,AS8071,AS8075,AS8812 --pass=passinretestmsft.rw 
rwuniq passinretestmsft.rw --pmap-file=MSFT:$pmapfile --fields=src-MSFT --values=records,bytes,packets --no-col --output=passinretestmsft.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinretestmsft.txt
echo Microsoft Azure in done!
echo Tester Microsoft Azure out
rwfilter --data=$DATA --start=$START --end=$END --type=out,outweb --pmap-file=MSFT:$pmapfile --pmap-dst-MSFT=AS12076,AS23468,AS35106,AS3598,AS45139,AS5761,AS58862,AS59067,AS6182,AS6194,AS6291,AS63314,AS6584,AS8068,AS8069,AS8070,AS8071,AS8075,AS8812 --pass=passoutretestmsft.rw 
rwuniq passoutretestmsft.rw --pmap-file=MSFT:$pmapfile --fields=dst-MSFT --values=records,bytes,packets --no-col --output=passoutretestmsft.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutretestmsft.txt
echo Microsoft Azure out done!
echo ALL DONE! 
