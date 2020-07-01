#rwfiltercdncache.sh
DATA= <PATH TO DATA-SET>
SILKCONF= <PATH TO SILK.CONF>
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
#Adapt ASN to the pmap-file used
echo Tests for Google Global Cache in NORDUnet, and other traffic from Google
rwfilter --data=$DATA --start=$START --end=$END --any-cidr=109.105.109.192/26,109.105.98.192/27 --type=ext2ext --pass=passextggc.rw --fail=stdout | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=GOOGLEY:$pmapfile --pmap-src-GOOGLEY=AS15169,AS19527,AS24424,AS36040,AS36384,AS36385,AS36492,AS41264,AS43515 --pass=passextsrcgoogleny.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=GOOGLEY:$pmapfile --pmap-dst-GOOGLEY=AS15169,AS19527,AS24424,AS36040,AS36384,AS36385,AS36492,AS41264,AS43515 --pass=passextdstgoogleny.rw --input-pipe=stdin
rwuniq passextsrcgoogleny.rw --pmap-file=GOOGLEY:$pmapfile --fields=src-GOOGLEY --values=records,bytes,packets --no-col --output=passextsrcgoogleny.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcgoogleny.txt
rwuniq passextdstgoogleny.rw --pmap-file=GOOGLEY:$pmapfile --fields=dst-GOOGLEY --values=records,bytes,packets --no-col --output=passextdstgoogleny.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstgoogleny.txt
rwcount passextggc.rw --bin-size=$BIN --no-col --column-separator=";" > countextggc.txt
echo Google Youtube ext done!
rwfilter --data=$DATA --start=$START --end=$END --scidr=109.105.109.192/26,109.105.98.192/27 --type=in,inweb --pass=passinggc.rw --fail=stdout | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=GOOGLEY:$pmapfile --pmap-src-GOOGLEY=AS15169,AS19527,AS24424,AS36040,AS36384,AS36385,AS36492,AS41264,AS43515 --pass=passingoogleny.rw --input-pipe=stdin 
rwuniq passingoogleny.rw --pmap-file=GOOGLEY:$pmapfile --fields=src-GOOGLEY --values=records,bytes,packets --no-col --output=passingoogleny.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countingoogleny.txt
rwcount passinggc.rw --bin-size=$BIN --no-col --column-separator=";" > countinggc.txt
echo Google Youtube in done!
rwfilter --data=$DATA --start=$START --end=$END --dcidr=109.105.109.192/26,109.105.98.192/27 --type=out,outweb --pass=passoutggc.rw --fail=stdout | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=GOOGLEY:$pmapfile --pmap-dst-GOOGLEY=AS15169,AS19527,AS24424,AS36040,AS36384,AS36385,AS36492,AS41264,AS43515 --pass=passoutgoogleny.rw --input-pipe=stdin
rwuniq passoutgoogleny.rw --pmap-file=GOOGLEY:$pmapfile --fields=dst-GOOGLEY --values=records,bytes,packets --no-col --output=passoutgoogleny.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutgoogleny.txt
rwcount passoutggc.rw --bin-size=$BIN --no-col --column-separator=";" > countoutggc.txt
echo Google Youtube out done!
echo Tests for Netflix cache in NORDUnet, and other traffic from Netflix
rwfilter --data=$DATA --start=$START --end=$END --any-cidr=109.105.98.160/31,109.105.98.158/31 --type=ext2ext --pass=passextnetflixcache.rw --fail=stdout | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=NETFLIX:$pmapfile --pmap-src-NETFLIX=AS2906,AS40027 --pass=passextsrcnetflixny.rw --fail=stdout -–input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=NETFLIX:$pmapfile --pmap-dst-NETFLIX=AS2906,AS40027 --pass=passextdstnetflixny.rw -–input-pipe=stdin
rwuniq passextsrcnetflixny.rw --pmap-file=NETFLIX:$pmapfile --fields=src-NETFLIX --values=records,bytes,packets --no-col --output=passextsrcnetflixny.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcnetflixny.txt
rwuniq passextdstnetflixny.rw --pmap-file=NETFLIX:$pmapfile --fields=dst-NETFLIX --values=records,bytes,packets --no-col --output=passextdstnetflixny.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstnetflixny.txt
rwcount passextnetflixcache.rw --bin-size=$BIN --no-col --column-separator=";" > countextnetflixcache.txt
echo Netflix ext done!
rwfilter --data=$DATA --start=$START --end=$END --scidr=109.105.98.160/31,109.105.98.158/31 --type=in,inweb --pass=passinnetflixcache.rw --fail=stdout | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=NETFLIX:$pmapfile --pmap-src-NETFLIX=AS2906,AS40027 --pass=passinnetflixny.rw -–input-pipe=stdin
rwuniq passinnetflixny.rw --pmap-file=NETFLIX:$pmapfile --fields=src-NETFLIX --values=records,bytes,packets --no-col --output=passinnetflixny.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinnetflixny.txt
rwcount passinnetflixcache.rw --bin-size=$BIN --no-col --column-separator=";" > countinnetflixcache.txt
echo Netflix in done!
rwfilter --data=$DATA --start=$START --end=$END --dcidr=109.105.98.160/31,109.105.98.158/31 --type=out,outweb --pass=passoutnetflixcache.rw --fail=stdout | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=NETFLIX:$pmapfile --pmap-dst-NETFLIX=AS2906,AS40027 --pass=passoutnetflixny.rw --input-pipe=stdin 
rwuniq passoutnetflixny.rw --pmap-file=NETFLIX:$pmapfile --fields=dst-NETFLIX --values=records,bytes,packets --no-col --output=passoutnetflixny.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutnetflixny.txt
rwcount passoutnetflixcache.rw --bin-size=$BIN --no-col --column-separator=";" > countoutnetflixcache.txt
echo Netflix out done!
echo Tests for Akamai cache in NORDUnet, and other traffic from Akamai
rwfilter --data=$DATA --start=$START --end=$END --scidr=109.105.109.0/26 --type=in,inweb --pass=passinakamaicache.rw --fail=stdout | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=AKAMAI:$pmapfile --pmap-src-AKAMAI=AS12222,AS16625,AS18680,AS18717,AS20189,AS20940,AS24319,AS31108,AS31109,AS31110,AS31377,AS32787,AS33905,AS34164,AS35204,AS35993,AS35994,AS43639,AS49846,AS21342,AS22452,AS23454,AS26008 --pass=passinakamainy.rw --input-pipe=stdin
rwuniq passinakamainy.rw --pmap-file=AKAMAI:$pmapfile --fields=src-AKAMAI --values=records,bytes,packets --no-col --output=passinakamainy.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinakamainy.txt
rwcount passinakamaicache.rw --bin-size=$BIN --no-col --column-separator=";" > countinakamaicache.txt
echo Akamai in done!
rwfilter --data=$DATA --start=$START --end=$END --dcidr=109.105.109.0/26 --type=out,outweb --pass=passoutakamaicache.rw --fail=stdout | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=AKAMAI:$pmapfile --pmap-dst-AKAMAI=AS12222,AS16625,AS18680,AS18717,AS20189,AS20940,AS24319,AS31108,AS31109,AS31110,AS31377,AS32787,AS33905,AS34164,AS35204,AS35993,AS35994,AS43639,AS49846,AS21342,AS22452,AS23454,AS26008 --pass=passoutakamainy.rw --input-pipe=stdin 
rwuniq passoutakamainy.rw --pmap-file=AKAMAI:$pmapfile --fields=dst-AKAMAI --values=records,bytes,packets --no-col --output=passoutakamainy.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutakamainy.txt
rwcount passoutakamaicache.rw --bin-size=$BIN --no-col --column-separator=";" > countoutakamaicache.txt
echo Akamai out done!
rwfilter --data=$DATA --start=$START --end=$END --any-cidr=109.105.109.0/26 --type=ext2ext --pass=passextakamaicache.rw --fail=stdout | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=AKAMAI:$pmapfile --pmap-src-AKAMAI=AS12222,AS16625,AS18680,AS18717,AS20189,AS20940,AS24319,AS31108,AS31109,AS31110,AS31377,AS32787,AS33905,AS34164,AS35204,AS35993,AS35994,AS43639,AS49846,AS21342,AS22452,AS23454,AS26008 --pass=passextsrcakamainy.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=AKAMAI:$pmapfile --pmap-dst-AKAMAI=AS12222,AS16625,AS18680,AS18717,AS20189,AS20940,AS24319,AS31108,AS31109,AS31110,AS31377,AS32787,AS33905,AS34164,AS35204,AS35993,AS35994,AS43639,AS49846,AS21342,AS22452,AS23454,AS26008 --pass=passextdstakamainy.rw --input-pipe=stdin 
rwuniq passextsrcakamainy.rw --pmap-file=AKAMAI:$pmapfile --fields=src-AKAMAI --values=records,bytes,packets --no-col --output=passextsrcakamainy.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcakamainy.txt
rwuniq passextdstakamainy.rw --pmap-file=AKAMAI:$pmapfile --fields=dst-AKAMAI --values=records,bytes,packets --no-col --output=passextdstakamainy.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstakamainy.txt
rwcount passextakamaicache.rw --bin-size=$BIN --no-col --column-separator=";" > countextakamaicache.txt
echo Akamai ext done!
echo ALL DONE! 
