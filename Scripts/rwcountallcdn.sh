BIN=120
rwcount --xargs=allpassfilesext.txt --bin-size=$BIN --no-col --column-separator=";" > countallcdnext.txt
rwcount --xargs=allpassfilesin.txt --bin-size=$BIN --no-col --column-separator=";" > countpassallcdnin.txt
rwcount --xargs=allpassfilesout.txt --bin-size=$BIN --no-col --column-separator=";" > countpassallcdnout.txt
rwcount --xargs=allpassfiles.txt --bin-size=$BIN --no-col --column-separator=";" > countpassallcdnall.txt
rwcount --xargs=allfailfiles.txt --bin-size=$BIN --no-col --column-separator=";" > countfailcdnall.txt
