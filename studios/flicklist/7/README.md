---
title: 'Studio: FlickList 7'
currentMenu: studios
---

Today we'll add *Users* to our application, and allow them to log in, log out, and create accounts. We'll learn how to store state in a user's session.  We'll learn about *flash messages*, which let us overlay messages onto the next page the user visits.

You are encouraged to code along, which, as usual, you can do by checking out the `walkthrough7` branch.


## Walkthrough

Thus far, our web app does not have a concept of user accounts built in. As a result, there is only one "communal" movie list, and all the users who visit our site work "collaboratively" on that list. That's kind of cool, maybe, but our goal is a site where each user manages her own list, without interference from other users.

The goal today, at a high level, is to implement the existence of user accounts and registration, and ensure that users cannot see the main pages of the site unless they are logged in.

### Before We Begin: Update the Code to use SQLite3 Instead of MySQL

- Open up the flicklist project in VS Code
- Open the `main.py` file
- Below the line `import cgi` at the top of the file, **ADD** the following line:
```python
import os
```
- **REPLACE** this line:
```python
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://flicklist:MyNewPass@localhost:8889/flicklist'
```
- With these two lines:
```python
project_dir = os.path.dirname(os.path.abspath(__file__))
```
```python
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///{}".format(os.path.join(project_dir, "flicklist.db"))
```

More specifically, in today's walkthough we will update our codebase with the following additions:

- A `User` class to represent and save users in our database.

- New routes and methods: `register` and `logout`.

- A new template for the `register` page.

- Our `base` template will display either the user's email or links to login and register.

- A 'login wall' that monitors requests of unlogged-in users, and prompts them to create an account if they're not logged in.

- Our `base` template will display flash messages, so that we can tell the user things like "that is not a valid email address".


## Studio

Right now the only way to login is as a side-effect of creating a new account. It'd be neat if once users created accounts and logged out, they could log back in using their existing email and password, so we'll implement that in this studio. We'll also add validation and authentication for the login process.

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio7`.

### Before you begin: Update the Code to use SQLite3 Instead of MySQL

- Open up the flicklist project in VS Code
- Open the `main.py` file
- Below the line `import cgi` at the top of the file, **ADD** the following line:
```python
import os
```
- **REPLACE** this line:
```python
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://flicklist:MyNewPass@localhost:8889/flicklist'
```
- With these two lines:
```python
project_dir = os.path.dirname(os.path.abspath(__file__))
```
```python
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///{}".format(os.path.join(project_dir, "flicklist.db"))
```

### Before you begin: create the 'user' DB table locally

```nohighlight
(flicklist) $ python
>>> from main import db, User
...
>>> db.create_all()
...
>>> db.session.commit()
User.query.all()
...
[]

```

### Your Tasks

1. When a user tries to create an account, but supplies different 'password' and 'verify' fields, redirect them back to `/register` and flash them a message about why their attempt to create an account failed.

2. Log out, and see what happens when you try to create a user that already exists. This happens because we passed the `unique=True` keyword param to the `email = db.Column()` invocation in the `User` class. When we wear our DB Admin hats, we're happy to get this error, but when we wear our UX designer hats, we want something friendlier. Before creating an account, search the database for an existing account with that email. If it exists already, redirect them back to `/register` and tell them why their account creation failed.

3. Add a new route for `/login`, that responds to GET and renders a `login.html` template; it also needs to respond to POST requests and provide error messages for failed login attempts or redirect to the main page if it is a successful login.

4. Create the `login.html` template, with form fields for email and password.

5. Test out your new route - one problem you will notice is that you get redirected to the `register.html` page. Change the login wall to allow this route through.


## Retrospective

We've created users and managed the login and logout process. But the `User` model doesn't relate at all to our `Movie` model. In the next studio, we'll cross the streams and store movies on a per-user basis.

[get-the-code]: ../getting-the-code/
