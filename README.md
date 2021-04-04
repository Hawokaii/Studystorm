# Studystorm
Project aimed to automize course management

### Abstract
As you know, the global coronavirus pandemic in 2020 has affected almost all aspects, the lives of almost all people in the world. Most of the completely disconnected structures, economies and systems were affected. However, even such a disaster, as it turned out, had a positive effect on some areas of activity. Among them, distance learning and online courses in particular have become very popular. The idea is to identify the impact of the pandemic on people's learning, and their activity in the field of self-study.
Key terms: Distance learning, Online courses, coronavirus pandemic, impact on learning.

### Introduction
The sites where such training materials mostly exist were not ready for such a heavy load. But when we managed to cope with the load, most of the sites provided almost free access to the courses. Somewhere it was completely free, and somewhere not without the help of the state. For example, Suleyman Demirel University financed absolutely free access to all courses on the infamous Coursera platform. We decided to find out how much the local exchange market in Kazakhstan has grown and its prospects for further growth.

### Aim and objectives of research
Aim: The main goal of the project is to track changes in the relevance and relevance of the consumed educational content. Showcase the changes in commercial training courses.


## General questions

 1. How can a user differentiate a good course from a bad one? 
 2. How the user will be able to assess the relevance of the course?
 3. What is the essence of the project?
 4. What is the target audience of the project?
 5. How will the user assess the complexity of the course?
 6. How can the user estimate the duration of the course?
 7. What course options are offered in the project?
 8. What information can a user get about a specific course?
 9. How are courses filtered?
 10. How can a user track only paid / free courses?
 11. What problem does the project solve?
 12. What does the project offer to its users?
 13. How is the project supplemented with courses?
 14. Are there any analogues of the project in Kazakhstan?
 15. How can a user find a specific course?


## Data Tables' Description



### Course_Description
Overall description of the courses

* course_id int NOT NULL PRIMARY_KEY
* subject VARCHAR2(100) NOT NULL FOREIGN KEY 
* content_duration float(50) NOT NULL
* published_timestamp VARCHAR2(100) NOT NULL
* level VARCHAR2(50) NOT NULL

### Course_Num_Stats
Number statistics of the given courses. Helps to track and sort by ratings and etc.

* course_id int NOT NULL PRIMARY_KEY
* num_subcribers int NOT NULL
* num_reviews int NOT NULL
* num_lectures int NOT NULL

### Course_Price

* course_id int NOT NULL PRIMARY_KEY
* is_paid boolean NOT NULL
* price float NOT NULL


### Course_URL

* course_id int NOT NULL PRIMARY_KEY
* subject VARCHAR2(100) NOT NULL
* course_title VARCHAR2(100)
* url VARCHAR2(300)


![Alt](/StudyStorm-UseCase-UML.png "Titlee")


## Data modeling and database design.
### ER Diagram
For reliable and correct relationships between tables, we rendered the ER data models using the draw.io service. The ER diagram can be found in the Studystorm-ER.png file


![Alt](/Studystorm-ER.png "Titlee")
<!--![Alt](/Study-Storm.jpg "Title")-->


### DDL

#### You can familiarize yourself with the creation of current tables and relationships in the Studystorm-DDL-queries.sql file.

[DDL (Studystorm-DDL-queries)](https://github.com/Hawokaii/Studystorm/blob/main/Studystorm-DDL-queries.sql)

We use primarily a JSON format because data collected from the database exists only during a session, but we remember that hypertext does not need to be HTML (or XML or JSON) on a browser.
In order to build our resource we use a stack of technologies such as Node.js, Express, and OracleDB. OracleDB is required in order to maintain connection to the Oracle Database through server, which is accessible with assistance of Instant Client extension, using Oracle account as a system database administrator. It is performed for security thoughts upon stored data. Inside its configures we created a function that returns a table, or Error, and as a parameter it takes SQL query, options (how our object will look like on callback), and returning function. We also made our connection expirable, so it will shut down after a short transaction. 


### DML

Using data taken as a csv and .xlsx file, we implemented DML-scripts to easly integrate data.
[DDL (Studystorm-DML-queries)](https://github.com/Hawokaii/Studystorm/blob/main/Studystorm-DML-data-load.sql)


Express + BodyParser are served inside the backend application in order to use required OracleDB lib, invoke functions, and process queries with following security measurements.

![изображение](https://user-images.githubusercontent.com/49223543/110213643-0dce0b00-7ecb-11eb-93f7-31e1e45debdb.png)

## User-interface implementation and connection 
### The connection

After that data is imported to SQL Developer, and “node oracle.js” is launched.
Then in the Command prompt appears notifications about fetching the data, other manipulations. And any Oracle errors will appear in the Command prompt.

![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/step1.PNG)
Here you can see the site.
![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/step2.PNG)

We use primarily a JSON format because data collected from the database exists only during a session, but we remember that hypertext does not need to be HTML (or XML or JSON) on a browser.
In order to build our resource we use a stack of technologies such as Node.js, Express, and OracleDB. OracleDB is required in order to maintain connection to the Oracle Database through server, which is accessible with assistance of Instant Client extension, using Oracle account as a system database administrator. It is performed for security thoughts upon stored data. Inside its configures we created a function that returns a table, or Error, and as a parameter it takes SQL query, options (how our object will look like on callback), and returning function. We also made our connection expirable, so it will shut down after a short transaction.


Here is the fetched data and notification.
![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/step4.PNG)




### User interface
User interface is created as an admin panel.

![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/UI-screenshots/users.PNG)

You can see the students information, whether they're enrolled or not, courses list and also manipulate with records. For example add new student, delete, enroll, unenroll. 
![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/UI-screenshots/filtering.PNG)
![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/UI-screenshots/sort.PNG)
![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/UI-screenshots/un-enroll.PNG)
![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/UI-screenshots/add.PNG)

Part of the code implementation, which causes triggers or represents the students

```javascript
app.get("/users", (req, res) => {
  dbconfig(
    `SELECT student_id as "id",
		student_key as "key",
		name as "name", date_added as "date",
		gpa as "gpa", category_id as "category",
		enrollments as "enrollments"
		 FROM students
		 ORDER BY 
		 student_id ASC`,
    [],
    function (err, results) {
      if (!err) {
        console.log("fecthed");
        res.send(results.rows);
      } else {
        console.log(err.error);
      }
    }
  );
});
```
Deleting student

```javascript
app.delete(`/users/:id`, (req, res) => {
  var objs = req.url.split("/")[2].replace(/_/g, ",");
  console.log(objs);
  dbconfig(
    `DELETE FROM students
		WHERE student_id in (${objs})`,
    [],
    (err, results) => {
      if (!err) {
        console.log("Deleted a lot");
        res.send(results);
      } else {
        console.log(err.error);
      }
    }
  );
});
```

### Visualizing

As you can see the diagram was made by calculation of the number of records in a month and took the average of records in this month and equate it to the day of the peak set of activity. This way it shows deleting/adding/updating statistics

![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/UI-screenshots/vis-1.png)
![Alt text](https://github.com/Hawokaii/Studystorm/blob/main/UI-screenshots/vis-2.png)



# RA Queries
https://github.com/Hawokaii/Studystorm/tree/main/RA%20queries
