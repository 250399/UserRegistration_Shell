echo Welcome User Registration program


read -p"Enter User name :" user
[[ $user =~ ^[A-Z@][a-z]{2,} ]] && echo Valid || echo Invalid
