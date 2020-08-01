# razzle-ussd

## About

This is a USSD Application meant to handle sessions initiated by Africa's Talking's gateway.

mykeekapu ussd integration

** Objectives/Requirements (Lighly assumes all operations will be handled by the ussd platform)

1. User registration (Organic)  - new users on the platform, key KYC info to collect:
	- Phone number (unique identifier from network, initially, might be a national id-phone number combo later)
	- National ID number
	- Name (might be retrieved from a third party provider?)
	- What else?
2. User registration (referal/incentivized) - new users, with a referal code?
	- Same as 1. above
	- Referal code (could already be part of ussd code shared by an existing user)
3. Catalog browsing
	- Assumption is that the catalog data will be retreived from an existing platform (or )
	- If items are an 'unwieldy' number, categorization might help with improved navigation on the ussd menu
4. Order placement
	- The ussd might only allow one order per session (assumption). The user will select an item, include the quantity, get a summary of the transaction and confirm completion
5. Payment
	(This is where things get interesting)

ToDo 
How to handle users pre-registered on a different platform?
Sync users registered on ussd platform with primary platform
Technical requirements spec


################ Others -- New Rails App Step by Step
1. rails new razzle-ussd -T -d postgresql
2. Database name, username/pwd
3. RSpec gem and initialization
4. ERD Gem and configuration
5. Annotate gem

### Setup

#### Install Ruby

The first step is to install dependencies for Ruby on Rails

```
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
```
Install `rbenv`

```
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
```
Then install `ruby-build`

```

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.7.0
rbenv global 2.7.0
ruby -v
```

Finally

```
gem install bundler
```

#### Install Rails

```
gem install rails -v 6.0.2.1

rbenv rehash
```

#### Setting Up PostgreSQL

Add a new repo to get the most recent version of pg (optional)

```
sudo apt install postgresql-11 libpq-dev
```
Create and user and set an optional password

```
sudo -u postgres createuser frederick -s

# If you would like to set a password for the user, you can do the following
sudo -u postgres psql
postgres=# \password frederick

```

##### The below are for creating a new rails app

```
#### If you want to use Postgres
# Note that this will expect a postgres user with the same username
# as your app, you may need to edit config/database.yml to match the
# user you created earlier
rails new myapp -d postgresql

# Move into the application directory
cd myapp

# If you setup MySQL or Postgres with a username/password, modify the
# config/database.yml file to contain the username/password that you specified

# Create the database
rake db:create

#You might encouter a db creation permissions related issue at this point, do the following:
sudo -u postgres psql
postgres=# alter user frederick createdb;

rails db:migrate

rails server
```

### Misc

In the event you need to drop and recreate the db but access is disabled due to other users, force restart postgres `sudo systemctl restart postgresql`

### Deployment to heroku

For some strange reason, one of the dev/test groups gems, rspec, plus swagger etc had issues living out of thier groups so they had to be moved to production, no biggie but not advised.

Now, setting up things on heroku should be quite straight forward -- get account, link to github and project etc.

You'll need to set up the heroku CLI on your development machine, the guide is pretty clear on the steps. If you choose to deploy your app automatically for certain branches, easy. But for the first deployment, you need to perfom your db:migrate and db:seed tasks from the heroku CLI: `heroku run db:migrate -a your-app`

How to reset PG Database on Heroku?

1. `heroku restart`
2. `heroku pg:reset DATABASE (no need to change the DATABASE)`
3. `heroku run rake db:migrate`
4. `heroku run rake db:seed (if you have seed)`

One liner

`heroku restart -a denali-medexam; heroku pg:reset DATABASE --confirm denali-medexam denali-medexam; heroku run rake db:migrate -a denali-medexam`

###

After deployment, user sign up is currently open, however, to gain full control, use the rails console to assign your user the admin role. `User.find(:id, email whatever) then x.add_role :admin`

### 

### Some Postgresql tips/notes
To view database size:
```
psql dbname username
SELECT pg_size_pretty( pg_database_size('dbname') );
SELECT pg_size_pretty( pg_total_relation_size('tablename') );
```
Or on heroku: `heroku pg:info -a denali-medexam`

Download and backup database:
```
heroku pg:backups:capture
heroku pg:backups:download
```
Use an external database on heroku, in this case, one hosted on ElephantSQL, which is a wrapper around common/larger Cloud Computing providers, make sure to destroy the current hobby-dev database:
```
heroku config:set DATABASE_URL=postgres://hnbnqwbq:j2WKzfMn39TmujIGRweupznr2H_cTzr9@rogue.db.elephantsql.com:5432/hnbnqwbq -a denali-medexam
```
https://gorails.com/deploy/ubuntu/18.04
