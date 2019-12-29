import React from 'react'; 
import ReactDOM from 'react-dom'; 
import RatingList from "./Components/RatingList";
import nock from 'nock'; 

it('renders without crashing', () => { 
  const div = document.createElement('div');
  ReactDOM.render(<RatingList />, div);
  ReactDOM.unmountComponentAtNode(div); 
});

const movieRating = nock('http://asickweb.com/api/?getvalue') 
  .get('/movie-rating/')  
  .reply(
    200, 
    { movies: [{ id: 1, title: 'title',poster_path:'poster_path',rating:'rating',overview:'overview' }] }, 
    { 
      'Access-Control-Allow-Origin': '*', 
      'Content-type': 'application/json' 
    }
);

nock.disableNetConnect();