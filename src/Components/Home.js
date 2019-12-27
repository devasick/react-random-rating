import React, { Component } from 'react'
import axios from 'axios';
import ReadMoreReact from 'read-more-react';
import Rating from '@material-ui/lab/Rating';
import StarRatingComponent from 'react-star-rating-component'
import Select from '@material-ui/core/Select';
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText';

const IMG_PATH = 'https://image.tmdb.org/t/p/w185_and_h278_bestv2/';

export default class Home extends Component {
    constructor(props){
        super(props)
        this.state = {
          movies: [],
          editMovieData: {
            id: "",
            rating: ""
          },
          filter:""
        }
        
      }
 

       componentWillMount(){
         
         this._refreshMovies();
      }

      _refreshMovies() {
        axios.get("http://localhost:3000/results").then(response => {
          this.setState({
            movies: response.data
          });
        });
      }

      filter(e){
        
        this.setState({filter: e.target.value})
      }
    
      filterChamp(e){
         
        this.setState({filter: e.target.value})
      }

     

      updateMovie() {
        let {  rating } = this.state.editMovieData;
        
        axios
          .put("http://localhost:3000/results/" + this.state.editMovieData.id, {
            rating
          })
          .then(response => {
            this._refreshBooks();
            this.setState({
              editBookData: {
                id: "",
                rating: ""
              }
            });
             
          });
      }


      onStarClick(nextValue, prevValue, name) {
        
        const movie_id = name.split("-").pop() // remove string
        console.log(this.state)
        this.setState({
            editMovieData: { id:movie_id,rating: nextValue }
          });

      }
      

    render() {
  
        var  getData =  this.state.movies;
        if(this.state.filter){
            
            if(this.state.filter == 'desc'){
            getData.sort((a, b) => b.rating - a.rating);
            } 
            else if(this.state.filter == 'asc'){
            getData.sort((a, b) => a.rating - b.rating);    
            } else if(this.state.filter == '0'){
                getData.sort((a, b) => a.id - b.id);    
            }
        }  
        const minimumLength = 50
        const idealLength = 100
        const maxLength = 200
         
         
         
        return (
            <div className="container movielist">
            <h3>Movie List</h3>
        <div className="row">
        <div className="col s3">
        <label>Sort By</label>
        <select onChange={this.filterChamp.bind(this)} value={this.state.filterChamp} className="browser-default">
          <option value="0">Select</option>
          <option value="desc">Rating Descending</option>
          <option value="asc">Rating Ascending</option>
        </select>
         </div>
        </div>

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
