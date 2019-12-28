import React, { Component } from 'react'
import axios from 'axios';
import ReadMoreReact from 'read-more-react';
import Rating from '@material-ui/lab/Rating';
import Button from '@material-ui/core/Button';



const IMG_PATH = 'https://image.tmdb.org/t/p/w185_and_h278_bestv2/';
const minimumLength = 50
const idealLength = 100
const maxLength = 200
 

export default class Home extends Component {
    constructor(props){
        super(props)
        this.state = {
          movies: [],
          editdata:[],
          filter:"",
        }
    
        
      }

       componentWillMount(){
         
         this._refreshMovies();

        // this.timer = setInterval(()=> this.getMovies(), 1000)
      }

      _refreshMovies() {
        axios.get("http://asickweb.com/api/?getvalue").then(response => {
          console.log(response.data)
          this.setState({
            movies: response.data
          });
        });
      }

      
      // function for sorting
      filterChamp(e){
        this.setState({filter: e.target.value})
      }

      

      handleNameInput = e => {
        const rating_star =  e.target.value;
        const movie_id = e.target.name.split("-").pop()
        axios
          .post("http://asickweb.com/api/?", {
            id:movie_id,rating:rating_star
          })
          .then(response => {
              console.log(response)
              this._refreshMovies();

          });
       
      };

      handleClick() {
         
    
        console.log('dddd')
       
      }

      async getMovies(){

        fetch('http://asickweb.com/api/?getvalue', {method: "GET"})
         .then((response) => response.json())
         .then((responseData) =>
         {
           //set your data here
            console.log(responseData);
         })
         .catch((error) => {
             console.error(error);
         });
       
       }

    

    render() {
      
        const  getData =  this.state.movies;
        // sorting lowest rating & highest 
        if(this.state.filter){

            if(this.state.filter == 'desc'){
                getData.sort((a, b) => b.rating - a.rating);
            } else if(this.state.filter == 'asc'){
                getData.sort((a, b) => a.rating - b.rating);    
            } else if(this.state.filter == '0'){
                getData.sort((a, b) => a.id - b.id);    
            }
        } 
        // star 
        
         
         
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
         <div className="col s9 random-rating-button">
         <Button variant="contained" color="secondary" onClick={this.handleClick}>
  Random Rating
</Button>
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
                 
        <Rating
            name= { "movie-id-" + gh.id }  
            value={gh.rating}
            max={5}
            onChange={this.handleNameInput}
            />

          <div>The number is: {this.state.random}</div>
          
            
            </div>
            </div>
            </div>
            ))} 
    
            
            </div>
            </div>
            
        )
    }
}
