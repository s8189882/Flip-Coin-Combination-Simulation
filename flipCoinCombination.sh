#!/bin/bash -x


#Start with Displaying Welcome message

echo ""
echo "Welcome to Flip Coin Combination Program "
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"
echo ""


#As a Simulator start with Flipping a Coin to Display Heads or Tails
#Use ((RANDOM)) to find Heads or Tails
#Name the file flipCoinCombination.sh
flip=$((RANDOM%2))

if [[ ${flip} -eq 0 ]]; then
	echo HEADS
elif [[ ${flip} -eq 1 ]]; then
	echo TAILS
fi
echo ""