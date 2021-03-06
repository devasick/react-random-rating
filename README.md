                                Assignment for Frontend Developer

Demo URL :  http://asickweb.com/movie-rating/

Demo heroku: http://react-rating.herokuapp.com/

1. Pick your top 10+ fav books, movies, video games, food, or whatever you
wish. Build an Angular + ngrx/store or react-redux app that lists these
items. Initial list of any of these item can be stored in json file no
need to write a backend service.
2. Create a rating system where you can rate each item. Order the list by
the highest rated item to lowest rated item. Re-order the list, if needed,
when user ranks an item.
3. Using RxJS or any other library, randomly rate items at random times,
also re-ordering the list as necessary. To elaborate this more put a
button called RANDOM RATING and on click of this button code will start
rating random item at random time with random rating. And on same button
press again it will stop random rating.
4. Feel free to use any UI elements or library.
5. Focus on test driven approach while coding this assignment.
6. Git repo with commit messages will be a plus.

Please visit Live Demo URL: http://asickweb.com/movie-rating/
===================================

Section 1: Express Server and PSQL Database setup
Project Structure
Basic Express setup
Connecting to Client side
axios vs react-router vs express router
Setting up the database
PSQL foreign keys
PSQL shell

Setting up Express Routes and PSQL queries

Change directory to api folder from root path

npm install

API URL : http://localhost:9000/



======================

Technologies: 

React 
Redux
Redux
Express JS
Postgres
Materialize



Setup:
=======

Client Side:

git clone https://github.com/devasick/react-random-rating.git
cd react-random-rating
npm install 
npm start

Server Side:

cd api 

npm install 

Open the PSQL shell and login to PSQL

Create a new PSQL database if you have not already done so.

Simply copy the SQL code in the sql/movies_ratings.sql file and paste it in as commands into the PSQL shell.

In the api/db.js file replace the code with the login info for your own PSQL database.

After setting up the PSQL database and making the required adjustments in the db.js file, the app will be fully functional.

npm start



server live path: const URL_PATH = 'https://react-api-demo123.herokuapp.com/api/'; 
server local path: const URL_PATH = 'http://localhost:9000/api/'; 

TDD File :
========

src/RatingList.spec.js





