#!/bin/bash -x


#Start with Displaying Welcome message

echo ""
echo "Welcome to Flip Coin Combination Program "
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"
echo ""


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
echo "Dictionary of Results : "
echo "${tripletDictionary[@]}"
echo ""