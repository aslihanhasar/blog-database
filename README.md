# BLOG DATABASE

### This project includes the design of a simple blog database and various queries that can be performed on this database. The database consists of four tables: users, posts, categories, and comments.

---

## PROJECT DETAILS

* The blog database should include the following tables:

users table:

* user_id (PRIMARY KEY): Unique identifier for each user.
* username (UNIQUE, NOT NULL): User's username, must be unique and not empty.
* email (UNIQUE, NOT NULL): User's email address, must be unique and not empty.
* creation_date: Date and time when the user was created.
* is_active: Boolean value indicating if the user is active.
  
categories table:

* category_id (PRIMARY KEY): Unique identifier for each category.
* name (UNIQUE, NOT NULL): Name of the category, must be unique and not empty.
* creation_date: Date and time when the category was created.

posts table:

* post_id (PRIMARY KEY): Unique identifier for each post.
* user_id (FOREIGN KEY): References the user_id in the users table.
* category_id (FOREIGN KEY): References the category_id in the categories table.
* title (NOT NULL): Title of the post, limited to 50 characters.
* content: Content of the post.
* view_count: Number of views for the post, defaults to 0 if not specified.
creation_date: Date and time when the post was created.
* is_published: Boolean value indicating if the post is published.


comments table:

* comment_id (PRIMARY KEY): Unique identifier for each comment.
* post_id (FOREIGN KEY): References the post_id in the posts table.
* user_id (FOREIGN KEY): References the user_id in the users table (optional).
* comment (NOT NULL): Content of the comment.
* creation_date: Date and time when the comment was created.
* is_confirmed: Boolean value indicating if the comment is confirmed.

---

## Installation

Import the project classes.
> [https://github.com/aslihanhasar/blog-database.git](https://github.com/aslihanhasar/blog-database.git)

---

## Usage

1. Create the Database:
  
  *  First, you need to create the blog database in your preferred database management system.
  * Use the provided table structure and constraints from the README to create the users, posts, categories, and comments tables.
  
  
2. Populate the Database:
  * Populate them with sample data as described in the README. Ensure that each table has the minimum required data:
  * At least 2 users in the users table.
  * At least 50 posts in the posts table with different categories, view counts, and titles.
  * At least 3 categories in the categories table.
  * At least 250 comments in the comments table, belonging to different posts and users.
  * Make sure to assign unique creation_date values for each record.


3. Perform Queries:
   
  * With the database and data in place, you can now run the provided SQL queries to perform various operations on the blog data.

---

## Author

**Aslıhan Hasar**

* GitHub: [aslihanhasar](https://github.com/aslihanhasar)
* LinkedIn: [aslıhanhasar](https://www.linkedin.com/in/asl%C4%B1hanhasar
  )

---

## Contributing

Contributions, issues, and feature requests are welcome.

---

## License

[MIT](https://choosealicense.com/licenses/mit/)

---

## Show Your Suport

Give me a &#11088; if you like the project.