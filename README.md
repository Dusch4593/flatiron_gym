![image of site welcome page](./public/images/welcome_page.png)
This is a simple Sinatra web app that lets a user log in to(or sign up for)  
their account and create exercise routines.

This project follows the MVC pattern and uses ActiveRecord to map the models  
to the database. It also involves user authentication by requiring a password  
and a unique email address.


# Installation
1. Clone and fork this repo to your local machine.
2. Run `bundle install` to ensure you have the necessary dependencies to use the site.
3. Run `rake db:migrate` to start up the database.
4. Run `shotgun` to start the server (or `bundle exec shotgun` if you run into an error).


# Usage
Users can have many Exercises. In turn, Exercises belong to Users. A user can
create, view, edit and delete exercises.

Users will not have access to the Exercises of another User. This is an effort
to prevent accidental overwriting of data or nefarious activity.

# Contributing
Any and all suggesting are welcome! Please feel free to [submit a pull-request](https://github.com/Dusch4593/flatiron_gym/pulls)  
or [report a problem](https://github.com/Dusch4593/flatiron_gym/issues) in the "Issues" tab.

# License
This app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT)
