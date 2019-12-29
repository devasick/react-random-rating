import React, { Component } from 'react'
import axios from 'axios';
import ReadMoreReact from 'read-more-react';
import Rating from '@material-ui/lab/Rating';
import Button from '@material-ui/core/Button';
// image path 
const IMG_PATH = 'https://image.tmdb.org/t/p/w185_and_h278_bestv2/';
const URL_PATH = 'http://asickweb.com/api/';
//const URL_PATH = 'http://localhost/api-rating/';
// view more content
const minimumLength = 50
const idealLength = 100
const maxLength = 200
 

export default class RatingList extends Component {
    constructor(props){
        super(props)
        this.handleClick = this.handleClick.bind(this);
        this.stopbutton = this.stopbutton.bind(this);
        this.state = {
          movies: [],
          editdata:[],
          filter:"",
          alert:false,
          cls:"",
          isActive:false
        }

      }

       componentWillMount(){
         
         this._refreshMovies();   
      }

      _refreshMovies() {
        axios.get(URL_PATH + "?getvalue").then(response => {
          this.setState({
            movies: response.data
          });
        });
      }
      // function for sorting
      filterChamp(e){
        this.setState({filter: e.target.value})
      }
      // add rating 
      handleNameInput = e => {
        const rating_star =  e.target.value;
        const movie_id = e.target.name.split("-").pop()
        axios
          .post(URL_PATH, {
            id:movie_id,rating:rating_star
          })
          .then(response => {
              
              this.setState({alert: 'Your rating has been saved !',cls:"msg"})
              this._refreshMovies();
              

          });
       
      };
     // get random rating

      async getMovies(){

        axios.get(URL_PATH + "?getRandom").then(response => {
             
             this.setState({
               movies: response.data
             });
           
           });    
       }
       // stop button action
       stopbutton() {
          
        this.setState({isActive: false}, () => {
          clearInterval(this.intervalID);
          
       });
      }
      // random button action
      handleClick(){
     
        this.setState({isActive: true}, () => {
           
           this.intervalID  = setInterval(()=> this.getMovies(), 1000)
        });
         
             
      }
    

    render() {

        const alert = this.state.alert;
        const cls = this.state.cls;
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
        
        
         
        return (
          
        <div className="container movielist">
        <h3>Movie List</h3>
        <div className={cls}>
           {alert}
        </div>
        <div className="row">
        <div className="col s3">
        <label>Sort By</label>
          <select onChange={this.filterChamp.bind(this)} value={this.state.filterChamp} className="browser-default">
              <option value="0">Select</option>
              <option value="desc">Rating Descending</option>
              <option value="asc">Rating Ascending</option>
          </select>
         </div>
         <div className="col s5 random-rating-button">
            <Button variant="contained" color="secondary" onClick={() => this.handleClick("start")}>Random Rating</Button>
         </div>
         <div className="col s1 random-rating-button">
         <Button variant="contained" color="secondary" onClick={ (e) => this.stopbutton() }>Stop</Button>
         </div>
        </div> 
             <div className="row">    
            {getData.map((gh, i)=>(
            
            <div className="col s6 card horizontal box" key={i}>
              <div className="card-image">  
                <img src={IMG_PATH+gh.poster_path} alt={gh.title}/>
                </div> 
                <div className="card-stacked">  
                <h5>{gh.title}</h5>
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

                </div>
              </div>
            </div>
            
            ))} 
            </div>
            </div>
            
        )
    }
}
