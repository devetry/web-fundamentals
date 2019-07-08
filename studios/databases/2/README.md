---
title: 'Studio: Databases Part 2'
currentMenu: studios
---

## Walkthrough

#### A note about TablePlus
It's a tool to help you interact with your SQL Database that is a little more user-friendly than your command line.  Don't forget to utilize it! 

### Database Setup

Let's start by creating a new database called `movie-buff.db`.  For this example, I'll be placing the file on my desktop.

```bash
cd Desktop
sqlite3 movie-buff.db
```

After running that command, you should see the following output:

```bash
sqlite>
```

Turn on `Foreign Key Constraints` for your new Database:
```sql
PRAGMA foreign_keys = ON;
```

### Import Tables From `.sql`

Now that we have our database created, we can actually `seed` (populate) our database, using a `.sql` file!

Now, download this SQL file: [movie-buff.lite.sql](downloads/movie-buff.lite.sql).

Open up this file in vscode -- see? SQL is a language like python! (well, not EXACTLY like python, but you can save a file and run it against a database instead of doing everything manually! neat!)

To run this code in Sqlite3, run:

```bash
.read path/to/file.sql
```
#### STOP HERE and make sure your setup looks ok. Play around a bit if you would like! Ask any questions.

After successfully running the file, your database should now have 4 tables, `directors`, `movies`, `viewers`, and `viewings`.

To verify this try running `.tables`.  Or try opening your file using **TablePlus**.


## Studio

Sarah has a very eclectic taste in movies, but her friends admire it. Over the years, they've borrowed a lot of her DVDs, and she's set up a database to keep track of who has watched what so that she can make better recommendations for them based on what they've seen so far.

There are four tables in the `movie-buff` database: `movies`, `directors`, `viewers`, and `viewings`.

There is one table Sarah made that might not seem intuitive to have created - the 'viewings' table. One way to check out whats going on with this table is to run 

```sql
.schema viewings
``` 

The purpose of this table is to keep track of "who watched what when". The *who* is the `viewer_id`, which is a foreign key that references the `viewer_id` in the `viewers` table. The *what* is the `movie_id` which is a foreign key that references the `movie_id` in the `movies` table. And the *when* is of course the `date_viewed` column with a `date` data type. Each viewing of a movie by one of Sarah's friends is captured as a unique record.

This kind of table is very common in relational database design. It has many virtues including that it clearly links the `movies` and `viewers` table together and it makes the database more maintainable. For instance, you might have chosen to make a `viewing` table where you actually list the movie title and the name of the viewer. But if you did that then anytime some of that information changes - say a friend gets married and changes last names - you would now have to update the name of the viewer in *both* the `viewers` table *and* the `viewings` table. With this design, any updates you make to either the `movies` or `viewers` table will be reflected automatically in the results from queries on the `viewings` table.

Review this lesson from [Khan Academy](https://www.khanacademy.org/computing/computer-programming/sql/relational-queries-in-sql/a/splitting-data-into-related-tables) for a more in-depth explanation of why we break tables up this way.

If you get stuck on any of the tasks below, you can review lessons in [Khan Academy](https://www.khanacademy.org/computing/computer-programming/sql) or [w3schools](https://www.w3schools.com/sql/default.asp) to get ideas and remind yourself of the proper syntax.

### Your Task:

Sarah created these tables and inserted all the data into them, but she needs your help to run some queries. 
Lets make sure its working -- As an example, say Sarah wants to know the first and last names of any of her friends who borrowed one of her movies before 2010.

We know we'll want to use the `viewings` table, since that has the dates of when people have viewed her DVDs as well as their ids. And we know we want to use the `viewers` table since that has the first and last names of her friends. Since we want data from two tables, we know we'll likely need to use a `join`. We also know that the column in common between the two tables is the `viewer_id` column, so that will be what we join on. Our SQL statement will be:

```sql
SELECT DISTINCT viewers.first, viewers.last
FROM viewers
JOIN viewings
ON viewers.viewer_id = viewings.viewer_id
WHERE viewings.date_viewed < '2010-01-01'
```



IF you see data, AWESOME! start helping our imaginary friend below. If you don't see data, *STOP HERE*. Get some help from a classmate or instructor.

Here are some of the things Sarah needs your help with:

1. Find out which countries the directors in her collection are from (and make sure your result set only lists each country only once).

2. Who are the French directors in her database?

3. What is the date of the first time someone viewed one of Sarah's movies?

4. How many movies in her collection were directed by people born in the USA?

5. What are the titles of the movies in her collection that were directed by Akira Kurosawa?

6. How many times has the movie "Talk to Me" been viewed?

7. When was the last time someone viewed one of her movies?

8. What is the id of the last-viewed movie?

9. What is the title of the first movie she loaned to a friend for viewing?

10. What is the first and last name of the person who viewed the last-viewed movie?


#### Bonus Missions

11. Write the SQL query to display the DVDs that others have watched in order of most viewed to least viewed. What's the title of the most-viewed movie(s) in Sarah's collection?

12. Find the email of everyone who has watched "The Tango Lesson", so Sarah can email them and ask what they thought of it.

13. Sarah is hosting a Kurosawa film festival soon and needs an email list to send out invites. What are the full names and emails of all her friends who have watched any movie by Akira Kurosawa?
