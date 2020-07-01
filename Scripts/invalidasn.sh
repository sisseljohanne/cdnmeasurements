#invalidasn.sh
DATA= <PATH TO DATA-SET>
SILKCONF= <PATH TO SILK.CONF>
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
#Adapt ASN to the pmap-file used
echo Tests invalid ASNs, type=in,inweb, and which is not registered to IP prefixes of other valid ASNs. Numbers are AS560, AS13399, AS17204 
rwfilter --type=in,inweb --start=$START --end=$END --pmap-file=ASEN:$pmapfile --pmap-src-ASEN=AS560 --pass=passinasen.rw --fail=stdout --data=$DATA | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=ASTO:$pmapfile --pmap-src-ASTO=AS13399 --pass=passinasto.rw --fail=stdout -–input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=ASTRE:$pmapfile --pmap-src-ASTRE=AS17204 --pass=passinastre.rw --input-pipe=stdin
rwuniq passinasen.rw --pmap-file=ASEN:$pmapfile --fields=src-ASEN --values=records,bytes,packets --no-col --output=passinasen.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinasen.txt
echo AS560 done!
rwuniq passinasto.rw --pmap-file=ASTO:$pmapfile --fields=src-ASTO --values=records,bytes,packets --no-col --output=passinasto.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinasto.txt
echo AS13399 done!
rwuniq passinastre.rw --pmap-file=ASTRE:$pmapfile --fields=src-ASTRE --values=records,bytes,packets --no-col --output=passinastre.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinastre.txt
echo AS17204 done!
echo IN done!
echo Tests invalid ASNs, type=out,outweb, and which is not registered to IP prefixes of other valid ASNs. Numbers are AS560, AS13399, AS17204 
rwfilter --type=out,outweb --start=$START --end=$END --pmap-file=ASEN:$pmapfile --pmap-dst-ASEN=AS560 --pass=passoutasen.rw --fail=stdout --data=$DATA | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=ASTO:$pmapfile --pmap-dst-ASTO=AS13399 --pass=passoutnasto.rw --fail=stdout -–input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=ASTRE:$pmapfile --pmap-dst-ASTRE=AS17204 --pass=passoutastre.rw --input-pipe=stdin
rwuniq passoutasen.rw --pmap-file=ASEN:$pmapfile --fields=dst-ASEN --values=records,bytes,packets --no-col --output=passoutasen.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutasen.txt
echo AS560 done!
rwuniq passoutasto.rw --pmap-file=ASTO:$pmapfile --fields=dst-ASTO --values=records,bytes,packets --no-col --output=passoutasto.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutasto.txt
echo AS13399 done!
rwuniq passoutastre.rw --pmap-file=ASTRE:$pmapfile --fields=dst-ASTRE --values=records,bytes,packets --no-col --output=passoutastre.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutastre.txt
echo AS17204 done!
