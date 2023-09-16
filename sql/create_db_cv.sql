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

CREATE TABLE IF NOT EXISTS cv (
    id_cv TINYINT UNSIGNED AUTO_INCREMENT,
    cv_name VARCHAR (50) UNIQUE NOT NULL,
    cv_title VARCHAR (50) UNIQUE NOT NULL,
    PRIMARY KEY (id_cv)
);


/**  
*   VALUES
**/
CREATE TABLE IF NOT EXISTS values (
    id_value TINYINT UNSIGNED AUTO_INCREMENT,
    value_name VARCHAR (50) UNIQUE NOT NULL, 
    value_details VARCHAR (255),
    PRIMARY KEY (id_value)
);

CREATE TABLE IF NOT EXISTS cv_values (   -- ORDER TABLE
    id_cv_value TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_value TINYINT UNSIGNED NOT NULL,
    order_value TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_value),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_value) REFERENCES values(id_value)
);


/**  
*   CATEGORIES
**/
CREATE TABLE IF NOT EXISTS categories (
    id_category TINYINT UNSIGNED AUTO_INCREMENT,
    category_name VARCHAR (50) UNIQUE NOT NULL, -- table_names
    PRIMARY KEY (id_category)
);

CREATE TABLE IF NOT EXISTS cv_categories (   -- ORDER TABLE
    id_cv_category TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_category TINYINT UNSIGNED NOT NULL,
    order_category TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_category),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_category) REFERENCES categories(id_category)
);


/**  
*   LANGUAGES
**/
CREATE TABLE IF NOT EXISTS languages (
    id_language TINYINT UNSIGNED AUTO_INCREMENT,
    idiom VARCHAR (50) NOT NULL UNIQUE,
    cerl CHAR (2) NOT NULL,
    idiom_exp VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_language),
    FOREIGN KEY (cerl) REFERENCES languages_level(cerl)
);

CREATE TABLE IF NOT EXISTS languages_level ( -- JOIN TABLE
    cerl CHAR (2) NOT NULL,
    cerl_level VARCHAR (255) NOT NULL,
    details TEXT,
    PRIMARY KEY (cerl)
);

CREATE TABLE IF NOT EXISTS cv_languages ( -- ORDER TABLE
    id_cv_language TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_language TINYINT UNSIGNED NOT NULL,
    order_language TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_language),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_language) REFERENCES languages(id_language)
);


/**  
*   LINKS
**/
CREATE TABLE IF NOT EXISTS links (
    id_link TINYINT UNSIGNED AUTO_INCREMENT,
    label VARCHAR (50) NOT NULL UNIQUE,
    site_name VARCHAR (50) NOT NULL,
    link_type VARCHAR (50),
    link1 VARCHAR (255) NOT NULL,
    link2 VARCHAR (255),
    PRIMARY KEY (id_link)
);

CREATE TABLE IF NOT EXISTS cv_links (   -- ORDER TABLE
    id_cv_link TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_link TINYINT UNSIGNED NOT NULL,
    order_link TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_link),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_link) REFERENCES links(id_link)
);


/**  
*   STACK
**/
CREATE TABLE IF NOT EXISTS stack (
    id_tech_stack TINYINT UNSIGNED AUTO_INCREMENT,
    tech_name VARCHAR (50) NOT NULL UNIQUE,
    stack_category VARCHAR (50) NOT NULL,
    tech_type VARCHAR (50) NOT NULL,
    tech_base VARCHAR (50),
    tech_level TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_tech_stack)
);

CREATE TABLE IF NOT EXISTS cv_stack (   -- ORDER TABLE
    id_cv_tech_stack TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_tech_stack TINYINT UNSIGNED NOT NULL,
    order_tech_stack TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_tech_stack),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_tech_stack) REFERENCES stack(id_tech_stack)
);


/**  
*   PRO SKILLS
**/
CREATE TABLE IF NOT EXISTS pro_skills (
    id_pro_skill TINYINT UNSIGNED AUTO_INCREMENT,
    pro_skill_name VARCHAR (50) NOT NULL UNIQUE,
    pro_skill_category VARCHAR (50) NOT NULL ,
    pro_skill_details VARCHAR (255) NOT NULL,
    pro_skill_level TINYINT UNSIGNED,
    PRIMARY KEY (id_pro_skill)
);

CREATE TABLE IF NOT EXISTS cv_pro_skills (   -- ORDER TABLE
    id_cv_pro_skill TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_pro_skill TINYINT UNSIGNED NOT NULL,
    order_pro_skill TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_pro_skill),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_pro_skill) REFERENCES pro_skills(id_pro_skill)
);


