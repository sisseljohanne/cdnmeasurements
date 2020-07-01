#rwfilterout2020031X.sh
DATA= <PATH TO DATA-SET>
SILKCONF= <PATH TO SILK.CONF>
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
#Adapt ASN to the pmap-file used
#.csv-fil: --no-col --column-separator=";"
echo Count all traffic, all types
rwfilter --data=$DATA --start=$START --end=$END --type=in,inweb,out,outweb,int2int,ext2ext --all=countalltraffic.rw
rwcount countalltraffic.rw --bin-size=$BIN --no-col --column-separator=";" > countalltraffic.txt
echo Starts filtering CDN-traffic: out, outweb. Separate results for Facebook, Netflix, Akamai, Google Youtube, Apple etc.
rwfilter --type=out,outweb --start=$START --end=$END --pmap-file=FACEBOOK:$pmapfile --pmap-dst-FACEBOOK=AS32934,AS54115,AS63293 --pass=passoutfb.rw --fail=stdout --data=$DATA | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=NETFLIX:$pmapfile --pmap-dst-NETFLIX=AS2906,AS40027 --pass=passoutnetflix.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=AKAMAI:$pmapfile --pmap-dst-AKAMAI=AS12222,AS16625,AS18680,AS18717,AS20189,AS20940,AS24319,AS31108,AS31109,AS31110,AS31377,AS32787,AS33905,AS34164,AS35204,AS35993,AS35994,AS43639,AS49846,AS21342,AS22452,AS23454,AS26008,AS17204 --pass=passoutakamai.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=GOOGLEY:$pmapfile --pmap-dst-GOOGLEY=AS15169,AS19527,AS24424,AS36040,AS36384,AS36385,AS36492,AS41264,AS43515 --pass=passoutgoogley.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=APPLE:$pmapfile --pmap-dst-APPLE=AS6185,AS714 --pass=passoutapple.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=EDGECASTV:$pmapfile --pmap-dst-EDGECASTV=AS15133 --pass=passoutedgecastv.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=MSFT:$pmapfile --pmap-dst-MSFT=AS12076,AS23468,AS35106,AS3598,AS45139,AS5761,AS58862,AS59067,AS6182,AS6194,AS6291,AS63314,AS6584,AS8068,AS8069,AS8070,AS8071,AS8075,AS8812,AS13399 --pass=passoutmsft.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=FASTLY:$pmapfile --pmap-dst-FASTLY=AS54113 --pass=passoutfastly.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=STACKPATH:$pmapfile --pmap-dst-STACKPATH=AS11588,AS12989,AS18607,AS20446,AS33438,AS64259 --pass=passoutstackpath.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=REFLECTED:$pmapfile --pmap-dst-REFLECTED=AS29789 --pass=passoutreflected.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=LIMELIGHT:$pmapfile --pmap-dst-LIMELIGHT=AS22822,AS23059,AS25804,AS38621,AS38622,AS45396,AS55429,AS60261 --pass=passoutlimelight.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=CLOUDFLARE:$pmapfile --pmap-dst-CLOUDFLARE=AS13335 --pass=passoutcloudflare.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=AMAZON:$pmapfile --pmap-dst-AMAZON=AS16509,AS14618,AS55960,AS8987,AS19047,AS7224 --pass=passoutamazon.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=LEVEL:$pmapfile --pmap-dst-LEVEL=AS3356,AS3549,AS12576,AS560 --pass=passoutlevel.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=DROPBOX:$pmapfile --pmap-dst-DROPBOX=AS19679,AS54372,AS62190 --pass=passoutdropbox.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=TWITCH:$pmapfile --pmap-dst-TWITCH=AS46849 --pass=passouttwitch.rw --fail=stdout --input-pipe=stdin | rwfilter --type=out,outweb --site-config-file=$SILKCONF --pmap-file=ROKLA:$pmapfile --pmap-dst-ROKLA=AS54994,AS60068,AS24429,AS23393,AS30081,AS34789,AS10310,AS14776,AS14777,AS14778,AS14779,AS14780,AS14781,AS23879,AS24506,AS26085,AS26101,AS34010,AS36088,AS36229,AS36646,AS36647,AS56173,AS5779,AS7233,AS40009,AS59019,AS21245,AS57363,AS60626,AS21030,AS19551,AS62571,AS33047,AS11855,AS12179,AS12180,AS12182,AS13789,AS13792,AS14742,AS14744,AS14745,AS15570,AS17675,AS19024,AS24245,AS24246,AS24247,AS30282,AS48910,AS36408,AS38107,AS63541,AS52580,AS22518,AS40428 --pass=passoutrokla.rw --fail=failoutrokla.rw --input-pipe=stdin
rwfilter failoutrokla.rw --type=out,outweb --site-config-file=$SILKCONF --pmap-file=TELENOR:$pmapfile --pmap-dst-TELENOR=AS2119 --pass=passouttelenor.rw
echo rwfilter done!
rwuniq passoutfb.rw --pmap-file=FACEBOOK:$pmapfile --fields=dst-FACEBOOK --values=records,bytes,packets --no-col --output=passoutfb.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutfb.txt
echo Facebook done!
rwuniq passoutnetflix.rw --pmap-file=NETFLIX:$pmapfile --fields=dst-NETFLIX --values=records,bytes,packets --no-col --output=passoutnetflix.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutnetflix.txt
echo Netflix done!
rwuniq passoutakamai.rw --pmap-file=AKAMAI:$pmapfile --fields=dst-AKAMAI --values=records,bytes,packets --no-col --output=passoutakamai.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutakamai.txt
echo Akamai done!
#AS17204 removed
rwuniq passoutgoogley.rw --pmap-file=GOOGLEY:$pmapfile --fields=dst-GOOGLEY --values=records,bytes,packets --no-col --output=passoutgoogley.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutgoogley.txt
echo Google Youtube done!
rwuniq passoutapple.rw --pmap-file=APPLE:$pmapfile --fields=dst-APPLE --values=records,bytes,packets --no-col --output=passoutapple.txt --copy-input=stdout | rwcount  --bin-size=$BIN --no-col --column-separator=";" > countoutapple.txt
echo Apple done!
rwuniq passoutedgecastv.rw --pmap-file=EDGECASTV:$pmapfile --fields=dst-EDGECASTV --values=records,bytes,packets --no-col --output=passoutedgecastv.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutedgecastv.txt
echo Edgecast Verizon done!
#AS13399 removed
rwuniq passoutmsft.rw --pmap-file=MSFT:$pmapfile --fields=dst-MSFT --values=records,bytes,packets --no-col --output=passoutmsft.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutmsft.txt
echo Microsoft Azure done!
rwuniq passoutfastly.rw --pmap-file=FASTLY:$pmapfile --fields=dst-FASTLY --values=records,bytes,packets --no-col --output=passoutfastly.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutfastly.txt
echo Fastly done!
rwuniq passoutstackpath.rw --pmap-file=STACKPATH:$pmapfile --fields=dst-STACKPATH --values=records,bytes,packets --no-col --output=passoutstackpath.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutstackpath.txt
echo Stackpath done!
rwuniq passoutreflected.rw --pmap-file=REFLECTED:$pmapfile --fields=dst-REFLECTED --values=records,bytes,packets --no-col --output=passoutreflected.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutreflected.txt
echo Reflected Networks done!
#AS37277 removed
rwuniq passoutlimelight.rw --pmap-file=LIMELIGHT:$pmapfile --fields=dst-LIMELIGHT --values=records,bytes,packets --no-col --output=passoutlimelight.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutlimelight.txt
echo Limelight done!
rwuniq passoutcloudflare.rw --pmap-file=CLOUDFLARE:$pmapfile --fields=dst-CLOUDFLARE --values=records,bytes,packets --no-col --output=passoutcloudflare.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutcloudflare.txt
echo Cloudflare done!
#AS9059 removed
rwuniq passoutamazon.rw --pmap-file=AMAZON:$pmapfile --fields=dst-AMAZON --values=records,bytes,packets --no-col --output=passoutamazon.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutamazon.txt
echo Amazon + AWS done!
#AS560 removed
rwuniq passoutlevel.rw --pmap-file=LEVEL:$pmapfile --fields=dst-LEVEL --values=records,bytes,packets --no-col --output=passoutlevel.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutlevel.txt
echo Level3 done!
rwuniq passoutdropbox.rw --pmap-file=DROPBOX:$pmapfile --fields=dst-DROPBOX --values=records,bytes,packets --no-col --output=passoutdropbox.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutdropbox.txt
echo Dropbox done!
rwuniq passouttwitch.rw --pmap-file=TWITCH:$pmapfile --fields=dst-TWITCH --values=records,bytes,packets --no-col --output=passouttwitch.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countouttwitch.txt
echo Twitch done!
rwuniq passoutrokla.rw --pmap-file=ROKLA:$pmapfile --fields=dst-ROKLA --values=records,bytes,packets --no-col --output=passoutrokla.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countoutrokla.txt
echo Rokla done!
rwcount failoutrokla.rw --bin-size=$BIN --no-col --column-separator=";" > countoutfail.txt
echo Fail done!
rwuniq passouttelenor.rw -pmap-file=TELENOR:$pmapfile --fields=dst-TELENOR --values=records,bytes,packets --no-col --output=passouttelenor.txt --copy-input=stdout | rwcount--bin-size=$BIN --no-col --column-separator=";" > countouttelenor.txt 
echo Telenor done!
echo OUT DONE!

