# hashtagpresident.com

The rails app.

# Running sprout-web

On your local machine, to serve the site use:
To start a server locally, make sure pg is running then run the server:
```
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
export $(cat .env)
rails server
```

--
# Setup

To create the test database
```
createdb president_development
```


# Updating candidates from the google doc
```
heroku run rake import:import_json 
```