/**  
*   SOFT SKILLS
**/
CREATE TABLE IF NOT EXISTS soft_skills (
    id_soft_skill TINYINT UNSIGNED AUTO_INCREMENT,
    soft_skill_name VARCHAR (50) NOT NULL UNIQUE,
    soft_skill_category VARCHAR (50) NOT NULL ,
    soft_skill_details VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_soft_skill)
);

CREATE TABLE IF NOT EXISTS cv_soft_skills (   -- ORDER TABLE
    id_cv_soft_skill TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_soft_skill TINYINT UNSIGNED NOT NULL,
    order_soft_skill TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_soft_skill),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_soft_skill) REFERENCES soft_skills(id_soft_skill)
);


/**  
*   HOBBIES
**/
CREATE TABLE IF NOT EXISTS hobbies (
    id_hobby TINYINT UNSIGNED AUTO_INCREMENT,
    hobby_name VARCHAR (50) NOT NULL UNIQUE,
    hobby_field VARCHAR (50) NOT NULL,
    hobby_exp VARCHAR (255),
    hobby_interest VARCHAR (255),
    PRIMARY KEY (id_hobby)
);

CREATE TABLE IF NOT EXISTS hobbies_values (  -- MERGE TABLE
    id_hobby_value TINYINT UNSIGNED AUTO_INCREMENT,
    id_hobby TINYINT UNSIGNED NOT NULL,
    id_value TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_hobby_value),
    FOREIGN KEY (id_hobby) REFERENCES hobbies(id_hobby),
    FOREIGN KEY (id_value) REFERENCES values(id_value)
);

CREATE TABLE IF NOT EXISTS hobbies_soft_skills (  -- MERGE TABLE
    id_hobby_soft_skill TINYINT UNSIGNED AUTO_INCREMENT,
    id_hobby TINYINT UNSIGNED NOT NULL,
    id_soft_skill TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_hobby_value),
    FOREIGN KEY (id_hobby) REFERENCES hobbies(id_hobby),
    FOREIGN KEY (id_soft_skill) REFERENCES soft_skills(id_soft_skill)
);

CREATE TABLE IF NOT EXISTS cv_hobbies (  -- ORDER TABLE
    id_cv_hobby TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_hobby TINYINT UNSIGNED NOT NULL,
    order_hobby TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_language),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_hobby) REFERENCES hobbies(id_hobby)
);


/**  
*   LICENCES
**/
CREATE TABLE IF NOT EXISTS licences (
    id_licence TINYINT UNSIGNED AUTO_INCREMENT,
    category VARCHAR (50) NOT NULL UNIQUE,
    vehicle VARCHAR (50) NOT NULL,
    details VARCHAR (255),
    grad_date DATE,
    validity DATE,
    PRIMARY KEY (id_licence)
);

CREATE TABLE IF NOT EXISTS cv_licences (   -- ORDER TABLE
    id_cv_licence TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_licence TINYINT UNSIGNED NOT NULL,
    order_licence TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_licence),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_licence) REFERENCES licences(id_licence)
);


/**  
*   DEGREES
**/
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

CREATE TABLE IF NOT EXISTS cv_degrees ( -- ORDER TABLE
    id_cv_degree TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_degree TINYINT UNSIGNED NOT NULL,
    order_degree TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_degree),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_degree) REFERENCES degrees(id_degree)
);


/**  
*   FORMATIONS
**/
CREATE TABLE IF NOT EXISTS formations (
    id_formation TINYINT UNSIGNED AUTO_INCREMENT,
    form_name VARCHAR (255) NOT NULL,
    abr_form_name VARCHAR (30) NOT NULL,
    certification VARCHAR (255) NOT NULL,
    level VARCHAR (255),
    school_name VARCHAR (50) NOT NULL,
    duration VARCHAR (20) NOT NULL,
    starting_date DATE,
    ending_date DATE,
    form_type VARCHAR (50),
    form_contract VARCHAR (50),
    form_format VARCHAR (255) NOT NULL,
    logo_school VARCHAR (255) NOT NULL, -- link to the image
    PRIMARY KEY (id_formation)
);

CREATE TABLE IF NOT EXISTS form_objectives (   -- JOIN TABLE
    id_form_objectif TINYINT UNSIGNED AUTO_INCREMENT,
    id_formation TINYINT UNSIGNED NOT NULL,
    objectif TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_formation_objectif),
    FOREIGN KEY (id_formation) REFERENCES formations(id_formation)
);

