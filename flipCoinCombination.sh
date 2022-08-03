#!/bin/bash -x


#Start with Displaying Welcome message

echo ""
echo "Welcome to Flip Coin Combination Program "
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"
echo ""


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
