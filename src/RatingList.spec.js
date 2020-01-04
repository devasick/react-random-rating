import React from 'react'; 
import ReactDOM from 'react-dom'; 
import RatingList from "./Components/RatingList";
import nock from 'nock'; 




it('renders without crashing', () => {
  const scope = nock('https://react-api-demo123.herokuapp.com/api/')
    .get('/all')
    .reply(200, {
      movies: [{ id: 1, title: 'title',poster_path:'poster_path',rating:'rating',overview:'overview' }]
    }, {
      'Access-Control-Allow-Origin': '*',
      'Content-type': 'application/json'
    });

  const div = document.createElement('div');
  ReactDOM.render(<RatingList />, div);
  ReactDOM.unmountComponentAtNode(div);
});