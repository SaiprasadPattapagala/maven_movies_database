CREATE SCHEMA mavenmovies;

use mavenmovies;

# 1)Write a SQL query to count the number of characters except the spaces for each actor. Return first 10 actors name length along with their name.
SELECT * from actor;

SELECT actor_id,
CONCAT(first_name," ",last_name) as full_name, 
LENGTH(CONCAT(first_name, last_name)) as length_name 
FROM actor limit 10;


# 2) List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.
SELECT * from actor_award;

SELECT actor_award_id,awards,
CONCAT(first_name," ",last_name) as fullName,length(concat(first_name,last_name)) as length from actor_award
WHERE awards="Oscar";



# 3)  Find the actors who have acted in the film ‘Frost Head’.
SELECT * from actor;
SELECT * from film;
SELECT * from film_actor;


SELECT first_name,last_name from actor inner join film on actor.actor_id=film.film_id 
WHERE title="frost Head";


SELECT first_name,last_name,title from actor inner join film on actor.actor_id=film.film_id 
WHERE title="frost Head";


# 4) Pull all the films acted by the actor ‘Will Wilson’.
SELECT * from actor;
SELECT *from film;

SELECT title  from film inner join actor on film.film_id=actor.actor_id
where actor.first_name="Wil" and actor.last_name="Wilson";


SELECT title,film_id from film inner join actor on film.film_id=actor.actor_id
where actor.first_name="Wil" and actor.last_name="Wilson"; 


# 5) Pull all the films which were rented and return in the month of May.
SELECT  * from rental;
SELECT * from film;

SELECT title,rental_date from rental r inner join film f on r.rental_id=f.film_id;


# 6) Pull all the films with ‘Comedy’ category.
SELECT * from film_category;
SELECT * from category;
SELECT * from film;

SELECT Title from film 
inner join film_category USING (film_id)
inner join category USING (category_id)
order by film_id = 'Comedy' limit 1;

