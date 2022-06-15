#!/bin/bash
echo "================================================================="
echo "|  |^^^^|	 |^^^^^^  |^^^^^^  |^^^^^^^|   |\    |	  |\	|    |"
echo "|	 |____|  | 	  |	   |	   |   | \   |	  | \	|    |"
echo "|	 |\	 |-----	  |	   |	   |   |  \  |	  |  \	|    |"
echo "|	 | \	 |	  |	   |	   |   |   \ |	  |   \ |    |"
echo "|	 |  \	 |______  |______  |_______|   |    \|    |    \|    |"
echo "================================================================="
echo
echo
echo "-------------------------------------------------------------"
echo "| Welcome to my newly made Recconiasance Automator.         |"    
echo "| This tool is design to automate your reconniasance phase. |"
echo "| To start reccon please hit 1, If not please hit 0.        |"
echo "|___________________________________________________________|"
echo
# Taking input from the user for running this script or not.
read a
if [ $a -eq 1 ] ;
then
echo "Great Choice!!"
echo 
echo "Please enter a valid domain name"
# Taking input from the user i.e. tesla.com
read b
echo
echo "----------------------------------------------------------------"
echo "Sublist3r is Startig"
# sublister command
sublist3r -d $b -o sub-domains.txt
echo
echo "----------------------------------------------------------------" 
echo
echo "Please wait while we are saving your ip address resolution results obtained from sub-domains"
input="/home/ahsaankhatri/midExam/sub-domains.txt"
while IFS= read -r line
do
nslookup $line >> addresses.txt
done < "$input"
echo
echo "Your output is saved in a text file"
echo "-----------------------------------------------------------------"
echo
echo "We have saved unique IP addresses to another text file, named unique-ip.txt"
sort addresses.txt | uniq -d | grep "Address" > unique-ip.txt
echo
echo "-----------------------------------------------------------------"
elif [ $a -eq 0 ] ;
then 
echo "Sad to know you are not willing to use me :("
else
echo "Invalid Input!"
fi
