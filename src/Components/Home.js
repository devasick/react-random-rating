import React, { Component } from 'react'
import axios from 'axios';
import ReadMoreReact from 'read-more-react';
import Rating from '@material-ui/lab/Rating';
import StarRatingComponent from 'react-star-rating-component';



import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';

const IMG_PATH = 'https://image.tmdb.org/t/p/w185_and_h278_bestv2/';

export default class Home extends Component {
    // constructor(props){
    //     super(props)
    //     this.state = {
    //       movielists: []
    //     }
    //   }

    state = {
        movies: [],
        newMovieData: {
          title: "",
          rating: ""
        },
        editMovieData: {
          id: "",
          rating: ""
        },
        newMovieModal: false,
        editEditModal: false
      };

      componentDidMount(){
         
         this._refreshMovies();
      }

      _refreshMovies() {
        axios.get("https://localhost:3000/results").then(response => {
          this.setState({
            movies: response.data
          });
        });
      }


      onStarClick(nextValue, prevValue, name) {
        const movie_id = name.split("-").pop() // remove string
         
        //this.setState({id:movie_id,rating: nextValue});
        this.setState({
            editMovieData: { id:movie_id,rating: nextValue }
          });

        console.log(this.state)
      }
      

    render() {
        console.log(this.state.movies)
        var  getData =  this.state.movies;
        const minimumLength = 50
        const idealLength = 100
        const maxLength = 200

        return (
            <div className="container movielist">
            <h3>Movie List</h3>
             <div className="row" >
            {getData.map((gh, i)=>(
            
            <div className="col s6 card horizontal" key={i}>
            <div className="card-image">  
            <img src={IMG_PATH+gh.poster_path} alt={gh.title}/>
            </div> 
            <div className="card-stacked">  
            <h5>{gh.title}</h5>
           
            {/* <p className="card-content">{gh.overview}</p> */}
            <ReadMoreReact text={gh.overview}
                min={minimumLength}
                ideal={idealLength}
                max={maxLength}
                readMoreText="Read more..."/>
            <div className="card-action">
                 
            {gh.rating}
         <StarRatingComponent 
          name= { "movie-id-" + gh.id }  
          starCount={5}
          value={gh.rating}
          onStarClick={this.onStarClick.bind(this)}
        />
          
            
            </div>
            </div>
            </div>
            ))} 
    
            
            </div>
            </div>
            
        )
    }
}
