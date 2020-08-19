#!/bin/bash


touch temp.txt

touch final_list.txt

sort -k 3,3 file1.txt >tmp1.txt #sorting by rollno

mv tmp1.txt file1.txt

sort -k 1,1 file2.txt >tmp2.txt #sorting by rollno

mv tmp2.txt file2.txt

join -1 3 -2 1 file1.txt file2.txt >temp.txt

sort -k 2,2 temp.txt >tmp3.txt #sorting by mail

mv tmp3.txt temp.txt

sort -k 1,1 file3.txt >tmp4.txt #sorting third file by mail

mv tmp4.txt file3.txt



join -1 3 -2 1  temp.txt file3.txt >final_list.txt




flag=1

while [ $flag == 1 ]

do

	read -p "Enter the <fieldname:value> =>" input 

	if [[ $input == *"roll"* ]]; then 

		value=$(echo $input | awk -F ":" '{print $2}')

		cat final_list.txt | grep $value

	#rowvalue=$(cat final_list.txt | grep $value )

	#echo $rowvalue

	elif [[ $input == *"name"* ]]; then
	
		value=$(echo $input | awk -F ":" '{print $2}')

		cat final_list.txt | grep $value

	elif [[ $input == *"email"* ]]; then
	
		value=$(echo $input | awk -F ":" '{print $2}')

		cat final_list.txt | grep $value


	elif [[ $input == *"branch"* ]]; then
	
		value=$(echo $input | awk -F ":" '{print $2}')

		cat final_list.txt | grep $value



	elif [[ $input == *"gradyear"* ]]; then
	
		value=$(echo $input | awk -F ":" '{print $2}')

		cat final_list.txt | grep $value

	elif [[ $input == *"phoneno"* ]]; then
	
		value=$(echo $input | awk -F ":" '{print $2}')
	
		cat final_list.txt | grep $value 
	else
		echo "invalid input..."

	fi

read -p "Do you want to continue(1:yes , 0:no)" flag

done
