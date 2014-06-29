INTRODUCTION
============

This project creates a RESTful API that can be used by any number of different clients.  In its current form, the most effective way to consume this API is via cURL since cURL allows for an easy POST request, although one can install a browser extension to handle POST requests, or simply handle such requests through the console.

The API will be used to manage a list of accounts and domains. Each account can have many domains.  A single domain can only belong to one account.

The API will have its own accessible subdomain, `api.distil-app-dev.com` when in production. In development the port will be 3000, `api.distil-app-dev.com:3000`

USE
===

The user can, through the API, enter a hostname.  Then, the API will find the associated ip address of that hostname through an asynchronous request and update the database table accordingly.

Note: The IP addresses of many requested hostnames are dynamic, not static.

INSTALLATION
============

`sudo [text editor name] /etc/hosts`

Ensure that your `/etc/hosts` file is set up to allow for the api subdomain.
```bash
127.0.0.1 distil-app-dev.com
127.0.0.1 api.distil-app-dev.com
```

Install the `dnsruby` gem.

Install the `sidekiq` gem.  Make sure to `bundle`.

The `sidekiq` gem uses `redis` to manage its job queue.  `redis` must be installed.
```bash
brew install redis
```

Open two separate terminal windows `cd` to the app's root directory.  

In the first terminal run `redis-server`.
In the second terminal run `bundle exec sidekiq`

The queueing environment is now properly set up.

DATABASE SETUP
--------------

The database is PostgreSQL.  On the development machine set up the database environment.

1. `bundle exec rake db:create`

2. `bundle exec rake db:migrate`

3. `bundle exec rake db:seed` if desired.


CONSUMING THE API
=================

The API returns JSON.

Remember, the port number is still required to access the new localhost URL.
`distil-app-dev.com:3000`

From the terminal, cURL can be used to access the API and prepare RESTful requests.
The -i flag includes the http header in the output if one so chooses.  
The -X flag specifies the method.
The -d flag specifies the data being sent as a string with the request for a POST request.

To Create an Account (using cURL)
---------------------------------
For example, to issue a post request to the accounts table using the name attribute, type the following command in the terminal.
```bash
$ curl -i -X POST -d 'account[name]=my_account_name' http://api.distil-app-dev.com:3000/accounts
```

To Create an Account (using a browser or developer tools)
--------------------------------------
The URL to use is `http://api.distil-app-dev.com:3000/accounts`
The method is `POST`.
The body of the method is json.

To Update an Account (using cURL)
---------------------------------
Using the terminal,

```bash
$ curl -i -X PATCH -d 'account[name]=my_other_account_name' http://api.distil-app-dev.com:3000/accounts/:id
```

To Update an Account (using a browser or developer tools)
---------------------------------
The URL to use  `http://api.distil-app-dev.com:3000/accounts/:id`
The method is `PATCH`.
The body of the method is json.

To Get an Account (using cURL)
------------------------------
For example, issue a get request for account with id of 2, type the following command in the terminal.
```bash
$ curl -i http://api.distil-app-dev.com:3000/accounts/2
```

To Get an Account (using a browser or developer tools)
------------------------------
The URL to use is `http://api.distil-app-dev.com:3000/accounts/:id`
The method is `GET`.
There is no body.

To Delete an Account (with cURL)
--------------------------------
For example, to delete an account with id of 3, type one of the following command in the terminal.
```bash
$ curl -i -X DELETE http://api.distil-app-dev.com:3000/accounts/3
$ curl --request DELETE http://api.distil-app-dev.com:3000/accounts/3
```

To Delete an Account (using a browser or developer tools)
-----------------------------------------------
The URL to use is `http://api.distil-app-dev.com:3000/accounts/:id`
The method is `DELETE`.
There is no body.

To Create a Domain with Multiple Attributes
-------------------------------------------
The important item to remember is to use '&' within the data string.

```bash
$ curl -i -X POST -d 'domain[hostname]=www.distilnetworks.com&domain[origin_ip_address]=123.456.789.012' http://api.distil-app-dev.com:3000/domains
```

curl -i -X POST -d 'domain[hostname]=www.roku.com' http://api.distil-app-dev.com:3000/domains

TESTING AND TROUBLESHOOTING
===========================

The following four gems were installed to support testing and troubleshooting.

1. rspec-rails;
2. shoulda-matchers;
3. pry-rails; and
4. annotate.

ISSUES
======

I have been unable to simultaneously allow validations while also asynchronously requesting the ip addresses.  With `validates :origin_ip_address, presence: true` commented out, the API asynchronously requests and updates ip addresses of the hostname.  However, if `validates :origin_ip_address, presence: true` is on, the API cannot asynchronously request and update the ip address of the hostname.

Further time will be required to resolve this issue.
