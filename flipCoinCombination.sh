#!/bin/bash -x


#Start with Displaying Welcome message
echo ""
echo "Welcome to Flip Coin Combination Program "
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"
echo ""


#As a simulator, sort the Singlet, Doublet and Triplet combination and show the winning combination.
declare -a single
declare -a double
declare -a triple

function sortArray()
{
	flag=1;
	arrayResult="$1"
	l=${#arrayResult[@]}
	for (( i = 0; i < $l; i++ ))
	do
	    flag=0;
	    for ((j = 0; j < $l-$i; j++ ))
	    do
	        if [[ ${arrayResult[$j]} -gt ${arrayResult[$j+1]} ]]
	        then
	            temp=${arrayResult[$j]};
	            arrayResult[$j]=${arrayResult[$j+1]};
	            arrayResult[$j+1]=$temp;
	            flag=1;
	        fi
	    done

	    if [[ $flag -eq 0 ]]; then
	          break;
	    fi
done
}


#As a simulator, loop through Multiple times of flipping a coin store the Singlet Combination in a Dictionary. Finally determine the percentage of the Singlet Combination.
#Singlet shows Heads or Tails
h=0; t=0;
declare -A flipDictionary
for (( i = 0; i<100; i++ )); do
	flip=$((RANDOM%2))
	if [[ ${flip} -eq 0 ]]; then
		h=$((h+1))
		flipDictionary[$i]=H
	elif [[ ${flip} -eq 1 ]]; then
		t=$((t+1))
		flipDictionary[$i]=T
	fi
done

percentageHeads=$(($(($h*100))/$(($h+$t))))
percentageTails=$(($(($t*100))/$(($h+$t))))

echo " HEADS : $h times    Pecentage (HEADS) combination = $percentageHeads%"
echo " TAILS : $t times    Pecentage (TAILS) combination = $percentageTails%"
echo "Dictionary of Results : "
echo "${flipDictionary[@]}"
echo ""
single=($h $t)



#As a simulator, loop through Multiple times of flipping a coin store the Singlet Combination in a Dictionary. Finally determine the percentage of the Singlet Combination.
#Singlet shows Heads or Tails
hh=0; ht=0; th=0; tt=0;
declare -A doubletDictionary
for (( i = 0; i<100; i++ )); do
	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))
	if [[ ${flip1} -eq 0 && ${flip2} -eq 0 ]]; then
		hh=$((hh+1))
		doubletDictionary[$i]=HH
	elif [[ ${flip1} -eq 0 && ${flip2} -eq 1 ]]; then
		ht=$((ht+1))
		doubletDictionary[$i]=HT
	elif [[ ${flip1} -eq 1 && ${flip2} -eq 0 ]]; then
		th=$((th+1))
		doubletDictionary[$i]=TH
	elif [[ ${flip1} -eq 1 && ${flip2} -eq 1 ]]; then
		tt=$((tt+1))
		doubletDictionary[$i]=TT
	fi
done

percentageHH=$(($(($hh*100))/$(($hh+$th+$ht+$tt))))
percentageHT=$(($(($ht*100))/$(($hh+$th+$ht+$tt))))
percentageTH=$(($(($th*100))/$(($hh+$th+$ht+$tt))))
percentageTT=$(($(($tt*100))/$(($hh+$th+$ht+$tt))))

echo " HEADS HEADS : $hh times    Pecentage (HH) combination = $percentageHH%"
echo " HEADS TAILS : $ht times    Pecentage (HT) combination = $percentageHT%"
echo " TAILS HEADS : $th times    Pecentage (TH) combination = $percentageTH%"
echo " TAILS TAILS : $tt times    Pecentage (TT) combination = $percentageTT%"
echo "Dictionary of Results : "
echo "${doubletDictionary[@]}"
echo ""
double=($hh $ht $th $tt)

