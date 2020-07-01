#rwfilterextdst2020031X.sh
DATA= <PATH TO DATA-SET>
SILKCONF= <PATH TO SILK.CONF>
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
#Adapt ASN to the pmap-file used
#.csv-fil: legg inn --no-col --column-separator=";"
echo Starts filtering CDN-traffic: ex2ext. Separate results for Facebook, Netflix, Akamai, Google Youtube, Apple etc.
rwfilter --type=ext2ext --start=$START --end=$END --pmap-file=FACEBOOK:$pmapfile --pmap-dst-FACEBOOK=AS32934,AS54115,AS63293 --pass=passextdstfb.rw --fail=stdout --data=$DATA | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=NETFLIX:$pmapfile --pmap-dst-NETFLIX=AS2906,AS40027 --pass=passextdstnetflix.rw --fail=stdout –input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=AKAMAI:$pmapfile --pmap-dst-AKAMAI=AS12222,AS16625,AS18680,AS18717,AS20189,AS20940,AS24319,AS31108,AS31109,AS31110,AS31377,AS32787,AS33905,AS34164,AS35204,AS35993,AS35994,AS43639,AS49846,AS21342,AS22452,AS23454,AS26008,AS17204 --pass=passextdstakamai.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=GOOGLEY:$pmapfile --pmap-dst-GOOGLEY=AS15169,AS19527,AS24424,AS36040,AS36384,AS36385,AS36492,AS41264,AS43515 --pass=passextdstgoogley.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=APPLE:$pmapfile --pmap-dst-APPLE=AS6185,AS714 --pass=passextdstapple.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=EDGECASTV:$pmapfile --pmap-dst-EDGECASTV=AS15133 --pass=passextdstedgecastv.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=MSFT:$pmapfile --pmap-dst-MSFT=AS12076,AS23468,AS35106,AS3598,AS45139,AS5761,AS58862,AS59067,AS6182,AS6194,AS6291,AS63314,AS6584,AS8068,AS8069,AS8070,AS8071,AS8075,AS8812,AS13399 --pass=passextdstmsft.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=FASTLY:$pmapfile --pmap-dst-FASTLY=AS54113 --pass=passextdstfastly.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=STACKPATH:$pmapfile --pmap-dst-STACKPATH=AS11588,AS12989,AS18607,AS20446,AS33438,AS64259 --pass=passextdststackpath.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=REFLECTED:$pmapfile --pmap-dst-REFLECTED=AS29789 --pass=passextdstreflected.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=LIMELIGHT:$pmapfile --pmap-dst-LIMELIGHT=AS22822,AS23059,AS25804,AS38621,AS38622,AS45396,AS55429,AS60261 --pass=passextdstlimelight.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=CLOUDFLARE:$pmapfile --pmap-dst-CLOUDFLARE=AS13335 --pass=passextdstcloudflare.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=AMAZON:$pmapfile --pmap-dst-AMAZON=AS16509,AS14618,AS55960,AS8987,AS19047,AS7224 --pass=passextdstamazon.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=LEVEL:$pmapfile --pmap-dst-LEVEL=AS3356,AS3549,AS12576,AS560 --pass=passextdstlevel.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=DROPBOX:$pmapfile --pmap-dst-DROPBOX=AS19679,AS54372,AS62190 --pass=passextdstdropbox.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=TWITCH:$pmapfile --pmap-dst-TWITCH=AS46849 --pass=passextdsttwitch.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=ROKLA:$pmapfile --pmap-dst-ROKLA=AS54994,AS60068,AS24429,AS23393,AS30081,AS34789,AS10310,AS14776,AS14777,AS14778,AS14779,AS14780,AS14781,AS23879,AS24506,AS26085,AS26101,AS34010,AS36088,AS36229,AS36646,AS36647,AS56173,AS5779,AS7233,AS40009,AS59019,AS21245,AS57363,AS60626,AS21030,AS19551,AS62571,AS33047,AS11855,AS12179,AS12180,AS12182,AS13789,AS13792,AS14742,AS14744,AS14745,AS15570,AS17675,AS19024,AS24245,AS24246,AS24247,AS30282,AS48910,AS36408,AS38107,AS63541,AS52580,AS22518,AS40428 --pass=passextdstrokla.rw --fail=failextdstrokla.rw --input-pipe=stdin
rwfilter failextdstrokla.rw --type=ext2ext --site-config-file=$SILKCONF --pmap-file=TELENOR:$pmapfile --pmap-dst-TELENOR=AS2119 --pass=passextdsttelenor.rw
echo rwfilter done!
rwuniq passextdstfb.rw --pmap-file=FACEBOOK:$pmapfile --fields=dst-FACEBOOK --values=records,bytes,packets --no-col --output=passextdstfb.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstfb.txt
echo Facebook done!
rwuniq passextdstnetflix.rw --pmap-file=NETFLIX:$pmapfile --fields=dst-NETFLIX --values=records,bytes,packets --no-col --output=passextdstnetflix.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstnetflix.txt
echo Netflix done!
rwuniq passextdstakamai.rw --pmap-file=AKAMAI:$pmapfile --fields=dst-AKAMAI --values=records,bytes,packets --no-col --output=passextdstakamai.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstakamai.txt
echo Akamai done!
#AS17204 removed
rwuniq passextdstgoogley.rw --pmap-file=GOOGLEY:$pmapfile --fields=dst-GOOGLEY --values=records,bytes,packets --no-col --output=passextdstgoogley.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstgoogley.txt
echo Google Youtube done!
rwuniq passextdstapple.rw --pmap-file=APPLE:$pmapfile --fields=dst-APPLE --values=records,bytes,packets --no-col --output=passextdstapple.txt --copy-input=stdout | rwcount  --bin-size=$BIN --no-col --column-separator=";" > countextdstapple.txt
echo Apple done!
rwuniq passextdstedgecastv.rw --pmap-file=EDGECASTV:$pmapfile --fields=dst-EDGECASTV --values=records,bytes,packets --no-col --output=passextdstedgecastv.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstedgecastv.txt
echo Edgecast Verizon done!
#AS13399 removed
rwuniq passextdstmsft.rw --pmap-file=MSFT:$pmapfile --fields=dst-MSFT --values=records,bytes,packets --no-col --output=passextdstmsft.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstmsft.txt
echo Microsoft Azure done!
rwuniq passextdstfastly.rw --pmap-file=FASTLY:$pmapfile --fields=dst-FASTLY --values=records,bytes,packets --no-col --output=passextdstfastly.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstfastly.txt
echo Fastly done!
rwuniq passextdststackpath.rw --pmap-file=STACKPATH:$pmapfile --fields=dst-STACKPATH --values=records,bytes,packets --no-col --output=passextdststackpath.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdststackpath.txt
echo Stackpath done!
rwuniq passextdstreflected.rw --pmap-file=REFLECTED:$pmapfile --fields=dst-REFLECTED --values=records,bytes,packets --no-col --output=passextdstreflected.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstreflected.txt
echo Reflected Networks done!
#AS37277 removed
rwuniq passextdstlimelight.rw --pmap-file=LIMELIGHT:$pmapfile --fields=dst-LIMELIGHT --values=records,bytes,packets --no-col --output=passextdstlimelight.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstlimelight.txt
echo Limelight done!
rwuniq passextdstcloudflare.rw --pmap-file=CLOUDFLARE:$pmapfile --fields=dst-CLOUDFLARE --values=records,bytes,packets --no-col --output=passextdstcloudflare.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstcloudflare.txt
echo Cloudflare done!
#AS9059 removed
rwuniq passextdstamazon.rw --pmap-file=AMAZON:$pmapfile --fields=dst-AMAZON --values=records,bytes,packets --no-col --output=passextdstamazon.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstamazon.txt
echo Amazon + AWS done!
#AS560 removed
rwuniq passextdstlevel.rw --pmap-file=LEVEL:$pmapfile --fields=dst-LEVEL --values=records,bytes,packets --no-col --output=passextdstlevel.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstlevel.txt
echo Level3 done!
rwuniq passextdstdropbox.rw --pmap-file=DROPBOX:$pmapfile --fields=dst-DROPBOX --values=records,bytes,packets --no-col --output=passextdstdropbox.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstdropbox.txt
echo Dropbox done!
rwuniq passextdsttwitch.rw --pmap-file=TWITCH:$pmapfile --fields=dst-TWITCH --values=records,bytes,packets --no-col --output=passextdsttwitch.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdsttwitch.txt
echo Twitch done!
rwuniq passextdstrokla.rw --pmap-file=ROKLA:$pmapfile --fields=dst-ROKLA --values=records,bytes,packets --no-col --output=passextdstrokla.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextdstrokla.txt
echo Rokla done!
rwcount failextdstrokla.rw --bin-size=$BIN --no-col --column-separator=";" > countextdstfail.txt
echo Fail done!
rwuniq passextdsttelenor.rw -pmap-file=TELENOR:$pmapfile --fields=dst-TELENOR --values=records,bytes,packets --no-col --output=passextdsttelenor.txt --copy-input=stdout | rwcount--bin-size=$BIN --no-col --column-separator=";" > countextdsttelenor.txt 
echo Telenor done!
echo EXT DONE!

