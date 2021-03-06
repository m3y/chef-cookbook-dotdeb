#
# Cookbook Name:: dotdeb
# Recipe:: wheezy
#
# Copyright 2013, m3y 
#
# All rights reserved - Do Not Redistribute
#

script 'dotdeb_wheezy' do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
        cat /etc/apt/sources.list | grep -e "wheezy all"
        if [ $? -eq 1 ]; then
            sudo echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
            sudo echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
            wget http://www.dotdeb.org/dotdeb.gpg && cat dotdeb.gpg | sudo apt-key add -
            sudo apt-get update
            sudo apt-get upgrade
            sudo rm /tmp/dotdeb.gpg
        fi
    EOH
end
