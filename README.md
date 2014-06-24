INTRODUCTION
============

This project creates a RESTful API that can be used by any number of different clients.  In its current form, the most effective way to consume this API is via cURL since cURL allows for an easy POST request.  Although one can certainly install a browser extension to handle POST requests.

The API will be used to manage a list of accounts and domains. Each account can have many domains.  A single domain can only belong to one account.

The API will have its own accessible subdomain, `api.distil-app-dev.com`.

INSTALLATION
============

`sudo [text editor name] /etc/hosts`


install delayed_job gem
`gem install delayed_job`
follow the installation procedures from the delayed_job gem.
??delayed_job_active_record
rails generate delayed_job:active_record
bundle exec rake jobs:work

install the `dnsruby` gem


USE
===

First, make sure you have your `/etc/hosts` file set up to allow for the api subdomain.
```bash
127.0.0.1 distil-app-dev.com
127.0.0.1 api.distil-app-dev.com
```
To access this URL, one still needs to insert the port number.
`distil-app-dev.com:3000`

From the terminal, cURL can be used to access the API and prepare RESTful requests.
The -i flag includes the http header in the output if one so chooses.  
The -X flag specifies the method.
The -d flag specifies the data being sent with the request for a POST request.

To Create an Account (using cURL)
---------------------------------
For example, to issue a post request to the accounts table using the name attribute, type the following command in the terminal.
```bash
$ curl -i -X POST -d 'account[name]=my_domains' http://api.distil-app-dev.com:3000/accounts
```

To Create an Account (using a browser extension)
--------------------------------------
The URL to use is `http://api.distil-app-dev.com:3000/api/accounts`
The method is `POST`.
The body of the method is json.


To Update an Account (using cURL)
---------------------------------
For example...
```bash
$ curl -i -X PATCH ???
```

To Update an Account (using a browser extension)
---------------------------------
The URL to use is `http://api.distil-app-dev.com:3000/api/accounts/:id`
The method is `PATCH`.
The body of the method is json.

To Get an Account (using cURL)
------------------------------
For example, issue a get request for account with id of 2, type the following command in the terminal.
```bash
$ curl -i http://api.distil-app-dev.com:3000/accounts/2
```

To Get an Account (using the browser)
------------------------------
The URL to use is `http://api.distil-app-dev.com:3000/api/accounts/:id`
The method is `GET`.
There is no body.

To Delete an Account (with cURL)
--------------------------------
For example, to delete an account with id of 3, type one of the following command in the terminal.
```bash
$ curl -i -X DELETE http://api.distil-app-dev.com:3000/accounts/3
$ curl --request DELETE http://api.distil-app-dev.com:3000/accounts/4
```

To Delete an Account (with a browser extension)
-----------------------------------------------
The URL to use is `http://api.distil-app-dev.com:3000/api/accounts/:id`
The method is `DELETE`.
There is no body.

To Create a Domain with Multiple Attributes
-------------------------------------------
The important item to remember is to use '&' within the data string.

```bash
$ curl -i -X POST -d 'domain[hostname]=www.distilnetworks.com&domain[origin_ip_address]=123.456.789.012' http://api.distil-app-dev.com:3000/domains
```


JSON is the content type.  JSON data is used in the body

Content Type :
  application/json

???Body (assuming not in cURL):
    json data in Body

   sample json body

    {
     "hostname" : "www.samplebody.com",
     "account_id" : "2"
    }


TROUBLESHOOTING
===============

pry-rails gem was installed

annotate was installed
