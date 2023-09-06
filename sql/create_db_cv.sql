DROP DATABASE IF EXISTS gt_my_cv;

CREATE DATABASE IF NOT EXISTS `gt_my_cv` DEFAULT CHARACTER SET utf8mb4_general_ci; 
-- utf8mb4_bin (SENSIBLE à la casse)
-- utf8mb4_general_ci (NON sensible à la casse)

USE GT_my_CV;

CREATE TABLE IF NOT EXISTS contact (
    id_contact TINYINT UNSIGNED AUTO_INCREMENT UNIQUE,
    address VARCHAR (255) NOT NULL UNIQUE,
    complement VARCHAR (255),
    city VARCHAR (255) NOT NULL,
    CP CHAR (5) NOT NULL,
    phone CHAR  (12) NOT NULL, 
    email VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_contact)
);

CREATE TABLE IF NOT EXISTS links (
    id_link TINYINT UNSIGNED AUTO_INCREMENT,
    label VARCHAR (50) NOT NULL UNIQUE,
    site_name VARCHAR (50) NOT NULL,
    link_type VARCHAR (50),
    link1 VARCHAR (255) NOT NULL,
    link2 VARCHAR (255),
    PRIMARY KEY (id_link)
);

CREATE TABLE IF NOT EXISTS licences (
    id_licence TINYINT UNSIGNED AUTO_INCREMENT,
    category VARCHAR (50) NOT NULL UNIQUE,
    vehicle VARCHAR (50) NOT NULL,
    details VARCHAR (255),
    grad_date DATE,
    validity DATE,
    PRIMARY KEY (id_licence)
);


CREATE TABLE IF NOT EXISTS hobbies (
    id_hobby TINYINT UNSIGNED AUTO_INCREMENT,
    hobby_name VARCHAR (50) NOT NULL UNIQUE,
    hobby_field VARCHAR (50) NOT NULL,
    hobby_exp VARCHAR (255),
    hobby_interest VARCHAR (255),
    PRIMARY KEY (id_hobby)
);

CREATE TABLE IF NOT EXISTS hobbies_values (  -- JOINING TABLE
    id_hobby_value TINYINT UNSIGNED AUTO_INCREMENT,
    id_hobby TINYINT UNSIGNED NOT NULL,
    id_value TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_hobby_value),
    FOREIGN KEY (id_hobby) REFERENCES hobbies(id_hobby),
    FOREIGN KEY (id_value) REFERENCES values(id_value)
);

CREATE TABLE IF NOT EXISTS hobbies_soft_skills (  -- JOINING TABLE
    id_hobby_soft_skill TINYINT UNSIGNED AUTO_INCREMENT,
    id_hobby TINYINT UNSIGNED NOT NULL,
    id_soft_skill TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_hobby_value),
    FOREIGN KEY (id_hobby) REFERENCES hobbies(id_hobby),
    FOREIGN KEY (id_soft_skill) REFERENCES soft_skills(id_soft_skill)
);

CREATE TABLE IF NOT EXISTS cv_hobbies (  -- JOINING TABLE
    id_cv_hobby TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_hobby TINYINT UNSIGNED NOT NULL,
    order_hobby TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_language),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_hobby) REFERENCES hobbies(id_hobby)
);



CREATE TABLE IF NOT EXISTS languages (
    id_language TINYINT UNSIGNED AUTO_INCREMENT,
    idiom VARCHAR (50) NOT NULL UNIQUE,
    cerl CHAR (2) NOT NULL,
    idiom_exp VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_language),
    FOREIGN KEY (cerl) REFERENCES languages_level(cerl)
);

CREATE TABLE IF NOT EXISTS languages_level ( -- JOINING TABLE
    cerl CHAR (2) NOT NULL,
    cerl_level VARCHAR (255) NOT NULL,
    details TEXT,
    PRIMARY KEY (cerl)
);

CREATE TABLE IF NOT EXISTS cv_languages ( -- JOINING TABLE
    id_cv_language TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_language TINYINT UNSIGNED NOT NULL,
    order_language TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_language),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_language) REFERENCES languages(id_language)
);


CREATE TABLE IF NOT EXISTS degrees (
    id_degree TINYINT UNSIGNED AUTO_INCREMENT,
    degree VARCHAR (255) NOT NULL,
    abbr_degree VARCHAR (10) NOT NULL,
    degree_level CHAR (5),
    stream VARCHAR (255),
    abbr_stream VARCHAR (10),
    specialization VARCHAR (255) NOT NULL,
    abbr_spe VARCHAR (255),
    school_name VARCHAR (255),
    city VARCHAR (255),
    completed TINYINT UNSIGNED NOT NULL,
    grad_date DATE NOT NULL,
    validity TINYINT UNSIGNED DEFAULT 1,
    link_degree VARCHAR (255),
    link_info VARCHAR (255),
    PRIMARY KEY (id_degree)
);

