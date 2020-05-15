# Simple Blog

The blog allows authorized users to create new comments, update, delete posts and comments using simple http authentication, and no authenticated users to view blogs and comments, and create comments only. The webapp uses Ruby On Rails framework, PostgreSQL for the Model, rspec tests and it's a MVC demonstration. A hosted version is available at:

```
  https://nameless-chamber-19865.herokuapp.com/
```

* Ruby version

  ```
  2.3.3p222
  ```

* System dependencies
  
  PostgreSQL, Git, GitBash (optional)

* Database initialization
  for local migration
  ```
  rake db:migrate
  ```
  for deploy migration
  ```
  heroku run rake db:migrate
  ```
* How to run the test suite
  ```
  $ rspec
  ```
  to run the server locally run:
  ```
  $ rails server
  ```
  then open a browser window at http://localhost:3000

* Deployment instructions

  Once registered, and logged in with heroku proceed to push git repo to heroku:
  ```
  git push heroku master
  ```
  migrate database:
  ```
  heroku run rake db:migrate
  ```
  start the web process:
  ```
  heroku ps:scale web=1
  ```
  verify that is running with no errors:
  ```
  heroku ps
  ```
  finally, run 
  ```
  heroku open
  ```
  which will open a browser window with the deployed app.

