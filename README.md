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

![Alt](/Study-Storm.jpg "Title")

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


![Alt](/Userdiagram.png "Titlee")
