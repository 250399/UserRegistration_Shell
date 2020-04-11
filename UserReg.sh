#!/bin/bash

validateName () {
	read -p"Enter User name :" user
	userFlag=valid
	for i in 1 2
	do
		name=`echo $user | awk  '{ print $'$i' }'`
		echo $name
		if [[ $name =~ ^[A-Z@][a-z]{2,} ]] 
		then
			continue
		else
			userFlag=Invalid
			break
		fi
	done
	[ "$userFlag" = "valid" ] && echo Username is Valid || echo Username is Invalid
}

validateEmail () {
	read -p"Enter email id :" email
	[[ $email =~ ^[a-zA-Z0-9]+[\.\-\+\_]?[a-zA-Z0-9]*@[a-zA-Z]+[.]?[a-zA-Z]{2,4}[\.]?([a-z]{2})?$ ]] && echo Email is Valid || echo email is Invalid

}

validatePhoneNumber () {
	read -p"Enter Phone No :" pno
	countryCode=`echo $pno | awk '{ print $1 }'`
	phoneNo=`echo $pno | awk '{ print $2 }'`
	noFlag=valid
	if [[ $countryCode =~ ^[0-9]{2}$ ]]
	then
		[[ $phoneNo =~ ^[0-9]{10}$ ]] && : || noFlag=In
	else
	noFlag=invalid
	fi

	[ "$noFlag" = "valid" ] && echo PhoneNumber is vlaid ||echo Invalid Pno 

}

validatePassword () {
	read -sp"Enter password : " password
	SymbolCount=0
	if [[ ${#password} -ge 8 && "$password" == *[[:upper:]]* && "$password" == *[[:digit:]]* ]]
	then
		if [[ `echo $password | awk '{print gsub("[^a-zA-Z0-9]", "")}'` -eq 1 ]]
		then
	 		echo valid
		else
			echo invalid
		fi
	else
	echo invalid
	fi
}

echo Welcome User Registration program

validateName
validateEmail
validatePhoneNumber
validatePassword
