#!/bin/bash -x


#Start with Displaying Welcome message

echo ""
echo "Welcome to Flip Coin Combination Program "
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"
echo ""


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