CREATE TABLE IF NOT EXISTS cv_degrees ( -- JOINING TABLE
    id_cv_degree TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_degree TINYINT UNSIGNED NOT NULL,
    order_degree TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_degree),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_degree) REFERENCES degrees(id_degree)
);


CREATE TABLE IF NOT EXISTS school_programms (
    id_school_programm TINYINT UNSIGNED AUTO_INCREMENT,
    school_name VARCHAR (50) NOT NULL,
    formation_name VARCHAR (255) NOT NULL,
    certification  VARCHAR (255) NOT NULL,
    duration VARCHAR (20) NOT NULL,
    starting_date DATE NOT NULL,
    ending_date DATE  NOT NULL,
    formation_type VARCHAR (50),
    formation_format VARCHAR (255) NOT NULL, -- jours de formation ou en entreprise par semaine ou par mois
    objectifs TEXT (255) NOT NULL, -- Array ou strin separated by ;
    PRIMARY KEY (id_school_programm)
);

CREATE TABLE IF NOT EXISTS schools_stack (   -- JOINING TABLE
    id_school_stack TINYINT UNSIGNED AUTO_INCREMENT,
    id_school_programm TINYINT UNSIGNED NOT NULL,
    id_tech_skill TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_school_stack),
    FOREIGN KEY (id_school_programm) REFERENCES school_programms(id_school_programm),
    FOREIGN KEY (id_tech_skill) REFERENCES tech_skills(id_tech_skill)
);

CREATE TABLE IF NOT EXISTS cv_school ( -- JOINING TABLE
    id_cv_school TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_school TINYINT UNSIGNED NOT NULL,
    order_school TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_school),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_school) REFERENCES school_programms(id_school)
);


CREATE TABLE IF NOT EXISTS experiences (
    id_experience TINYINT UNSIGNED AUTO_INCREMENT,
    company VARCHAR (255) NOT NULL,
    position VARCHAR (255) NOT NULL,
    job_details TEXT NOT NULL,
    starting_date DATE NOT NULL,
    ending_date DATE,
    isActual BOOLEAN NOT NULL,
    country VARCHAR (255) NOT NULL,
    city VARCHAR (255) NOT NULL,
    tag VARCHAR (255) NOT NULL, -- ARRAY (IT / Sport / Commercial / Internationnal)
    PRIMARY KEY (id_experience)
);

CREATE TABLE IF NOT EXISTS general_skills (
    id_g_skill TINYINT UNSIGNED AUTO_INCREMENT,
    skill VARCHAR (50) NOT NULL UNIQUE,
    skill_type VARCHAR (50) NOT NULL,
    skill_level TINYINT UNSIGNED NOT NULL,
    order_view TINYINT UNSIGNED UNIQUE, -- Error: AUTO_INCREMENT,
    PRIMARY KEY (id_g_skill)
);

CREATE TABLE IF NOT EXISTS tech_skills (
    id_tech_skill TINYINT UNSIGNED AUTO_INCREMENT,
    skill VARCHAR (50) NOT NULL UNIQUE,
    stack VARCHAR (50),     -- back or front, methode, etc...
    skill_type VARCHAR (50) NOT NULL,
    related_to VARCHAR (50),    -- to what technology? (JS, PHP??)
    skill_level TINYINT UNSIGNED NOT NULL,
    order_view TINYINT UNSIGNED UNIQUE ,-- Error: AUTO_INCREMENT,
    PRIMARY KEY (id_tech_skill)
);

CREATE TABLE IF NOT EXISTS tags (
    id_tag TINYINT UNSIGNED AUTO_INCREMENT,
    tag_name VARCHAR (20) UNIQUE NOT NULL,
    PRIMARY KEY (id_tag)
);

CREATE TABLE IF NOT EXISTS exp_tags (   -- JOINING TABLE
    id_exp_tag TINYINT UNSIGNED AUTO_INCREMENT,
    id_experience TINYINT UNSIGNED,
    id_tag TINYINT UNSIGNED,
    PRIMARY KEY (id_exp_tag),
    FOREIGN KEY (id_experience) REFERENCES experiences(id_experience),
    FOREIGN KEY (id_tag) REFERENCES tags(id_tag)
);


