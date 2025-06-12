#!/bin/bash

function userOptions {
    while true 
    do    
        select opt in add delete password userid back 
	do
            case $opt in
                add)
                    read -p "Enter username: " username
                    useradd $username
                    passwd $username 
                    break
                    ;;
                delete)
                    read -p "Enter username: " username
                    userdel -r $username
                    break
                    ;;
                password)
                    read -p "Enter username: " username
                    passwd $username 
                    break
                    ;;
                userid)
                    read -p "Enter username: " username
                    read -p "Enter the new User ID: " uid
                    usermod -u $uid $username
                    break
                    ;;
                back)
                    return
                    ;;
                *)
                    echo "Invalid option."
                    ;;
            esac
        done
    done
}

function groupOptions {
    while true 
    do    
        select opt in add rename delete back 
	do
            case $opt in
                add)
                    read -p "Enter group name: " grpname
                    groupadd $grpname
                    break
                    ;;
                rename)
                    read -p "Enter old group name: " grpname
                    read -p "Enter the new group name: " newgrpname
                    groupmod -n $newgrpname $grpname
                    break
                    ;;
                delete)
                    read -p "Enter group name: " grpname
                    groupdel $grpname
                    break
                    ;;
                back)
                    return
                    ;;
                *)
                    echo "Invalid Option."
                    ;;
            esac
        done
    done
}

PS3="Please Choose one: "

while true
do
    select option in User Group Exit
    do
        case $option in
            User)
                userOptions
                break
                ;;
            Group)
                groupOptions
                break
                ;;
            Exit)
                exit
                ;;
            *)
                echo "Invalid Option."
                ;;
        esac
    done
done

                                                
