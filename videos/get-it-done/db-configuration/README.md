---
title: "Get It Done! Part 2: Database Configuration"
currentMenu: videos
---

## Important Note:

### This series of videos uses `MAMP`, `PHPMyAdmin`, and `MySQL`.  **WE ARE NOT USING THESE TOOLS.** Instead we are using `TablePlus` and `Sqlite3`.

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/-bvlj_3Im6s?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

If you don't already have `flask-env` activated, activate it now. Then run:

```bash
conda install -c conda-forge flask-sqlalchemy
```

If instead you are using `pipenv` you may run:

```bash
pipenv install flask-sqlalchemy
```

Or if you prefer installing the dependency globally:

```bash
pip install flask-sqlalchemy
```

After this installation completes, amend your `main.py` by adding the following six lines:

```python
import os
from flask_sqlalchemy import SQLAlchemy 
```

```python
project_dir = os.path.dirname(os.path.abspath(__file__))
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///{}".format(os.path.join(project_dir, "get-it-done.db"))
```


```python
app.config['SQLALCHEMY_ECHO'] = True
```

```python
db = SQLAlchemy(app)
```

Next we'll continue modifying `main.py` and create a persistent class for database data: 

```python
class Task(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120))

    def __init__(self, name):
        self.name = name
```

Be sure to shield `app.run` by enclosing it in an `if` condition:

```python
if __name__ == '__main__':
    app.run()
```

Back in the terminal, start a python shell by running the command `python` (or `python3` depending on your installation). Then import `db` and create the tables:

```nohighlight
> from main import db,Task
> db.create_all()
```

Now run the following commands one at a time to add data to the database:

```nohighlight
>>> new_task = Task('finish ORM lesson 2')
>>> db.session.add(new_task)
>>> another_task = Task('post lesson video')
>>> db.session.add(another_task)
>>> db.session.commit()
```

To get data from the database, run the following:
```nohighlight
>>> tasks = Task.query.all()
>>> tasks[0].name
```

## Code

View the [final code](https://github.com/devetrycodeforward/get-it-done/tree/9b5483968e38d24b16a281e7a82a176446454ea0) for this lesson.

## References

- [SQLAlchemy](http://www.sqlalchemy.org/)
- [Flask SQLAlchemy](http://flask-sqlalchemy.pocoo.org/2.1/)
