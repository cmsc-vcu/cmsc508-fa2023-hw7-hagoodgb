# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;

SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255),
    time_commitment VARCHAR(255),
    PRIMARY KEY(skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, name, description, tag) 
VALUES (1, 'Lightsaber Crafting', 'Master the ancient art of constructing a lightsaber, the iconic weapon of the Jedi and Sith. Requires knowledge in kyber crystal harvesting and energy modulation.', 'Skill 1');


INSERT INTO skills (skills_id, name, description, tag) 
VALUES (2, 'Force Sensitivity Training', 'Develop an understanding of the Force, learning to sense and manipulate the energy that connects all living things.', 'Skill 2');


INSERT INTO skills (skills_id, name, description, tag) 
VALUES (3, 'Starship Piloting', 'Learn to navigate the stars with various classes of starships. Includes training in astrogation, combat maneuvers, and hyperspace theory.', 'Skill 3');


INSERT INTO skills (skills_id, name, description, tag) 
VALUES (4, 'Droid Programming', 'Gain proficiency in programming and customizing droids for various tasks, including but not limited to, protocol, astromech, and battle droids.', 'Skill 4');


INSERT INTO skills (skills_id, name, description, tag) 
VALUES (5, 'Galactic Diplomacy', 'Study the complex art of diplomacy in a galaxy full of diverse species and political factions. Essential for aspiring senators and ambassadors.', 'Skill 5');


INSERT INTO skills (skills_id, name, description, tag) 
VALUES (6, 'Alien Languages', 'Become fluent in various alien languages, an invaluable skill for intergalactic travel and trade negotiations.', 'Skill 6');


INSERT INTO skills (skills_id, name, description, tag) 
VALUES (7, 'Sith Alchemy', 'Delve into the dark side of the Force to manipulate life and matter, a secretive practice known mainly to Sith Lords.', 'Skill 7');


INSERT INTO skills (skills_id, name, description, tag) 
VALUES (8, 'Jedi Meditation Techniques', 'Learn ancient Jedi techniques for meditation, essential for maintaining balance and focus in the Force.', 'Skill 8');



# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(4096),
    date_joined DATE NOT NULL,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, last_name, email, date_joined) VALUES (1, 'Person 1', 'Person1@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (2, 'Person 2', 'Person2@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (3, 'Person 3', 'Person3@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (4, 'Person 4', 'Person4@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (5, 'Person 5', 'Person5@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (6, 'Person 6', 'Person6@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (7, 'Person 7', 'Person7@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (8, 'Person 8', 'Person8@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (9, 'Person 9', 'Person9@gmail.com', CURRENT_DATE());
INSERT INTO people (people_id, last_name, email, date_joined) VALUES (10, 'Person 10', 'Person10@gmail.com', CURRENT_DATE());



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id INT AUTO_INCREMENT,
    skills_id INT,
    people_id INT,
    date_aquired DATE,
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    PRIMARY KEY (peopleskills_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (1, 1, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (3, 1, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (6, 1, CURRENT_DATE());

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (3, 2, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (4, 2, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (5, 2, CURRENT_DATE());

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (1, 3, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (5, 3, CURRENT_DATE());

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (3, 5, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (6, 5, CURRENT_DATE());

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (2, 6, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (3, 6, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (4, 6, CURRENT_DATE());

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (3, 7, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (5, 7, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (6, 7, CURRENT_DATE());

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (1, 8, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (3, 8, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (5, 8, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (6, 8, CURRENT_DATE());

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (2, 9, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (5, 9, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (6, 9, CURRENT_DATE());

INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (1, 10, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (4, 10, CURRENT_DATE());
INSERT INTO peopleskills (skills_id, people_id, date_aquired) VALUES (5, 10, CURRENT_DATE());

 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id INT,
    name VARCHAR(255),
    sort_priority INT,
    PRIMARY KEY (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_id, name, sort_priority) VALUES (1, 'Designer', 10);
INSERT INTO roles (roles_id, name, sort_priority) VALUES (2, 'Developer', 20);
INSERT INTO roles (roles_id, name, sort_priority) VALUES (3, 'Recruit', 30);
INSERT INTO roles (roles_id, name, sort_priority) VALUES (4, 'Team Lead', 40);
INSERT INTO roles (roles_id, name, sort_priority) VALUES (5, 'Boss', 50);
INSERT INTO roles (roles_id, name, sort_priority) VALUES (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id INT AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(roles_id),
    PRIMARY KEY (peopleroles_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (1, 2, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (2, 5, CURRENT_DATE());
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (2, 6, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (3, 2, CURRENT_DATE());
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (3, 4, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (4, 3, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (5, 3, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (6, 2, CURRENT_DATE());
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (6, 1, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (7, 1, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (8, 1, CURRENT_DATE());
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (8, 4, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (9, 2, CURRENT_DATE());

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (10, 2, CURRENT_DATE());
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (10, 1, CURRENT_DATE());


