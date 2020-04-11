echo Welcome User Registration program


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
read -p"Enter email id :" email
[[ $email =~ ^[a-zA-Z0-9]+[\.\-\+\_]?[a-zA-Z0-9]*@[a-zA-Z]+[.]?[a-zA-Z]{2,4}[\.]?([a-z]{2})?$ ]] && echo Email is Valid || echo email is Invalid
