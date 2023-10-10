-- CREATE TABLE QUERIES

CREATE TABLE category (
    category_id VARCHAR(20) PRIMARY KEY,
    category VARCHAR(100)
);

CREATE TABLE course (
    course_id VARCHAR(20) PRIMARY KEY,
    category_id VARCHAR(20),
    course_title VARCHAR(100),
    course_desc TEXT,
    price FLOAT,
    language VARCHAR(45),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE video (
    video_id VARCHAR(20) PRIMARY KEY,
    course_id VARCHAR(20),
    video_name VARCHAR(255),
    length_min FLOAT,
    video_url VARCHAR(100),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE quiz (
    quiz_id VARCHAR(20) PRIMARY KEY,
    course_id VARCHAR(20),
    quiz_type VARCHAR(20),
    difficulty_level VARCHAR(20),
    quiz_url VARCHAR(100),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE instructor (
    instructor_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    signup_date DATE,
    education_level VARCHAR(45),
    occupation VARCHAR(100),
    dob DATE
);

CREATE TABLE course_instructor (
    course_instructor_id VARCHAR(20) PRIMARY KEY,
    course_id VARCHAR(20),
    instructor_id VARCHAR(20),
    creation_date DATE,
    update_date DATE,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE student (
    student_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    signup_date DATE,
    education_level VARCHAR(100),
    program VARCHAR(100),
    occupation VARCHAR(100),
    dob DATE,
    region VARCHAR(45)
);

CREATE TABLE enrollment (
    enrollment_id VARCHAR(20) PRIMARY KEY,
    student_id VARCHAR(20),
    course_id VARCHAR(20),
    completion_date DATE,
    course_rating FLOAT,
    purchase_date DATE,
    time_taken_min FLOAT,
    wishlisted BOOLEAN,
    discount_percent FLOAT,
    prior_proficiency VARCHAR(45),
    final_grade VARCHAR(10),
    course_comments TEXT,
    payment_method VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE student_course_sharing (
    student_course_share_id VARCHAR(20) PRIMARY KEY,
    student_id VARCHAR(20),
    course_id VARCHAR(20),
    shared_date DATE,
    shared_medium VARCHAR(50),
    shared_with_student_id VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (shared_with_student_id) REFERENCES student(student_id)
);

CREATE TABLE gift_card (
    gift_card_id VARCHAR(20) PRIMARY KEY,
    student_id VARCHAR(20),
    gift_amount DECIMAL(6,2),
    gift_source VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE skill (
    Skill_id VARCHAR(20) PRIMARY KEY,
    student_id VARCHAR(20),
    Skill_name VARCHAR(50),
    proficiency VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

-- Category Table
INSERT INTO category (category_id, category)
VALUES ('cat1', 'Programming'),
       ('cat2', 'Design'),
       ('cat3', 'Analytics'),
       ('cat4', 'Marketing'),
       ('cat5', 'Business'),
       ('cat6', 'Music'),
       ('cat7', 'Art'),
       ('cat8', 'Literature'),
       ('cat9', 'Science'),
       ('cat10', 'History');

-- Course Table
INSERT INTO course (course_id, category_id, course_title, course_desc, price, language)
VALUES ('course1', 'cat1', 'Python Basics', 'Intro to Python', 50, 'English'),
       ('course2', 'cat2', 'Design Essentials', 'Learn design principles', 0, 'English'),
       ('course3', 'cat3', 'Data Analytics', 'Deep dive into analytics', 100, 'English'),
       ('course4', 'cat4', 'Marketing 101', 'Fundamentals of marketing', 0, 'English'),
       ('course5', 'cat5', 'Business Strategies', 'Strategies for success', 150, 'English'),
       ('course6', 'cat6', 'Music Theory', 'Basics of Music', 0, 'English'),
       ('course7', 'cat7', 'Sketching 101', 'Learn to sketch', 40, 'English'),
       ('course8', 'cat8', 'Literary Classics', 'Dive into classic literature', 30, 'English'),
       ('course9', 'cat9', 'Introduction to Physics', 'Physics basics', 0, 'English'),
       ('course10', 'cat10', 'World History', 'Learn global history', 80, 'English');

-- Instructor Table
INSERT INTO instructor (instructor_id, first_name, last_name, email, signup_date, education_level, occupation, dob)
VALUES ('instr1', 'John', 'Doe', 'john.doe@email.com', '2021-01-01', 'PhD', 'Data Scientist', '1985-10-10'),
       ('instr2', 'Jane', 'Smith', 'jane.smith@email.com', '2021-02-10', 'Masters', 'Designer', '1990-05-05'),
       ('instr3', 'Alice', 'Johnson', 'alice.j@email.com', '2021-01-15', 'PhD', 'Musician', '1986-12-12'),
       ('instr4', 'Bob', 'Williams', 'bob.w@email.com', '2021-02-20', 'Bachelors', 'Artist', '1991-06-06'),
       ('instr5', 'Charlie', 'Brown', 'charlie.b@email.com', '2021-03-01', 'Masters', 'Writer', '1988-02-02'),
       ('instr6', 'Dave', 'Martin', 'dave.m@email.com', '2021-03-15', 'PhD', 'Scientist', '1992-07-07'),
       ('instr7', 'Eve', 'White', 'eve.white@email.com', '2021-01-20', 'Bachelors', 'Historian', '1987-03-03'),
       ('instr8', 'Frank', 'Taylor', 'frank.t@email.com', '2021-02-05', 'Masters', 'Marketer', '1990-11-11'),
       ('instr9', 'Grace', 'Lee', 'grace.l@email.com', '2021-03-10', 'PhD', 'Programmer', '1989-09-09'),
       ('instr10', 'Hank', 'Moore', 'hank.m@email.com', '2021-01-25', 'Bachelors', 'Businessman', '1993-04-04');

-- Course_Instructor Table (Linking courses and instructors)
INSERT INTO course_instructor (course_instructor_id, course_id, instructor_id, creation_date, update_date)
VALUES ('ci1', 'course1', 'instr1', '2021-01-15', '2021-01-20'),
       ('ci2', 'course2', 'instr2', '2021-02-15', '2021-02-20'),
       ('ci3', 'course3', 'instr1', '2021-01-20', '2021-01-25'),
       ('ci4', 'course4', 'instr2', '2021-02-20', '2021-02-25'),
       ('ci5', 'course5', 'instr3', '2021-01-25', '2021-01-30'),
       ('ci6', 'course6', 'instr4', '2021-02-25', '2021-03-01'),
       ('ci7', 'course7', 'instr5', '2021-01-30', '2021-02-04'),
       ('ci8', 'course8', 'instr6', '2021-03-01', '2021-03-06'),
       ('ci9', 'course9', 'instr7', '2021-02-04', '2021-02-09'),
       ('ci10', 'course10', 'instr8', '2021-03-06', '2021-03-11');

-- Student Table
INSERT INTO student (student_id, first_name, last_name, email, signup_date, education_level, program, occupation, dob, region)
VALUES ('stud1', 'Isaac', 'Newton', 'isaac.n@email.com', '2021-03-01', 'Bachelors', 'Science', 'Scientist', '1995-04-04', 'Europe'),
       ('stud2', 'Julia', 'Roberts', 'julia.r@email.com', '2021-03-10', 'Masters', 'Arts', 'Actress', '1992-03-03', 'North America'),
       ('stud3', 'Kevin', 'Spacey', 'kevin.s@email.com', '2021-03-15', 'PhD', 'Literature', 'Actor', '1990-02-02', 'North America'),
       ('stud4', 'Lucy', 'Liu', 'lucy.l@email.com', '2021-03-20', 'Bachelors', 'Business', 'Businesswoman', '1993-01-01', 'Asia'),
       ('stud5', 'Mike', 'Tyson', 'mike.t@email.com', '2021-03-25', 'Bachelors', 'Sports', 'Boxer', '1988-12-12', 'North America'),
       ('stud6', 'Nina', 'Dobrev', 'nina.d@email.com', '2021-03-30', 'Masters', 'Arts', 'Actress', '1991-11-11', 'Europe'),
       ('stud7', 'Oscar', 'Wilde', 'oscar.w@email.com', '2021-04-01', 'PhD', 'Literature', 'Writer', '1987-10-10', 'Europe'),
       ('stud8', 'Paul', 'Walker', 'paul.w@email.com', '2021-04-05', 'Bachelors', 'Arts', 'Actor', '1989-09-09', 'North America'),
       ('stud9', 'Queen', 'Latifah', 'queen.l@email.com', '2021-04-10', 'Masters', 'Music', 'Singer', '1990-08-08', 'North America'),
       ('stud10', 'Robert', 'Pattinson', 'robert.p@email.com', '2021-04-15', 'Bachelors', 'Arts', 'Actor', '1992-07-07', 'Europe'),
       ('stud11', 'Liam', 'Johnson', 'liam.johnson@email.com', '2021-01-05', 'Masters', 'Business', 'Manager', '1990-08-05', 'North America'),
('stud12', 'Emma', 'Smith', 'emma.smith@email.com', '2021-01-10', 'Masters', 'Engineering', 'Engineer', '1991-09-10', 'Europe');

-- Enrollment Table (Inserting records for enrollments, ensuring some students enroll in both free and paid courses)
INSERT INTO enrollment (enrollment_id, student_id, course_id, completion_date, course_rating, purchase_date, time_taken_min, wishlisted, discount_percent, prior_proficiency, final_grade, course_comments, payment_method)
VALUES ('enrol1', 'stud1', 'course1', NULL, 4.5, '2021-04-01', 300, FALSE, 0, 'Beginner', NULL, 'Good course', 'Credit Card'),
    ('enrol2', 'stud1', 'course2', NULL, 4, '2021-04-05', 250, TRUE, 0, 'Intermediate', NULL, 'Decent course', 'None'),
    ('enrol3', 'stud2', 'course2', '2021-05-10', 3.5, '2021-04-10', 200, FALSE, 10, 'Beginner', 'C+', 'Average course', 'Debit Card'),
    ('enrol4', 'stud2', 'course3', '2021-05-15', 5, '2021-04-15', 400, FALSE, 0, 'Advanced', 'A+', 'Excellent course', 'Credit Card'),
    ('enrol5', 'stud3', 'course4', '2021-05-20', 3, '2021-04-20', 350, TRUE, 0, 'Beginner', 'C', 'Below average course', 'None'),
    ('enrol6', 'stud3', 'course5', '2021-05-25', 4.5, '2021-04-25', 500, FALSE, 5, 'Intermediate', 'B+', 'Good course', 'Credit Card'),
    ('enrol7', 'stud4', 'course6', '2021-05-30', 4.8, '2021-04-30', 450, TRUE, 0, 'Advanced', 'A', 'Very good course', 'None'),
    ('enrol8', 'stud4', 'course7', '2021-06-01', 4.2, '2021-05-01', 300, FALSE, 0, 'Beginner', 'B', 'Decent course', 'Credit Card'),
    ('enrol9', 'stud5', 'course8', '2021-06-05', 3.8, '2021-05-05', 280, FALSE, 10, 'Intermediate', 'C+', 'Average course', 'Debit Card'),
    ('enrol10', 'stud5', 'course9', '2021-06-10', 5, '2021-05-10', 550, TRUE, 0, 'Advanced', 'A+', 'Excellent course', 'Credit Card'),
    ('enrol26', 'stud6', 'course4', '2021-05-05', 4.3, '2021-04-02', 320, FALSE, 0, 'Beginner', 'A-', 'Loved the course', 'Credit Card'),
    ('enrol11', 'stud7', 'course5', '2021-05-08', 4.8, '2021-04-03', 420, TRUE, 10, 'Intermediate', 'A+', 'Fantastic content', 'Debit Card'),
    ('enrol12', 'stud8', 'course6', '2021-05-10', 4.1, '2021-04-08', 290, FALSE, 5, 'Advanced', 'B+', 'Great insights', 'Credit Card'),
    ('enrol13', 'stud9', 'course7', '2021-05-12', 4.4, '2021-04-10', 310, TRUE, 0, 'Beginner', 'A', 'Very enlightening', 'Credit Card'),
    ('enrol14', 'stud10', 'course8', '2021-05-15', 4.5, '2021-04-15', 330, FALSE, 0, 'Intermediate', 'A-', 'Well structured', 'Debit Card'),
    ('enrol15', 'stud1', 'course4', '2021-05-20', 4.2, '2021-04-18', 340, FALSE, 5, 'Advanced', 'B+', 'Very informative', 'Credit Card'),
    ('enrol16', 'stud2', 'course5', '2021-05-22', 4.6, '2021-04-20', 360, TRUE, 10, 'Intermediate', 'A', 'Highly recommend', 'Debit Card'),
    ('enrol17', 'stud3', 'course6', '2021-05-25', 4.0, '2021-04-23', 280, FALSE, 0, 'Beginner', 'B', 'Good course overall', 'Credit Card'),
    ('enrol18', 'stud4', 'course7', '2021-05-28', 4.3, '2021-04-28', 320, TRUE, 5, 'Advanced', 'B+', 'Quite detailed', 'Credit Card'),
    ('enrol19', 'stud5', 'course8', '2021-06-01', 4.4, '2021-05-01', 350, FALSE, 0, 'Intermediate', 'A-', 'Worth every penny', 'Debit Card'),
    ('enrol20', 'stud5', 'course7', '2021-06-01', 4.4, '2021-05-01', 350, FALSE, 0, 'Intermediate', 'A-', 'Worth every penny', 'Debit Card'),
    ('enrol21', 'stud11', 'course1', '2021-05-11', 4.5, '2021-04-01', 330, FALSE, 0, 'Beginner', 'A-', 'Loved the course', 'Credit Card'),
('enrol22', 'stud11', 'course2', '2021-05-12', 4.7, '2021-04-02', 320, FALSE, 0, 'Intermediate', 'A', 'Fantastic content', 'Debit Card'),
('enrol23', 'stud11', 'course3', '2021-05-13', 4.8, '2021-04-03', 350, FALSE, 5, 'Advanced', 'A+', 'Great insights', 'Credit Card'),
('enrol24', 'stud11', 'course4', '2021-05-14', 4.6, '2021-04-04', 340, FALSE, 0, 'Advanced', 'A-', 'Very informative', 'Debit Card'),
('enrol25', 'stud12', 'course5', '2021-02-01', 4.5, '2021-01-01', 320, TRUE, 0, 'Beginner', 'B+', 'Good course overall', 'Credit Card');
-- Video Table
INSERT INTO video (video_id, course_id, video_name, length_min, video_url)
VALUES ('video1', 'course1', 'Python Intro', 120, 'url1'),
    ('video2', 'course1', 'Python Variables', 130, 'url2'),
    ('video3', 'course2', 'Design Basics', 125, 'url3'),
    ('video4', 'course3', 'Analytics with SQL', 75, 'url4'),
    ('video5', 'course3', 'Big Data Analytics', 80, 'url5'),
    ('video6', 'course4', 'Marketing Trends 2021', 40, 'url6'),
    ('video7', 'course5', 'Business Growth Strategies', 55, 'url7'),
    ('video8', 'course6', 'Music Theory for Beginners', 35, 'url8'),
    ('video9', 'course7', 'Sketching Techniques', 30, 'url9'),
    ('video10', 'course8', 'Literature in the 20th Century', 45, 'url10');

-- Quiz Table
INSERT INTO quiz (quiz_id, course_id, quiz_type, difficulty_level, quiz_url)
VALUES ('quiz1', 'course1', 'MCQ', 'Easy', 'qurl1'),
       ('quiz2', 'course1', 'Assignment', 'Medium', 'qurl2'),
       ('quiz3', 'course2', 'MCQ', 'Hard', 'qurl3'),
       ('quiz4', 'course3', 'MCQ', 'Medium', 'qurl4'),
       ('quiz5', 'course4', 'MCQ', 'Easy', 'qurl5'),
       ('quiz6', 'course5', 'Assignment', 'Hard', 'qurl6'),
       ('quiz7', 'course6', 'MCQ', 'Easy', 'qurl7'),
       ('quiz8', 'course7', 'MCQ', 'Medium', 'qurl8'),
       ('quiz9', 'course8', 'Assignment', 'Hard', 'qurl9'),
       ('quiz10', 'course9', 'MCQ', 'Medium', 'qurl10');

-- Gift Card Table
INSERT INTO gift_card (gift_card_id, student_id, gift_amount, gift_source)
VALUES ('gc1', 'stud1', 50, 'Event Prize'),
       ('gc2', 'stud2', 25, 'Referral'),
       ('gc3', 'stud3', 75, 'Birthday Offer'),
       ('gc4', 'stud4', 50, 'Anniversary Offer'),
       ('gc5', 'stud5', 100, 'Festive Offer'),
       ('gc6', 'stud6', 40, 'Special Promotion'),
       ('gc7', 'stud7', 60, 'Referral'),
       ('gc8', 'stud8', 80, 'Loyalty Program'),
       ('gc9', 'stud9', 20, 'Survey Participation'),
       ('gc10', 'stud10', 35, 'First Purchase Offer');

-- Student Course Sharing Table
INSERT INTO student_course_sharing (student_course_share_id, student_id, course_id, shared_date, shared_medium,shared_with_student_id)
VALUES ('share1', 'stud1', 'course1', '2021-03-05', 'Email','stud11'),
       ('share2', 'stud1', 'course2', '2021-03-10', 'Social Media','stud11'),
       ('share3', 'stud2', 'course3', '2021-03-15', 'WhatsApp','stud9'),
       ('share4', 'stud3', 'course4', '2021-03-20', 'SMS','stud5'),
       ('share5', 'stud4', 'course5', '2021-03-25', 'Email','stud2'),
       ('share6', 'stud5', 'course6', '2021-03-30', 'Social Media','stud4'),
       ('share7', 'stud6', 'course7', '2021-04-01', 'WhatsApp','stud6'),
       ('share8', 'stud7', 'course8', '2021-04-05', 'SMS','stud2'),
       ('share9', 'stud8', 'course9', '2021-04-10', 'Email','stud6'),
       ('share10', 'stud9', 'course10', '2021-04-15', 'Social Media','stud2');

-- Skill Table
INSERT INTO skill (Skill_id, student_id, Skill_name, proficiency)
VALUES ('skill1', 'stud1', 'Python', 'Intermediate'),
       ('skill2', 'stud1', 'Design', 'Beginner'),
       ('skill3', 'stud2', 'Marketing', 'Advanced'),
       ('skill4', 'stud2', 'SQL', 'Intermediate'),
       ('skill5', 'stud3', 'Sketching', 'Beginner'),
       ('skill6', 'stud4', 'Music Theory', 'Advanced'),
       ('skill7', 'stud5', 'Business Strategy', 'Intermediate'),
       ('skill8', 'stud6', 'Python', 'Beginner'),
       ('skill9', 'stud7', 'Literature', 'Advanced'),
       ('skill10', 'stud8', 'Physics', 'Intermediate');



-- DML Queries

-- Query 1
-- This SQL query combines results from multiple tables to provide search results for a given keyword.
-- It prioritizes results based on exact matches, then partial matches.
-- It looks for matches in course titles, instructor names, and categories.
SELECT distinct result_title as "Search Results", result_type as "Found in"
FROM (
    -- Find exact match in course titles
    SELECT c.course_title AS result_title, 'Course' AS result_type, 1 AS match_order
    FROM course c
    WHERE c.course_title = 'keyword'
    UNION
    -- Find exact match in instructor names (either first name or last name)
    SELECT CONCAT(i.first_name, ' ', i.last_name) AS result_title, 'Instructor' AS result_type, 2 AS match_order
    FROM instructor i
    WHERE i.first_name = 'keyword' OR i.last_name = 'keyword'
    UNION
    -- Find exact match in categories
    SELECT cat.category AS result_title, 'Category' AS result_type, 3 AS match_order
    FROM category cat
    WHERE cat.category = 'keyword'
    UNION
    -- Find partial match in course titles
    SELECT c.course_title AS result_title, 'Course' AS result_type, 4 AS match_order
    FROM course c
    WHERE c.course_title LIKE '%keyword%'
    UNION
    -- Find partial match in instructor names
    SELECT CONCAT(i.first_name, ' ', i.last_name) AS result_title, 'Instructor' AS result_type, 5 AS match_order
    FROM instructor i
    WHERE i.first_name LIKE '%keyword%' OR i.last_name LIKE '%keyword%'
    UNION
    -- Find partial match in categories
    SELECT cat.category AS result_title, 'Category' AS result_type, 6 AS match_order
    FROM category cat
    WHERE cat.category LIKE '%keyword%'
) AS results
-- Sort results based on match order (exact to partial), and then alphabetically
ORDER BY match_order, result_title
LIMIT 100;  -- Limit the results to 100 entries
 
-- Query 2
-- This SQL query lists courses based on selected filters (like language and category) and a price range.
-- It also sorts the courses based on their price in ascending order.

SELECT course_id, course_title, price
FROM course
-- Join with category to filter based on category
Inner join category on course.category_id = category.category_id
WHERE language = 'selected_language' AND category.category = 'selected_category'
AND price >= 0 AND price<= 100
ORDER BY price ASC;

-- Query 3
-- This SQL query tags courses based on their popularity and the date they were added.
-- The top 3 courses with the highest enrollments are tagged as "Bestseller".
-- Courses added in the last month are tagged as "New".

SELECT course_title as "Course", course_desc as "Description", price, language, tag
FROM (
    SELECT c.course_id, c.course_title, c.course_desc, c.price, c.language, c.category_id,
        CASE
            -- Check if the course is among the top 3 bestsellers
            WHEN c.course_id IN (
                SELECT e.course_id
                FROM (
                    SELECT course_id, COUNT(*) AS enrollment_count
                    FROM enrollment
                    GROUP BY course_id
                    ORDER BY enrollment_count DESC
                    LIMIT 3
                ) e
            ) THEN 'Bestseller'
            -- Check if the course was created in the last month
            WHEN ci.creation_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH) THEN 'New'
            ELSE NULL
        END AS tag
    FROM course c
    -- Join with course_instructor to get the creation_date of the course
    LEFT JOIN course_instructor ci ON c.course_id = ci.course_id
) AS tagged_courses
ORDER BY tag,price;

-- Query 4
-- This SQL query ranks categories based on their popularity among a specific demographic of students.
-- Popularity is determined by the number of enrollments.

select category from
(SELECT
    cat.category,
    -- Count the number of unique students enrolled in each category
    COUNT(DISTINCT s.student_id) AS enrolled_students
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
JOIN category cat ON c.category_id = cat.category_id
WHERE
    s.region = 'Asia' AND
    s.education_level = 'Bachelors' AND
    YEAR(CURDATE()) - YEAR(s.dob) BETWEEN 10 and 50  -- Filter based on age group
GROUP BY cat.category
ORDER BY enrolled_students DESC) A;

-- Query 5
-- This SQL query identifies the top 10 courses in a specific category based on enrollments.
-- The courses are then listed in descending order of enrollments.

SELECT course_title as "Course", course_desc as "Description", price, language
FROM course c
JOIN (
    SELECT
        course_id,
        COUNT(enrollment_id) AS enrollments
    FROM enrollment
    GROUP BY course_id
    ORDER BY enrollments DESC
    LIMIT 10  -- Get the top 10 courses based on enrollments
) AS top_courses ON c.course_id = top_courses.course_id
WHERE c.category_id = 'Programming'
ORDER BY top_courses.enrollments DESC;

-- Query 6
-- This SQL query provides a detailed profile for each instructor, including:
-- - The number of courses they teach
-- - The total number of students enrolled in their courses
-- - The average rating of their courses

SELECT
concat(i.first_name, ' ',i.last_name) as "Instructor", i.email,
i.education_level as "Qualifications", i.occupation as "Job Title",
    COUNT(DISTINCT ci.course_id) AS "Number of Courses",
    COUNT(DISTINCT e.student_id) AS "Total Students",
    ROUND(AVG(e.course_rating), 2) AS "Average Rating"  -- Calculate the average rating for each instructor
FROM instructor i
JOIN course_instructor ci ON i.instructor_id = ci.instructor_id
JOIN course c ON ci.course_id = c.course_id
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY i.instructor_id, i.first_name, i.last_name
ORDER BY ROUND(AVG(e.course_rating), 2) DESC;

-- Query 7
-- This SQL query provides a comprehensive dashboard for students, showcasing:
-- - Their personal details
-- - The total number of courses they're enrolled in
-- - The number of ongoing courses they're currently taking (i.e., not completed)
-- - The balance on their gift card

SELECT concat(s.first_name, ' ',s.last_name) as "Name", email,
s.signup_date as "Sign-up Date", s.education_level as "Education Level",
s.program, s.occupation, s.dob as "Date of Birth", s.region,
    COUNT(DISTINCT e.course_id) AS "Total Courses Enrolled",
    COUNT(DISTINCT CASE WHEN e.completion_date IS NULL THEN e.course_id END) AS "No of Ongoing Courses",  -- Count courses that are not yet completed
    COALESCE(SUM(gc.gift_amount), 0) AS "Gift Card Balance"  -- Sum the gift card amounts and handle NULL cases
FROM student s
LEFT JOIN enrollment e ON s.student_id = e.student_id
LEFT JOIN gift_card gc ON s.student_id = gc.student_id
WHERE s.student_id = 'stud2';

-- Query8
-- This SQL query aims to provide insights into customer behavior by:
-- - Counting the number of courses each student has enrolled in
-- - Calculating the number of days since their last enrollment
-- This can help in identifying dormant users who might be targeted for marketing campaigns.

SELECT concat(s.first_name, ' ',s.last_name) as "Name", email,
s.signup_date as "Sign-up Date", s.education_level as "Education Level",
COUNT(e.course_id) AS "Number of courses enrolled",
DATEDIFF(CURDATE(), MAX(e.purchase_date)) AS "Days since last enrollment"  -- Calculate days since last enrollment
FROM student s
LEFT JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY s.student_id;

-- Query9 
-- This SQL query attempts to find a correlation between a student's past education level
-- and the categories of courses they're enrolling in. Additionally, it calculates their completion rates.

SELECT
    s.education_level as "Education Level",
    cat.category as "Category",
    COUNT(DISTINCT e.student_id) AS "No of Enrolled Students",
    ROUND(
        COUNT(DISTINCT CASE WHEN e.completion_date IS NOT NULL THEN e.student_id END) /  -- Count completed courses
        COUNT(DISTINCT e.student_id) * 100, 2
    ) AS "Completion Rate"
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
JOIN category cat ON c.category_id = cat.category_id
GROUP BY s.education_level, cat.category
ORDER BY s.education_level, cat.category;

-- Query 10
-- This SQL query seeks to understand price sensitivity among different age groups of students.
-- It categorizes students based on their age and courses based on their price, then counts enrollments for each combination.

-- Select the age group and course price categories, then count enrollments for each combination.
SELECT
    CASE
        WHEN YEAR(CURDATE()) - YEAR(s.dob) < 18 THEN '<18'  -- Categorize age groups < 18 years old
        WHEN YEAR(CURDATE()) - YEAR(s.dob) BETWEEN 18 AND 35 THEN '18-35'  -- Categorize age groups between 18 and 35 years old
        WHEN YEAR(CURDATE()) - YEAR(s.dob) BETWEEN 36 AND 60 THEN '35-60'  -- Categorize age groups between 36 and 60 years old
        ELSE '>60'  -- Categorize age groups > 60 years old
    END AS "Age_Group",
    CASE
        WHEN c.price = 0 THEN '0'  -- Categorize courses with price 0 as '0'
        WHEN c.price < 50 THEN '<50'  -- Categorize courses with price less than 50 as '<50'
        ELSE '>50'  -- Categorize courses with price 50 or more as '>50'
    END AS "Course_Price",
    COUNT(e.enrollment_id) AS number_of_enrollments  -- Count enrollments for each age-price combination
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
GROUP BY Age_Group, Course_Price  -- Group results by age group and course price
ORDER BY Age_Group, COUNT(e.enrollment_id) DESC;  -- Order the results by age group and enrollment count in descending order

-- Query 11
-- This query aims to calculate the number of students who initially enrolled in a free course
-- and later enrolled in a paid course.

-- Select the count of distinct student IDs who meet the criteria of enrolling in a free course and then in a paid course.
SELECT COUNT(DISTINCT s.student_id) AS converted_students
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
WHERE c.price = 0
AND s.student_id IN (
    -- Subquery to find student IDs who enrolled in paid courses after enrolling in free courses.
    SELECT student_id FROM enrollment JOIN course ON enrollment.course_id = course.course_id WHERE price > 0
);

-- Query12
-- This query calculates the number of unique courses shared on each medium.
-- Select the shared medium and count the number of distinct course IDs shared on that medium.
SELECT shared_medium, COUNT(DISTINCT course_id) AS number_of_courses_shared
FROM student_course_sharing
GROUP BY shared_medium;

-- Query13
-- This query calculates the number of enrollments for each week over a semester.
-- The semester is assumed to be from January to June.

-- Select the year, week, and count of enrollments for each week within the specified semester.
SELECT 
    YEAR(purchase_date) AS year,
    WEEK(purchase_date) AS week,
    COUNT(enrollment_id) AS number_of_enrollments
FROM enrollment
WHERE purchase_date BETWEEN '2021-01-01' AND '2021-06-30'
GROUP BY YEAR(purchase_date), WEEK(purchase_date)
ORDER BY year, week;

-- Query14
-- This query explores the potential correlation between the lengths of videos in courses and their completion rates.
-- It categorizes courses based on their total video length and calculates the average completion rate for each category.

SELECT  
    -- Categorize video length intervals and calculate aggregate values.
    CASE 
        WHEN a5.Video_Length_Per_Course >= 0 AND a5.Video_Length_Per_Course < 3 THEN "< 3" 
        WHEN a5.Video_Length_Per_Course >= 3 AND a5.Video_Length_Per_Course < 9 THEN "3-8" 
        WHEN a5.Video_Length_Per_Course >= 9 AND a5.Video_Length_Per_Course < 15 THEN "9-14" 
        WHEN a5.Video_Length_Per_Course >= 15 AND a5.Video_Length_Per_Course < 21 THEN "15-20" 
        WHEN a5.Video_Length_Per_Course >= 21 THEN ">= 21" 
    END AS "Video_Length_Interval_Hrs", 
    -- Sum the number of enrollments and calculate average completion rate.
    SUM(a6.Number_of_Enrollments_Per_Course) AS "Number_of_Enrollments",
    AVG(a6.Completion_Rate) AS "Completion_Rate"
FROM  
    ( 
    -- Subquery to calculate video length per course.
    SELECT c.course_id, ROUND(SUM(length_min)/60, 0) AS "Video_Length_Per_Course"
    FROM course c 
    INNER JOIN video v ON c.course_id = v.course_id 
    GROUP BY c.course_id 
    ) AS a5 
INNER JOIN 
    ( 
    -- Subquery to calculate enrollments and completion rates per course.
    SELECT c.course_id, COUNT(*) AS "Number_of_Enrollments_Per_Course", temp.Completion_Rate
    FROM course c 
    INNER JOIN (
        -- Subquery to calculate completion rate per course.
        SELECT
            e.course_id,
            ROUND(
                COUNT(DISTINCT CASE WHEN e.completion_date IS NOT NULL THEN e.student_id END) /
                COUNT(DISTINCT e.student_id) * 100, 2
            ) AS "Completion_Rate"
        FROM student s
        JOIN enrollment e ON s.student_id = e.student_id
        GROUP BY e.course_id
    ) AS temp
    ON c.course_id = temp.course_id 
    GROUP BY c.course_id 
    ) AS a6 
ON a5.course_id = a6.course_id 
GROUP BY "Video_Length_Interval_Hrs" 
ORDER BY "Number_of_Enrollments" DESC;

-- Query15
-- This query segments customers based on their purchasing behavior.
-- It then identifies the students who have purchased more courses, spent more, 
-- and haven't purchased recently as compared to the average of all customers.

SELECT student_id as urgent_attention_customer
FROM (
    -- Subquery to calculate various metrics for customer segmentation.
    SELECT 
        student_id,
        COUNT(enrollment.course_id) AS courses_purchased,
        MAX(purchase_date) AS last_purchase_date,
        SUM(price) AS total_spent,
        AVG(DATEDIFF(purchase_date, '2020-11-09')) OVER() AS avg_days_since_last_purchase,
        AVG(price) OVER() AS avg_total_spent,
        AVG(COUNT(enrollment.course_id)) OVER() AS avg_courses_purchased
    FROM enrollment
    JOIN course ON enrollment.course_id = course.course_id
    WHERE price > 0
    GROUP BY student_id
) AS CustomerSegmentation
WHERE 
    courses_purchased > avg_courses_purchased
AND DATEDIFF(last_purchase_date, '2020-11-09') > avg_days_since_last_purchase
AND total_spent > avg_total_spent;


-- Query 16
-- This query calculates the enrollment rate for recommended courses.

 
-- Select the count of total enrollments and enrollments after recommendation.
SELECT  COUNT(DISTINCT enrollment_id) AS TotalEnrollments , COUNT(DISTINCT CourseSharing.student_id) AS EnrollmentsAfterRecommendation 
            FROM enrollment, (SELECT student_id, shared_with_student_id, course_id  
            FROM student_course_sharing) AS CourseSharing
            WHERE CourseSharing.shared_with_student_id = enrollment.student_id;

-- Query17
-- This query identifies the top-selling course in each category.

-- Select the category name, course ID, and total enrollments for top-selling courses in each category.
SELECT category_name, course_id, total_enrollments
FROM (
    -- Subquery to rank courses within each category based on enrollments.
    SELECT 
        ca.category AS category_name,
        c.course_id,
        COUNT(e.enrollment_id) AS total_enrollments,
        RANK() OVER(PARTITION BY ca.category ORDER BY COUNT(e.enrollment_id) DESC) as ranking
    FROM course c
    JOIN enrollment e ON c.course_id = e.course_id
    JOIN category ca ON c.category_id = ca.category_id
    WHERE price > 0
    GROUP BY ca.category, c.course_id
) AS RankedCourses
WHERE ranking = 1;

-- Query 18
-- This query fetches students who have received gift cards and have also enrolled in non-free courses.
-- Select distinct student information who received gift cards and enrolled in non-free courses.
SELECT DISTINCT
    s.student_id,
    s.first_name,
    s.last_name
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
JOIN gift_card g ON s.student_id = g.student_id
WHERE c.price > 0;


-- Query19
-- This query calculates the average period between course purchase and completion for each course.
-- Select course ID, course title, and average completion days for each course.
SELECT 
    e.course_id,
    c.course_title,
    AVG(DATEDIFF(e.completion_date, e.purchase_date)) AS avg_completion_days
FROM enrollment e
JOIN course c ON e.course_id = c.course_id
WHERE e.completion_date IS NOT NULL
GROUP BY e.course_id, c.course_title
ORDER BY avg_completion_days DESC;


-- Query 20
-- This query calculates the diversity of audiences and course categories for each instructor.
-- Select instructor ID, first name, last name, audience diversity, and category diversity.
SELECT 
    i.instructor_id,
    i.first_name,
    i.last_name,
    COUNT(DISTINCT s.region) AS audience_diversity,
    COUNT(DISTINCT c.category_id) AS category_diversity
FROM instructor i
JOIN course_instructor ci ON i.instructor_id = ci.instructor_id
JOIN course c ON ci.course_id = c.course_id
JOIN enrollment e ON c.course_id = e.course_id
JOIN student s ON e.student_id = s.student_id
GROUP BY i.instructor_id, i.first_name, i.last_name
ORDER BY i.instructor_id;