#As a simulator, do the same for Triplet Combination.
hhh=0; hht=0; hth=0; htt=0; thh=0; tht=0; tth=0; ttt=0;
declare -A tripletDictionary
for (( i = 0; i<100; i++ )); do
	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))
	flip3=$((RANDOM%2))
	if [[ ${flip1} -eq 0 && ${flip2} -eq 0 && ${flip3} -eq 0 ]]; then
		hhh=$((hhh+1))
		tripletDictionary[$i]=HHH
	elif [[ ${flip1} -eq 0 && ${flip2} -eq 0 && ${flip3} -eq 1 ]]; then
		hht=$((hht+1))
		tripletDictionary[$i]=HHT
	elif [[ ${flip1} -eq 0 && ${flip2} -eq 1 && ${flip3} -eq 0 ]]; then
		hth=$((hth+1))
		tripletDictionary[$i]=HTH
	elif [[ ${flip1} -eq 0 && ${flip2} -eq 1 && ${flip3} -eq 1 ]]; then
		htt=$((htt+1))
		tripletDictionary[$i]=HTT
	elif [[ ${flip1} -eq 1 && ${flip2} -eq 0 && ${flip3} -eq 0 ]]; then
		thh=$((thh+1))
		tripletDictionary[$i]=THH
	elif [[ ${flip1} -eq 1 && ${flip2} -eq 0 && ${flip3} -eq 1 ]]; then
		tht=$((tht+1))
		tripletDictionary[$i]=THT
	elif [[ ${flip1} -eq 1 && ${flip2} -eq 1 && ${flip3} -eq 0 ]]; then
		tth=$((tth+1))
		tripletDictionary[$i]=TTH
	elif [[ ${flip1} -eq 1 && ${flip2} -eq 1 && ${flip3} -eq 1 ]]; then
		ttt=$((ttt+1))
		tripletDictionary[$i]=TTT
	fi
done

percentageHHH=$(($(($hhh*100))/$(($hhh+$hht+$hth+$htt+$thh+$tht+$tth+$ttt))))
percentageHHT=$(($(($hht*100))/$(($hhh+$hht+$hth+$htt+$thh+$tht+$tth+$ttt))))
percentageHTH=$(($(($hth*100))/$(($hhh+$hht+$hth+$htt+$thh+$tht+$tth+$ttt))))
percentageHTT=$(($(($htt*100))/$(($hhh+$hht+$hth+$htt+$thh+$tht+$tth+$ttt))))
percentageTHH=$(($(($thh*100))/$(($hhh+$hht+$hth+$htt+$thh+$tht+$tth+$ttt))))
percentageTHT=$(($(($tht*100))/$(($hhh+$hht+$hth+$htt+$thh+$tht+$tth+$ttt))))
percentageTTH=$(($(($tth*100))/$(($hhh+$hht+$hth+$htt+$thh+$tht+$tth+$ttt))))
percentageTTT=$(($(($ttt*100))/$(($hhh+$hht+$hth+$htt+$thh+$tht+$tth+$ttt))))

echo " HEADS/HEADS/HEADS : $hhh times    Pecentage (HHH) combination = $percentageHHH%"
echo " HEADS/HEADS/TAILS : $hht times    Pecentage (HHT) combination = $percentageHHT%"
echo " HEADS/TAILS/HEADS : $hth times    Pecentage (HTH) combination = $percentageHTH%"
echo " HEADS/TAILS/TAILS : $htt times    Pecentage (HTT) combination = $percentageHTT%"
echo " TAILS/HEADS/HEADS : $thh times    Pecentage (THH) combination = $percentageTHH%"
echo " TAILS/HEADS/TAILS : $tht times    Pecentage (THT) combination = $percentageTHT%"
echo " TAILS/TAILS/HEADS : $thh times    Pecentage (TTH) combination = $percentageTTH%"
echo " TAILS/TAILS/TAILS : $ttt times    Pecentage (TTT) combination = $percentageTTT%"
echo "Dictionary of Triplet Results : "
echo "${tripletDictionary[@]}"
echo ""
triple=($hhh $hht $hth $htt $thh $tht $thh $ttt)


sortArray $single
sortArray $double
sortArray $triple


echo ${single[@]}
echo ${double[@]}
echo ${triple[@]}




















