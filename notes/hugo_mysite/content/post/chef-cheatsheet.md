+++
date = "2015-10-20T12:28:39+01:00"
draft = true
title = "chef cheatsheet"

+++

## Chef Cheatsheet

### knife bootstrap (Linux/ssh)

    $ knife bootstrap ADDRESS --ssh-user USER --ssh-password 'PASSWORD' --sudo --use-sudo-password --node-name NODE-NAME --run-list 'recipe[NAME-OF-RECIPE]'

### knife
* knife cookbook site download <cookbook> - downloads a cookbook from <https://supermarket.chef.io>
* knife cookbook upload <cookbook> - uploads a cookbook from the Chef-Workstation to the Chef-Server
* knife node list - list nodes known to the Chef-Server
* knife coobook delte <cookbook> - delete a cookbook from the Chef server
* knife cookbook bulk delete . -p - remove all cookbooks from Chef server
* knife node show NODE-NAME - display data about the node NODE-NAME
* knife node delete <NODE-NAME> --yes - Delete node from Chef server
* knife client delete <NODE-NAME> --yes - Delete client from Chef server
* knife cookbook upload NAME-OF-COOKBOOK - uploads a cookbook to the Chef server
* knife ssh ADDRESS 'sudo chef-client' --manual-list --ssh-user USER --ssh-password 'PASSWORD' - Force manual node update by running chef-client manually on NODE
* knife cookbook site show apt | grep latest_version - Display latest version of 'apt' cookbook in the Chef Supermarket
* knife create data bag passwords - Create a new data bag named 'passwords' on the Chef server
* knife data bag from file passwords sql_server_root_password.json --secret-file /tmp/encrypted_data_bag_secret - Encrypt data bag item and upload to the Chef server. Append '--local-mode' to encrypt local files on the workstation
* knife data bag show passwords sql_server_root_password - Show contents of key sql_server... in the paswords bag. Use --secret-file to attempt decryption


### chef (configure node directly)
* chef generate repo ~/chef-repo - Generate a new local Chef repository on your Chef Workstation in $HOME
* chef generate cookbook cookbooks/syrupnas - Create a new cookbook with name 'syrupnas'
* chef generate attribute cookbooks/awesome_customers default - Create an attribute file for awesome_customers
* chef generate recpie cookbooks/awesome_customer user - Create a recipe called 'user' int the cookbook 'awesome_customer'
* chef-apply
* chef-client
* chef exec rspec --color spec/unit/recipes/some_spec.rb - Run Unit test with rspec

### berks
* berks install - Install depencies for a cookbook to ~/.berkshelf (requires 'Berksfile' in the root of the cookbook)
* berks upload - Upload cookbooks to the Chef server. Berks requires a trusted SSL-Cert unless the --no-ssl-verify flag is provided
* berks update - Updates local packages within the constraints defined in the requirements

### kitchen
* kitchen list - See what's in the kitchen
* kitchen create - Create an instance
* kitchen converge - Apply the cookbook
* kitchen login
* kitchen destroy
* kitchen test - (Re-) build test env. and run integration tests

## Related stuff
* openssl rand -base64 512 | tr -d '\r\n' > /tmp/encrypted_data_bag_secret - generate an encryption key

