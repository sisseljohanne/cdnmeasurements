#rwfilterextsrc2020031X.sh
DATA= <PATH TO DATA-SET>
SILKCONF= <PATH TO SILK.CONF>
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
#Adapt ASN to the pmap-file used
#.csv-fil: legg inn --no-col --column-separator=";"
echo Starts filtering CDN-traffic: ex2ext. Separate results for Facebook, Netflix, Akamai, Google Youtube, Apple etc.
rwfilter --type=ext2ext --start=$START --end=$END --pmap-file=FACEBOOK:$pmapfile --pmap-src-FACEBOOK=AS32934,AS54115,AS63293 --pass=passextsrcfb.rw --fail=stdout --data=$DATA | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=NETFLIX:$pmapfile --pmap-src-NETFLIX=AS2906,AS40027 --pass=passextsrcnetflix.rw --fail=stdout –input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=AKAMAI:$pmapfile --pmap-src-AKAMAI=AS12222,AS16625,AS18680,AS18717,AS20189,AS20940,AS24319,AS31108,AS31109,AS31110,AS31377,AS32787,AS33905,AS34164,AS35204,AS35993,AS35994,AS43639,AS49846,AS21342,AS22452,AS23454,AS26008,AS17204 --pass=passextsrcakamai.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=GOOGLEY:$pmapfile --pmap-src-GOOGLEY=AS15169,AS19527,AS24424,AS36040,AS36384,AS36385,AS36492,AS41264,AS43515 --pass=passextsrcgoogley.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=APPLE:$pmapfile --pmap-src-APPLE=AS6185,AS714 --pass=passextsrcapple.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=EDGECASTV:$pmapfile --pmap-src-EDGECASTV=AS15133 --pass=passextsrcedgecastv.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=MSFT:$pmapfile --pmap-src-MSFT=AS12076,AS23468,AS35106,AS3598,AS45139,AS5761,AS58862,AS59067,AS6182,AS6194,AS6291,AS63314,AS6584,AS8068,AS8069,AS8070,AS8071,AS8075,AS8812,AS13399 --pass=passextsrcmsft.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=FASTLY:$pmapfile --pmap-src-FASTLY=AS54113 --pass=passextsrcfastly.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=STACKPATH:$pmapfile --pmap-src-STACKPATH=AS11588,AS12989,AS18607,AS20446,AS33438,AS64259 --pass=passextsrcstackpath.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=REFLECTED:$pmapfile --pmap-src-REFLECTED=AS29789 --pass=passextsrcreflected.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=LIMELIGHT:$pmapfile --pmap-src-LIMELIGHT=AS22822,AS23059,AS25804,AS38621,AS38622,AS45396,AS55429,AS60261 --pass=passextsrclimelight.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=CLOUDFLARE:$pmapfile --pmap-src-CLOUDFLARE=AS13335 --pass=passextsrccloudflare.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=AMAZON:$pmapfile --pmap-src-AMAZON=AS16509,AS14618,AS55960,AS8987,AS19047,AS7224 --pass=passextsrcamazon.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=LEVEL:$pmapfile --pmap-src-LEVEL=AS3356,AS3549,AS12576,AS560 --pass=passextsrclevel.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=DROPBOX:$pmapfile --pmap-src-DROPBOX=AS19679,AS54372,AS62190 --pass=passextsrcdropbox.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=TWITCH:$pmapfile --pmap-src-TWITCH=AS46849 --pass=passextsrctwitch.rw --fail=stdout --input-pipe=stdin | rwfilter --type=ext2ext --site-config-file=$SILKCONF --pmap-file=ROKLA:$pmapfile --pmap-src-ROKLA=AS54994,AS60068,AS24429,AS23393,AS30081,AS34789,AS10310,AS14776,AS14777,AS14778,AS14779,AS14780,AS14781,AS23879,AS24506,AS26085,AS26101,AS34010,AS36088,AS36229,AS36646,AS36647,AS56173,AS5779,AS7233,AS40009,AS59019,AS21245,AS57363,AS60626,AS21030,AS19551,AS62571,AS33047,AS11855,AS12179,AS12180,AS12182,AS13789,AS13792,AS14742,AS14744,AS14745,AS15570,AS17675,AS19024,AS24245,AS24246,AS24247,AS30282,AS48910,AS36408,AS38107,AS63541,AS52580,AS22518,AS40428 --pass=passextsrcrokla.rw --fail=failextsrcrokla.rw --input-pipe=stdin
rwfilter failextsrcrokla.rw --type=ext2ext --site-config-file=$SILKCONF --pmap-file=TELENOR:$pmapfile --pmap-src-TELENOR=AS2119 --pass=passextsrctelenor.rw
echo rwfilter done!
rwuniq passextsrcfb.rw --pmap-file=FACEBOOK:$pmapfile --fields=src-FACEBOOK --values=records,bytes,packets --no-col --output=passextsrcfb.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcfb.txt
echo Facebook done!
rwuniq passextsrcnetflix.rw --pmap-file=NETFLIX:$pmapfile --fields=src-NETFLIX --values=records,bytes,packets --no-col --output=passextsrcnetflix.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcnetflix.txt
echo Netflix done!
rwuniq passextsrcakamai.rw --pmap-file=AKAMAI:$pmapfile --fields=src-AKAMAI --values=records,bytes,packets --no-col --output=passextsrcakamai.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcakamai.txt
echo Akamai done!
#AS17204 removed
rwuniq passextsrcgoogley.rw --pmap-file=GOOGLEY:$pmapfile --fields=src-GOOGLEY --values=records,bytes,packets --no-col --output=passextsrcgoogley.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcgoogley.txt
echo Google Youtube done!
rwuniq passextsrcapple.rw --pmap-file=APPLE:$pmapfile --fields=src-APPLE --values=records,bytes,packets --no-col --output=passextsrcapple.txt --copy-input=stdout | rwcount  --bin-size=$BIN --no-col --column-separator=";" > countextsrcapple.txt
echo Apple done!
rwuniq passextsrcedgecastv.rw --pmap-file=EDGECASTV:$pmapfile --fields=src-EDGECASTV --values=records,bytes,packets --no-col --output=passextsrcedgecastv.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcedgecastv.txt
echo Edgecast Verizon done!
#AS13399 removed
rwuniq passextsrcmsft.rw --pmap-file=MSFT:$pmapfile --fields=src-MSFT --values=records,bytes,packets --no-col --output=passextsrcmsft.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcmsft.txt
echo Microsoft Azure done!
rwuniq passextsrcfastly.rw --pmap-file=FASTLY:$pmapfile --fields=src-FASTLY --values=records,bytes,packets --no-col --output=passextsrcfastly.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcfastly.txt
echo Fastly done!
rwuniq passextsrcstackpath.rw --pmap-file=STACKPATH:$pmapfile --fields=src-STACKPATH --values=records,bytes,packets --no-col --output=passextsrcstackpath.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcstackpath.txt
echo Stackpath done!
rwuniq passextsrcreflected.rw --pmap-file=REFLECTED:$pmapfile --fields=src-REFLECTED --values=records,bytes,packets --no-col --output=passextsrcreflected.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcreflected.txt
echo Reflected Networks done!
#AS37277 removed
rwuniq passextsrclimelight.rw --pmap-file=LIMELIGHT:$pmapfile --fields=src-LIMELIGHT --values=records,bytes,packets --no-col --output=passextsrclimelight.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrclimelight.txt
echo Limelight done!
rwuniq passextsrccloudflare.rw --pmap-file=CLOUDFLARE:$pmapfile --fields=src-CLOUDFLARE --values=records,bytes,packets --no-col --output=passextsrccloudflare.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrccloudflare.txt
echo Cloudflare done!
#AS9059 removed
rwuniq passextsrcamazon.rw --pmap-file=AMAZON:$pmapfile --fields=src-AMAZON --values=records,bytes,packets --no-col --output=passextsrcamazon.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcamazon.txt
echo Amazon + AWS done!
#AS560 removed
rwuniq passextsrclevel.rw --pmap-file=LEVEL:$pmapfile --fields=src-LEVEL --values=records,bytes,packets --no-col --output=passextsrclevel.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrclevel.txt
echo Level3 done!
rwuniq passextsrcdropbox.rw --pmap-file=DROPBOX:$pmapfile --fields=src-DROPBOX --values=records,bytes,packets --no-col --output=passextsrcdropbox.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcdropbox.txt
echo Dropbox done!
rwuniq passextsrctwitch.rw --pmap-file=TWITCH:$pmapfile --fields=src-TWITCH --values=records,bytes,packets --no-col --output=passextsrctwitch.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrctwitch.txt
echo Twitch done!
rwuniq passextsrcrokla.rw --pmap-file=ROKLA:$pmapfile --fields=src-ROKLA --values=records,bytes,packets --no-col --output=passextsrcrokla.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countextsrcrokla.txt
echo Rokla done!
rwcount failextsrcrokla.rw --bin-size=$BIN --no-col --column-separator=";" > countextsrcfail.txt
echo Fail done!
rwuniq passextsrctelenor.rw -pmap-file=TELENOR:$pmapfile --fields=src-TELENOR --values=records,bytes,packets --no-col --output=passextsrctelenor.txt --copy-input=stdout | rwcount--bin-size=$BIN --no-col --column-separator=";" > countextsrctelenor.txt 
echo Telenor done!
echo EXT DONE!

