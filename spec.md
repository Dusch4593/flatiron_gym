# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app --> `ApplicationController` inherits from `Sinatra::Base`
- [x] Use ActiveRecord for storing information in a database --> Using `activerecord` gem
- [x] Include more than one model class (e.g. User & Exercise) --> `User`, `Routine` and `Exercise` are my models
- [x] Include at least one has_many relationship on your User model (e.g. User has_many :routines) --> associations established in model files
- [x] Include at least one belongs_to relationship on another model (e.g. Routine belongs_to :user) --> associations established in model files
- [x] Include user accounts with unique login attribute (username or email) --> email validated based on `uniqueness`
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying --> `Routine` and `Exercise` have CRUD functionality
- [x] Ensure that users can't modify content created by other users --> using helpers `current_user` and `is_logged_in?`
- [x] Include user input validations --> combination of checks in the controllers and `required` attribute in forms
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code --> Please see `READEME.md`

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
