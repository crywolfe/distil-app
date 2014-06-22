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

CURL can be used to access the API and create a POST request.  Remember, -X specifies the method... here it is POST. -d allows the sending of data with the request.
```bash
curl -i -X POST - d 'account[name]=???'... \ http://
```

TROUBLESHOOTING
===============

pry-rails gem was installed

annotate was installed
