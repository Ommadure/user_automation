#/bin/bash

#adding an user 
#changing a password 
#deleteing an user

function add_user(){
read -p "Enter the name of user you want to create: " user


if ! grep -q $user in /etc/passwd 
then
sudo adduser $user
read -s -p "Enter the password for the user: " password
echo "The ${user} is added to the system."
exit 1

else 
echo "${user} already exist in the system."
fi
}

function del_user(){
read -p "Enter the name of the user you want to delete: " del_user1

if grep -q ${del_user1} in /etc/passwd
then 
sudo deluser ${del_user1}
echo "The ${del_user1} user is deleted from the system."
exit 1
else 
echo "The ${del_user1} user doesn't exits in system."
exit 1
fi
}



function change_passwd (){
read -p "Name the user you want to change the password: " chag_user
if  grep -Rw /etc/passwd -e '${chag_user}'
then 
if [[ $? -eq 0 ]]
then 
sudo passwd ${chan_user}
echo "Password is changed."
exit 1
else 
echo "Password is not changed."
fi
exit 1 

else
echo "The ${chag_user} is not present in the system"
exit 1
fi
}

while true;
do
echo "There are 4 options."
echo -e "1.Add user \n 2.delete user \n 3.change password \n 4.exit "
read -p "Enter your choices: " choice 

case ${choice} in

1)
add_user
;;

2)
del_user
;;

3)
change_passwd 
;;

4)
echo "exiting...."
exit 1
;;

*)
echo "Enter the correct option. "
;;
esac
done





