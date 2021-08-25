declare -a EmptyArray
declare -a AllArray

echo This code is for showing you all the files in your path and 
echo delete the empty files if you want. After you click \'y\' button,
echo the system will show you the empty txt files one by one.
echo 
i=0
b=0

for file in *.*
do
        AllArray[$i]=$file
        i=$(($i+1))
done
p=0
j=0
for p in ${AllArray[@]}
do
	if [ ! -s ${p} ]
	then
		EmptyArray[$j]=$p
		j=$(($j+1))
	fi
done

echo These are all files:*********** 

for b in ${AllArray[@]}
do 
	echo $b;
done

echo These are empty text files:**** 
len=(${#EmptyArray[@]})

for k in ${EmptyArray[@]}
do 
	echo $k;
done

echo Do you want to erase empty txt files? y,n 
read varname


if [ $varname == "y" ]
then
	if [ $len == 0 ]
	then 
		echo There was no file.
	else 	
		rm -i ${EmptyArray[*]}
		unset EmptyArray
	fi
else
	echo Failed to delete files!
fi
echo The file/files deleted.


