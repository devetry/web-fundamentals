---
title: "Get It Done! Part 5: User Model"
currentMenu: videos
---

## Important Note:

### This series of videos uses `MAMP`, `PHPMyAdmin`, and `MySQL`.  **WE ARE NOT USING THESE TOOLS.** Instead we are using `TablePlus` and `Sqlite3`.

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/LWnYwdvImCk?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this set of lessons we learn how to set up user accounts in our application, and then set up relationships between users and their tasks. Be sure to code along with this video as we start that process by making the following changes: 

- Add 2 new templates. You can reuse (with some modifications) the template for the index page that you created in the [User Signup Assignment](../../../assignments/user-signup/) in order to create the `login.html` and `register.html` files you will need for this assignment.

- Create basic handlers for those routes in `main.py`.

- Create a model class for `User` and add it to the database. 


## Code

View the [final code](https://github.com/devetrycodeforward/get-it-done/tree/589129a557d09b3789033867811af70a5687b464) for this lesson.

## References

- [A Simple Model (Flask-SQLAlchemy)](http://flask-sqlalchemy.pocoo.org/2.1/models/#simple-example)
