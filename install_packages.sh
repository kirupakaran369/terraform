#!/bin/bash
sudo apt update -y
if [ $? -eq 0 ] 
then
    sudo apt install nodejs npm -y
    sudo npm i -g pm2
    sudo apt install nginx -y 
    sudo systemctl start nginx 
        if [ $? -eq 0 ]
          then
            echo "################################"
            echo "All packages install sucessfully"
            echo "################################"
        else
            echo "################################"
            echo "Some packages not installed sucessfully-- Kindly login and check the issue"
            echo "################################"
        fi
elif [ $? -ne 0 ]
then
    sudo yum update -y
    sudo yum install nodejs -y
    sudo yum install npm -y 
    sudo npm install pm2 -g -y
    sudo yum install epel-release -y
    sudo yum install nginx -y
    sudo systemctl start nginx 
    sudo systemctl enable nginx 
        if [ $? -eq 0 ]
          then
            echo "################################"
            echo "All packages install sucessfully"
            echo "################################"
        else
            echo "################################"
            echo "Some packages not installed sucessfully-- Kindly login and check the issue"
            echo "################################"
        fi
fi