CREATE TABLE IF NOT EXISTS form_stack (   -- MERGE TABLE
    id_form_stack TINYINT UNSIGNED AUTO_INCREMENT,
    id_formation TINYINT UNSIGNED NOT NULL,
    id_tech_stack TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_form_stack),
    FOREIGN KEY (id_formation) REFERENCES formations(id_formation),
    FOREIGN KEY (id_tech_stack) REFERENCES stack(id_tech_stack)
);

CREATE TABLE IF NOT EXISTS cv_formation ( -- ORDER TABLE
    id_cv_formation TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_formation TINYINT UNSIGNED NOT NULL,
    order_formation TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_formation),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_formation) REFERENCES formations(id_formation)
);


/**  
*   EXPERIENCES
**/
CREATE TABLE IF NOT EXISTS experiences (
    id_experience TINYINT UNSIGNED AUTO_INCREMENT,
    company VARCHAR (255) NOT NULL,
    position VARCHAR (255) NOT NULL,
    starting_date DATE NOT NULL,
    ending_date DATE,
    isActual BOOLEAN NOT NULL,
    country VARCHAR (255) NOT NULL,
    city VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_experience)
);

CREATE TABLE IF NOT EXISTS exp_missions (   -- JOIN TABLE
    id_exp_mission TINYINT UNSIGNED AUTO_INCREMENT,
    id_experience TINYINT UNSIGNED NOT NULL,
    mission VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_exp_mission),
    FOREIGN KEY (id_experience) REFERENCES experiences(id_experience)
);

CREATE TABLE IF NOT EXISTS mission_tasks (   -- JOIN TABLE
    id_mission_task TINYINT UNSIGNED AUTO_INCREMENT,
    id_experience TINYINT UNSIGNED NOT NULL,
    task VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_mission_task),
    FOREIGN KEY (id_experience) REFERENCES experiences(id_experience)
);

CREATE TABLE IF NOT EXISTS exp_links (   -- JOIN TABLE
    id_exp_link TINYINT UNSIGNED AUTO_INCREMENT,
    id_experience TINYINT UNSIGNED NOT NULL,
    link VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_exp_link),
    FOREIGN KEY (id_experience) REFERENCES experiences(id_experience)
);

CREATE TABLE IF NOT EXISTS exp_stack (   -- MERGE TABLE
    id_exp_tech_stack TINYINT UNSIGNED AUTO_INCREMENT,
    id_experience TINYINT UNSIGNED NOT NULL,
    id_tech_stack TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_exp_tech_stack),
    FOREIGN KEY (id_experience) REFERENCES experiences(id_experience)
    FOREIGN KEY (id_tech_stack) REFERENCES stack(id_tech_stack)
);

CREATE TABLE IF NOT EXISTS exp_pro_skills (   -- MERGE TABLE
    id_exp_pro_skill TINYINT UNSIGNED AUTO_INCREMENT,
    id_experience TINYINT UNSIGNED NOT NULL,
    id_pro_skill TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_exp_pro_skill),
    FOREIGN KEY (id_experience) REFERENCES experiences(id_experience)
    FOREIGN KEY (id_pro_skill) REFERENCES pro_skills(id_pro_skill)
);

CREATE TABLE IF NOT EXISTS exp_soft_skills (   -- MERGE TABLE
    id_exp_soft_skill TINYINT UNSIGNED AUTO_INCREMENT,
    id_experience TINYINT UNSIGNED NOT NULL,
    id_soft_skill TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_exp_soft_skill),
    FOREIGN KEY (id_experience) REFERENCES experiences(id_experience)
    FOREIGN KEY (id_soft_skill) REFERENCES soft_skills(id_soft_skill)
);

CREATE TABLE IF NOT EXISTS cv_exp (   -- ORDER TABLE
    id_cv_exp TINYINT UNSIGNED AUTO_INCREMENT,
    id_cv TINYINT UNSIGNED NOT NULL,
    id_experience TINYINT UNSIGNED NOT NULL,
    order_exp TINYINT UNSIGNED,
    PRIMARY KEY (id_cv_exp),
    FOREIGN KEY (id_cv) REFERENCES cv(id_cv),
    FOREIGN KEY (id_experience) REFERENCES experiences(id_experience)
);


/************************************************************************************************************
*                                                  OK                                                       *
************************************************************************************************************/
