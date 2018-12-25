j=5
while [ $j != 7 ]
do
	 i=1
	 while [ $i != 9 ]
	 do
		  google-chrome https://cdc.iitpkd.ac.in/111"$j"0100$i/core-cv
		  ((i+=1))
	 done

	 while [ $i != 34 ]
	 do
		  google-chrome https://cdc.iitpkd.ac.in/111"$j"010$i/core-cv
		  ((i+=1))
	 done
	 ((j+=1))
done

