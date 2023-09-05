
                /**  QUERIES  **/

INSERT INTO experiences (company, position, job_details, starting_date, ending_date,country,city, tag)
VALUES ('EDF', 'Electricien', 'apporte de la lumière dans la vie des gens', '2016-05-23', '2017-08-15', 'France', 'Lyon', '["Electronique" , "Ingénieur", "Service Client"]');


SELECT id_experience, company 
  FROM experiences 
  WHERE tag LIKE '%Sport%' OR tag LIKE '%Ingénieur%';