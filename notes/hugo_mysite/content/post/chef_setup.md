+++
date = "2015-10-19T15:43:45+01:00"
draft = true
title = "chef_setup"

+++

## Configuring my Chef Server

These are just my personal notes. The full documentation can be found at <https://learn.chef.io>
Note: The chef server package installs it's own embedded postgresql engine - so make sure you don't have one installed already.

### System Preparation
Configure FQDN for the server and ensure the hostname can be resolved in your lan.
Set AppArmor to 'complaint' mode:

    $ sudo apparmor_status

If any process or profiles are in "enforce mode" switch Apparmor to "Complaining" mode (you may want to backup /etc/apparmor.d first - just to be sane):

    $ sudo aa-complain /etc/apparmor.d/*

### Get the Installation Package
Follow the instructions from [Learning Chef](https://learn.chef.io/install-and-manage-your-own-chef-server/linux/install-chef-server/install-chef-server-using-your-hardware/) to get the Chef server deb.


### Installation
The download is provided as a 'deb' package, so install it via:

    $ sudo dpkg -i chef-server-core_xxxx_amd64.deb

Create /etc/opscode/chef-server.rb replacing "CHEF_SERVER_FQDN" with the FQDN of your server.

    server_name = "CHEF_SERVER_FQDN"
    api_fqdn server_name
    bookshelf['vip'] = server_name
    nginx['url'] = "https://#{server_name}"
    nginx['server_name'] = server_name
    nginx['ssl_certificate'] = "/var/opt/opscode/nginx/ca/#{server_name}.crt"
    nginx['ssl_certificate_key'] = "/var/opt/opscode/nginx/ca/#{server_name}.key"

Apply the configuration and start the server

    sudo chef-server-ctl reconfigure

Install optional components [Chef Management Console](https://docs.chef.io/manage.html) and [Chef reporting](https://docs.chef.io/install_reporting.html)
The Management Console:

    sudo chef-server-ctl install opscode-manage
    sudo chef-server-ctl reconfigure
    sudo opscode-manage-ctl reconfigure

The reporting feature:

    sudo chef-server-ctl install opscode-reporting
    sudo chef-server-ctl reconfigure
    sudo opscode-reporting-ctl reconfigure

Create the admin account

    sudo chef-server-ctl user-create ADMIN_USER_NAME ADMIN_FIRST_NAME ADMIN_LAST_NAME ADMIN_EMAIL ADMIN_PASSWORD --filename ADMIN_USER_NAME.pem

Download the Starter Kit
Reference: [Learn Chef](https://learn.chef.io/install-and-manage-your-own-chef-server/linux/install-chef-server/install-chef-server-using-your-hardware/)

Note: The official documentation a the time stated to extract the starter kit into a previously initialised repo on your Chef-Workstation. Apparently this lead to 'knife ssl fetch' utilising wrong information and trying to fetch the cert from localhost instead of the chef-server.
Extract the Starter Kit onto your Chef Workstation (wrong? -> over the chef-repo you created earlier) and verify the cert.

    knife ssl fetch URL_OF_YOUR_SERVER
    kinfe ssl check

Finaly test the connection to the Chef server

    $ knife client list
        <organisation>-validator



