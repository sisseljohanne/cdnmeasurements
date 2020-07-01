#rwfilterin2020031X.sh
DATA= <PATH TO DATA-SET>
SILKCONF= <PATH TO SILK.CONF>
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
#Adapt ASN to the pmap-file used
#.csv-fil: legg inn --no-col --column-separator=";"
echo Starts filtering CDN-traffic: in, inweb. Separate results for Facebook, Netflix, Akamai, Google Youtube, Apple etc.
rwfilter --type=in,inweb --start=$START --end=$END --pmap-file=FACEBOOK:$pmapfile --pmap-src-FACEBOOK=AS32934,AS54115,AS63293 --pass=passinfb.rw --fail=stdout --data=$DATA | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=NETFLIX:$pmapfile --pmap-src-NETFLIX=AS2906,AS40027 --pass=passinnetflix.rw --fail=stdout –input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=AKAMAI:$pmapfile --pmap-src-AKAMAI=AS12222,AS16625,AS18680,AS18717,AS20189,AS20940,AS24319,AS31108,AS31109,AS31110,AS31377,AS32787,AS33905,AS34164,AS35204,AS35993,AS35994,AS43639,AS49846,AS21342,AS22452,AS23454,AS26008,AS17204 --pass=passinakamai.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=GOOGLEY:$pmapfile --pmap-src-GOOGLEY=AS15169,AS19527,AS24424,AS36040,AS36384,AS36385,AS36492,AS41264,AS43515 --pass=passingoogley.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=APPLE:$pmapfile --pmap-src-APPLE=AS6185,AS714 --pass=passinapple.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=EDGECASTV:$pmapfile --pmap-src-EDGECASTV=AS15133 --pass=passinedgecastv.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=MSFT:$pmapfile --pmap-src-MSFT=AS12076,AS23468,AS35106,AS3598,AS45139,AS5761,AS58862,AS59067,AS6182,AS6194,AS6291,AS63314,AS6584,AS8068,AS8069,AS8070,AS8071,AS8075,AS8812,AS13399 --pass=passinmsft.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=FASTLY:$pmapfile --pmap-src-FASTLY=AS54113 --pass=passinfastly.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=STACKPATH:$pmapfile --pmap-src-STACKPATH=AS11588,AS12989,AS18607,AS20446,AS33438,AS64259 --pass=passinstackpath.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=REFLECTED:$pmapfile --pmap-src-REFLECTED=AS29789 --pass=passinreflected.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=LIMELIGHT:$pmapfile --pmap-src-LIMELIGHT=AS22822,AS23059,AS25804,AS38621,AS38622,AS45396,AS55429,AS60261 --pass=passinlimelight.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=CLOUDFLARE:$pmapfile --pmap-src-CLOUDFLARE=AS13335 --pass=passincloudflare.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=AMAZON:$pmapfile --pmap-src-AMAZON=AS16509,AS14618,AS55960,AS8987,AS19047,AS7224 --pass=passinamazon.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=LEVEL:$pmapfile --pmap-src-LEVEL=AS3356,AS3549,AS12576,AS560 --pass=passinlevel.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=DROPBOX:$pmapfile --pmap-src-DROPBOX=AS19679,AS54372,AS62190 --pass=passindropbox.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=TWITCH:$pmapfile --pmap-src-TWITCH=AS46849 --pass=passintwitch.rw --fail=stdout --input-pipe=stdin | rwfilter --type=in,inweb --site-config-file=$SILKCONF --pmap-file=ROKLA:$pmapfile --pmap-src-ROKLA=AS54994,AS60068,AS24429,AS23393,AS30081,AS34789,AS10310,AS14776,AS14777,AS14778,AS14779,AS14780,AS14781,AS23879,AS24506,AS26085,AS26101,AS34010,AS36088,AS36229,AS36646,AS36647,AS56173,AS5779,AS7233,AS40009,AS59019,AS21245,AS57363,AS60626,AS21030,AS19551,AS62571,AS33047,AS11855,AS12179,AS12180,AS12182,AS13789,AS13792,AS14742,AS14744,AS14745,AS15570,AS17675,AS19024,AS24245,AS24246,AS24247,AS30282,AS48910,AS36408,AS38107,AS63541,AS52580,AS22518,AS40428 --pass=passinrokla.rw --fail=failinrokla.rw --input-pipe=stdin
rwfilter failinrokla.rw --type=in,inweb --site-config-file=$SILKCONF --pmap-file=TELENOR:$pmapfile --pmap-src-TELENOR=AS2119 --pass=passintelenor.rw
echo rwfilter done!
rwuniq passinfb.rw --pmap-file=FACEBOOK:$pmapfile --fields=src-FACEBOOK --values=records,bytes,packets --no-col --output=passinfb.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinfb.txt
echo Facebook done!
rwuniq passinnetflix.rw --pmap-file=NETFLIX:$pmapfile --fields=src-NETFLIX --values=records,bytes,packets --no-col --output=passinnetflix.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinnetflix.txt
echo Netflix done!
rwuniq passinakamai.rw --pmap-file=AKAMAI:$pmapfile --fields=src-AKAMAI --values=records,bytes,packets --no-col --output=passinakamai.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinakamai.txt
echo Akamai done!
#AS17204 removed
rwuniq passingoogley.rw --pmap-file=GOOGLEY:$pmapfile --fields=src-GOOGLEY --values=records,bytes,packets --no-col --output=passingoogley.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countingoogley.txt
echo Google Youtube done!
rwuniq passinapple.rw --pmap-file=APPLE:$pmapfile --fields=src-APPLE --values=records,bytes,packets --no-col --output=passinapple.txt --copy-input=stdout | rwcount  --bin-size=$BIN --no-col --column-separator=";" > countinapple.txt
echo Apple done!
rwuniq passinedgecastv.rw --pmap-file=EDGECASTV:$pmapfile --fields=src-EDGECASTV --values=records,bytes,packets --no-col --output=passinedgecastv.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinedgecastv.txt
echo Edgecast Verizon done!
#AS13399 removed
rwuniq passinmsft.rw --pmap-file=MSFT:$pmapfile --fields=src-MSFT --values=records,bytes,packets --no-col --output=passinmsft.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinmsft.txt
echo Microsoft Azure done!
rwuniq passinfastly.rw --pmap-file=FASTLY:$pmapfile --fields=src-FASTLY --values=records,bytes,packets --no-col --output=passinfastly.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinfastly.txt
echo Fastly done!
rwuniq passinstackpath.rw --pmap-file=STACKPATH:$pmapfile --fields=src-STACKPATH --values=records,bytes,packets --no-col --output=passinstackpath.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinstackpath.txt
echo Stackpath done!
rwuniq passinreflected.rw --pmap-file=REFLECTED:$pmapfile --fields=src-REFLECTED --values=records,bytes,packets --no-col --output=passinreflected.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinreflected.txt
echo Reflected Networks done!
#AS37277 removed
rwuniq passinlimelight.rw --pmap-file=LIMELIGHT:$pmapfile --fields=src-LIMELIGHT --values=records,bytes,packets --no-col --output=passinlimelight.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinlimelight.txt
echo Limelight done!
rwuniq passincloudflare.rw --pmap-file=CLOUDFLARE:$pmapfile --fields=src-CLOUDFLARE --values=records,bytes,packets --no-col --output=passincloudflare.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countincloudflare.txt
echo Cloudflare done!
#AS9059 removed
rwuniq passinamazon.rw --pmap-file=AMAZON:$pmapfile --fields=src-AMAZON --values=records,bytes,packets --no-col --output=passinamazon.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinamazon.txt
echo Amazon + AWS done!
#AS560 removed
rwuniq passinlevel.rw --pmap-file=LEVEL:$pmapfile --fields=src-LEVEL --values=records,bytes,packets --no-col --output=passinlevel.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinlevel.txt
echo Level3 done!
rwuniq passindropbox.rw --pmap-file=DROPBOX:$pmapfile --fields=src-DROPBOX --values=records,bytes,packets --no-col --output=passindropbox.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countindropbox.txt
echo Dropbox done!
rwuniq passintwitch.rw --pmap-file=TWITCH:$pmapfile --fields=src-TWITCH --values=records,bytes,packets --no-col --output=passintwitch.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countintwitch.txt
echo Twitch done!
rwuniq passinrokla.rw --pmap-file=ROKLA:$pmapfile --fields=src-ROKLA --values=records,bytes,packets --no-col --output=passinrokla.txt --copy-input=stdout | rwcount --bin-size=$BIN --no-col --column-separator=";" > countinrokla.txt
echo Rokla done!
rwcount failinrokla.rw --bin-size=$BIN --no-col --column-separator=";" > countinfail.txt
echo Fail done!
rwuniq passintelenor.rw -pmap-file=TELENOR:$pmapfile --fields=src-TELENOR --values=records,bytes,packets --no-col --output=passintelenor.txt --copy-input=stdout | rwcount--bin-size=$BIN --no-col --column-separator=";" > countintelenor.txt 
echo Telenor done!
echo IN DONE!

