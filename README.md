# Pupiloo DB

## Initial setup
### Requirements
You need to have installed:

* PostgreSQL >= 9.5
* PostGIS extension
For more information about installing postgis read this

### DB and user creation
Access to your local DB with the root (postgres) user and execute:

```
create user operational with password 'operational';
create database operational;
grant all privileges on database operational to operational;
alter role operational superuser;
```

### Schema evolution manager setup
With ruby gems, install the schema-evolution-manager:

```
gem install schema-evolution-manager
```

And finally, update your DB. It will answer for the password, i.e., operational:

```
./local.rb
```

It's done, check you have all the expected tables in your local DB.