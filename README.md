INTRODUCTION
============

This project creates a RESTful API that can be used by any number of different clients.

The API will be used to manage a list of accounts and domains. Each account can have many domains.  A single domain can only belong to one account.

The API will have its own accessible subdomain, `api.distil-app-dev.com`.

INSTALLATION
============

`sudo [text editor name] /etc/hosts`


USE
===

First, make sure you have your `/etc/hosts` file set up to allow for the api subdomain.
```bash
127.0.0.1 distil-app-dev.com
127.0.0.1 api.distil-app-dev.com
```
To access this URL, still need port number...
so ...-dev.com:3000

From the terminal, CURL can be used to access the API and prepare RESTful requests.
The -i flag includes the http header in the output.  
The -X flag specifies the method.
The -d flag specifies the data being sent with the request.

To Post to an Account
---------------------
For example, to issue a post request to the accounts table using the name attribute, type the following command in the terminal.
```bash
$ curl -i -X POST -d 'account[name]=curl_post_account' http://api.distil-app-dev.com:3000/accounts
```

To Get an Account
-----------------
For example, issue a get request for account with id of 2, type the following command in the terminal.
```bash
$ curl -i http://api.distil-app-dev.com:3000/accounts/2
```

To Delete an Account
--------------------
For example, to delete an account with id of 3, type one of the following command in the terminal.
```bash
$ curl -i -X DELETE http://api.distil-app-dev.com:3000/accounts/3
$ curl --request DELETE http://api.distil-app-dev.com:3000/accounts/4
```


TROUBLESHOOTING
===============

pry-rails gem was installed

annotate was installed
