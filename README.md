Penguin BTS
===========

Local deployment:
-----------------
* install rails http://installrails.com/
* add device public key to your bitbucket account
* cat ~/.ssh/id_rsa.pub in git bash to see your RSA key
* git remote add origin git@bitbucket:darkandchoco/elmc.git (add your bitbucket link)
* git pull origin master
* bundle install
* bundle exec rake db:migrate
* rails server

Heroku deployment:
------------------
* heroku login
* heroku keys:add
* heroku create
* git push heroku master
* heroku run rake db:migrate

* heroku pg:reset DATABASE
* heroku run rake db:migrate
* heroku run rake db:seed
* heroku restart

Merging branches:
-----------------
* git add -A
* git commit -m
* git checkout master
* git merge static-pages

Heroku remote removal:
----------------------
* git remote rm heroku
* git remote add heroku git@heroku.com:coastguard-quiz.git

DB migration and rollback:
--------------------------
* bundle exec rake db:migrate
* bundle exec rake db:rollback

Manual test execution:
----------------------
* bundle exec rake test
* bundle exec rake test TEST=test/integration/users_login_test.rb \ TESTOPTS="--name test_login_with_valid_information"

Automates tests:
----------------
* bundle exec guard init
* bundle exec guard

Rails Generate:
------
* rails generate controller StaticPages home help
* rails generate scaffold User name:string email:string
* rails destroy controller StaticPages home help
* rails destroy model User
* rails generate integration_test layout_test

Notes:
------
* URL -> routes -> controller -> model -> view
