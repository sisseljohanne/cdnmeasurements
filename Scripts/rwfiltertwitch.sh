#retestTwitch.sh
DATA=/dynga/data/silk-data/oslo-gw/
SILKCONF=/dynga/data/silk-data/oslo-gw/silk.conf
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
echo Retest Twitch, and counting all traffic: 
rwfilter --data=$DATA --start=$START --end=$END --type=in,inweb,out,outweb,int2int,ext2ext --pass=countalltraffic.rw
rwcount countalltraffic.rw --bin-size=$BIN --no-col --column-separator=";" > countalltraffic.txt
echo Count all traffic done!
rwfilter --type=in,inweb ---start=$START --end=$END --pmap-file=TWITCH:$pmapfile --pmap-src-TWITCH=AS46489 --pass=passintwitch.rw --data=$DATA
rwuniq passintwitch.rw --pmap-file=TWITCH:$pmapfile --fields=src-TWITCH --values=records,bytes,packets --no-col --output=passintwitch.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countintwitch.txt
echo Twitch in done!
rwfilter --type=out,outweb --start=$START --end=$END --pmap-file=TWITCH:$pmapfile --pmap-dst-TWITCH=AS46489 --pass=passouttwitch.rw --data=$DATA
rwuniq passouttwitch.rw --pmap-file=TWITCH:$pmapfile --fields=dst-TWITCH --values=records,bytes,packets --no-col --output=passouttwitch.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countouttwitch.txt
echo Twitch out done!
rwfilter --type=ext2ext --start=$START --end=$END --pmap-file=TWITCH:$pmapfile --pmap-dst-TWITCH=AS46489 --pass=passextdsttwitch.rw --data=$DATA
rwuniq passextdsttwitch.rw --pmap-file=TWITCH:$pmapfile --fields=dst-TWITCH --values=records,bytes,packets --no-col --output=passextdsttwitch.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdsttwitch.txt
echo ext dst Twitch done!
rwfilter --type=ext2ext --start=$START --end=$END --pmap-file=TWITCH:$pmapfile --pmap-src-TWITCH=AS46489 --pass=passextsrctwitch.rw --data=$DATA
rwuniq passextsrctwitch.rw --pmap-file=TWITCH:$pmapfile --fields=src-TWITCH --values=records,bytes,packets --no-col --output=passextsrctwitch.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrctwitch.txt
echo ext src Twitch done!
