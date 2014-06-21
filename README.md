INTRODUCTION
============

This project creates a RESTful API that can be used by any number of different clients.

The API will be used to manage a list of accounts and domains. Each account can have many domains.  A single domain can only belong to one account.

INSTALLATION
============




USE
===

CURL can be used to access the API and create a POST request.  Remember, -X specifies the method... here it is POST. -d allows the sending of data with the request.
```bash
curl -i -X POST - d 'account[name]=???'... \ http://
```

TROUBLESHOOTING
===============

pry-rails gem was installed

annotate was installed
