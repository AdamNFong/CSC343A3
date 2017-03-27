DROP SCHEMA IF EXISTS part1 CASCADE;
CREATE SCHEMA part1;
SET search_path TO part1;

CREATE TYPE DegLevel AS ENUM ('certificate', 'undergraduate', 'professional', 'masters', 'doctoral');
CREATE TYPE SkillWhat AS ENUM ('SQL', 'Scheme', 'Python', 'R', 'LaTeX');
CREATE TYPE Numbers AS ENUM ('1', '2', '3', '4', '5');

--interview--

CREAT TABLE Interviews(
	interview_id integer REFERENCES Interview NOT NULL,
	interviewer_id integer REFERENCES Interviewer NOT NULL,
	PRIMARY (interview_id)
) ;

CREATE TABLE Interview (
	interview_id integer PRIMARY KEY NOT NULL,
	InterviewDate timestamp NOT NULL,
	location varchar(40) NOT NULL,
	assessment_id integer REFERENCES Assessment NOT NULL
) ;

CREATE TABLE Assessment(
	assessment_id integer NOT NULL,
	answers_id integer REFERENCES Answers,
	techProficiency integer NOT NULL,
	communication integer NOT NULL,
	enthusiasm integer NOT NULL,
	collegiality integer,
	PRIMARY(assessment_id, answers_id)
);

CREATE TABLE Answers (
	answers_id integer NOT NULL,
	question_id integer REFERENCES Answer NOT NULL,
	PRIMARY (answers_id,answer_id)
) ;

CREATE TABLE Answer (
	question_id integer REFERENCES Question NOT NULL,
	answer varchar(100) NOT NULL,
	PRIMARY (question_id, answer)
) ;

CREATE TABLE Interviewer (
	interviwer_id integer NOT NULL,
	forename varchar(20) NOT NULL,
	surname varchar(20) NOT NULL,
	honorific varchar(20) NOT NULL,
	title varchar(20) NOT NULL,
	PRIMARY (interviwer_id) 
) ;


--Posting--
CREATE TABLE Posting (
	posting_id integer NOT NULL,
	set_skills_id integer REFERENCES SetRequiredSkills NOT NULL,
	Set_Questions_id integer REFERENCES SetQuestion,
	PRIMARY (posting_id)
) ;

CREATE TABLE SetRequiredSkills(
	Set_skills_id integer NOT NULL,
	skill_id integer REFERENCES Skill NOT NULL,
	req_level Numbers NOT NULL,
	importance Numbers NOT NULL,
	PRIMARY (Set_skills_id, skill_id, req_level, importance)
) ;

CREATE TABLE SetQuestions(
	Set_Questions_id integer NOT NULL,
	question integer REFERENCES Question NOT NULL,
	PRIMARY (Set_Questions_id, question)
) ;

CREATE TABLE Question(
	question_id integer PRIMARY KEY NOT NULL;
	question varchar(100) NOT NULL,
) ;

--Resume--
CREATE TABLE Resume (
	resume_id integer NOT NULL,
	description varchar(100),
	identification_id integer REFERENCES Identity NOT NULL,
	education_id integer REFERENCES Education,
	set_experience_id integer REFERENCES SetExperience,
	set_resume_skill_id integer REFERENCES SetResumeSkill NOT NULL,
	PRIMARY (resume_id)
) ;

CREATE TABLE Identity (
	identification_id integer PRIMARY KEY NOT NULL,
	name varchar(20) NOT NULL,
	DOB timestamp NOT NULL,
	citizenship varchar(10) NOT NULL,
	address varchar(20) NOT NULL,
	telephone varchar(20) NOT NULL,
	email varchar(20) NOT NULL,
	UNIQUE (name,email)
) ;

CREATE TABLE Education (
	education_id integer NOT NULL,
	degree_id integer REFERENCES Degree,
	PRIMARY (education_id,degree_id)
) ;

CREATE TABLE Degree (
	degree_id integer NOT NULL,
	degreeLevel DegLevel NOT NULL,
	degreeName varchar(30),
	institution carchar(30),
	set_major_id integer REFERENCES SetMajor NOT NULL,
	set_minor_id integer REFERENCES SetMinor,
	honours boolean DEFAULT false,
	period_id integer REFERENCES Period,
	PRIMARY (degree_id, major)
) ;

CREATE TABLE SetMajor(
	set_major integer NOT NULL,
	major_id integer REFERENCES Major NOT NULL,
	PRIMARY (set_major, major_id)
);

CREATE TABLE Major (
	major_id integer NOT NULL,
	major varchar(20) NOT NULL,
	PRIMARY (major_id, major)
) ;

CREATE TABLE Minor(
	set_minor_id integer NOT NULL,
	minor_id integer REFERENCES Minor NOT NULL,
	PRIMARY (set_minor_id, minor_id)
) ;

CREATE TABLE Minor (
	minor_id integer NOT NULL,
	minor varchar(20) NOT NULL,
	PRIMARY (minor_id, minor)
) ;

CREATE TABLE Period (
	period_id integer PRIMARY KEY NOT NULL,
	startDate timestamp NOT NULL,
	endDate timeStamp NOT NULL
) ;

CREATE TABLE SetExperience (
	set_experience_id integer NOT NULL,
	position_id integer REFERENCES Position NOT NULL,
	PRIMARY (experience_id,position_id)
) ;

CREATE TABLE Position (
	position_id integer PRIMARY KEY NOT NULL,
	title varchar(10) NOT NULL,
	description varchar(100),
	period_id integer REFERENCES Period
) ;

CREATE TABLE SetResumeSkill(
	set_resume_skills_id integer NOT NULL,
	skill_id integer REFERENCES Skill NOT NULL,
	skill_level Numbers NOT NULL
	PRIMARY (set_resume_skills_id, skill_id)
) ;

CREATE TABLE Skill(
	skill_id integer NOT NULL,
	what SkillWhat NOT NULL,
	PRIMARY (skill_id,what)
) ;

