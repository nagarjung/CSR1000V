#!/bin/bash
host=Host_IP_Address
metric1=csr.memory.available
metric2=csr.memory.used
metric3=csr.memory.free
csr_id=Tenant_ID
#i=$3
#j=4

avail_processor=`awk '{ print $3; }' csr-memory-dump.txt  | awk 'NR==4 {print}'`
used_processor=`awk '{print $4; }' csr-memory-dump.txt  | awk 'NR==4 {print}'`
free_processor=`awk '{ print $5; }' csr-memory-dump.txt  | awk 'NR==4 {print}'`

#avail_IO=`awk '{ print $3; }' csr-memory-dump.txt  | awk 'NR==4 {print}'`
#used_IO=`awk '{print $4; }' csr-memory-dump.txt  | awk 'NR==4 {print}'`
#free_IO=`awk '{ print $5; }' csr-memory-dump.txt  | awk 'NR==4 {print}'`


now=$(($(date +%s%N)/1000000000))
echo "put $metric1 $now $avail_processor type="allocated" host=$csr_id"| nc -w 30 $host 4343
echo "put $metric2 $now $used_processor type="used" host=$csr_id"| nc -w 30 $host 4343
echo "put $metric3 $now $free_processor type="free" host=$csr_id"| nc -w 30 $host 4343
#echo "put $metric1 $now $avail_IO type="allocated" host=$csr_id"| nc -w 30 $host 4343
#echo "put $metric1 $now $avail_IO type="used" host=$csr_id"| nc -w 30 $host 4343
#echo "put $metric1 $now $avail_IO type="free" host=$csr_id"| nc -w 30 $host 4343

#echo "avail= " $avail_processor
#echo "used =" $used_processor
#echo "free =" $free_processor
			

#echo "put $metric $now $byte from=$from to=$to type=$proto data=$byte"| nc -w 30 $host 4343
			#echo "put $metric $now $byte from=$from"| nc -w 30 $host 4242
#			echo "$metric $now $byte data=$byte" 

