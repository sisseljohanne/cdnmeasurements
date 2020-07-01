#invalidasntoipprefix.sh
DATA= <PATH TO DATA-SET>
SILKCONF= <PATH TO SILK.CONF>
START=2020/03/11
END=2020/03/11
pmapfile=20200311.bgp.ripe.pmap
BIN=120
#Adapt ASN to the pmap-file used
#AS560 80.88.10.0/24,95.158.142.0/23
#AS13399 195.69.252.0/24,195.69.254.0/24
#AS17204 64.89.224.0/20,199.119.220.0/22
echo Tests for IP ranges registered to AS560
rwfilter --data=$DATA --start=$START --end=$END --any-cidr=80.88.10.0/24,95.158.142.0/23 --type=ext2ext --pass=passextasone.rw 
rwcount passextasone.rw --bin-size=$BIN --no-col --column-separator=";" > countextasone.txt
rwfilter --data=$DATA --start=$START --end=$END --scidr=80.88.10.0/24,95.158.142.0/23 --type=in,inweb --pass=passinasone.rw
rwcount passinasone.rw --bin-size=$BIN --no-col --column-separator=";" > countiasone.txt
rwfilter --data=$DATA --start=$START --end=$END --dcidr=80.88.10.0/24,95.158.142.0/23 --type=out,outweb --pass=passoutasone.rw 
rwcount passoutasone.rw --bin-size=$BIN --no-col --column-separator=";" > countoutasone.txt
echo Tests for IP ranges registered to AS13399
rwfilter --data=$DATA --start=$START --end=$END --any-cidr=195.69.252.0/24,195.69.254.0/24 --type=ext2ext --pass=passextastwo.rw 
rwcount passextastwo.rw --bin-size=$BIN --no-col --column-separator=";" > countextastwo.txt
rwfilter --data=$DATA --start=$START --end=$END --scidr=195.69.252.0/24,195.69.254.0/24 --type=in,inweb --pass=passinastwo.rw 
rwcount passinastwo.rw --bin-size=$BIN --no-col --column-separator=";" > countinastwo.txt
rwfilter --data=$DATA --start=$START --end=$END --dcidr=195.69.252.0/24,195.69.254.0/24 --type=out,outweb --pass=passoutastwo.rw 
rwcount passoutastwo.rw --bin-size=$BIN --no-col --column-separator=";" > countoutastwo.txt
echo Tests for IP ranges registered to AS17204
rwfilter --data=$DATA --start=$START --end=$END --any-cidr=64.89.224.0/20,199.119.220.0/22 --type=ext2ext --pass=passextasthree.rw 
rwcount passextasthree.rw --bin-size=$BIN --no-col --column-separator=";" > countextasthree.txt
rwfilter --data=$DATA --start=$START --end=$END --scidr=64.89.224.0/20,199.119.220.0/22 --type=in,inweb --pass=passinasthree.rw 
rwcount passinasthree.rw --bin-size=$BIN --no-col --column-separator=";" > countinasthree.txt
rwfilter --data=$DATA --start=$START --end=$END --dcidr=64.89.224.0/20,199.119.220.0/22 --type=out,outweb --pass=passoutasthree.rw 
rwcount passoutasthree.rw --bin-size=$BIN --no-col --column-separator=";" > countoutasthree.txt
echo ALL DONE! 

