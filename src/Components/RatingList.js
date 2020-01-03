import React, { Component } from 'react'
import axios from 'axios';
import ReadMoreReact from 'read-more-react';
import Rating from '@material-ui/lab/Rating';
import Button from '@material-ui/core/Button';
import FlashMessage from 'react-flash-message'
// image path 
const IMG_PATH = 'https://image.tmdb.org/t/p/w185_and_h278_bestv2/';
const URL_PATH = 'https://react-api-demo123.herokuapp.com/api/';
//const URL_PATH = 'http://localhost:9000/api/';  // local url
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
          //editdata:[],
          filter:"",
          alert:false,
          isActive:false
        }

      }

       componentWillMount(){
         
         this._refreshMovies();   
      }

      _refreshMovies() {
        axios.get(URL_PATH+"all").then(response => {
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
          .put(URL_PATH+"send", {
            id:movie_id,rating:rating_star
          })
          .then(response => {
              
              this.setState({alert:true})
              this._refreshMovies();
              

          });
       
      };
     // get random rating

      async getMovies(){

        axios.get(URL_PATH+"rand").then(response => {
             
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
        // Button
        const isButtonClick = this.state.isActive;
        let button;
        if (isButtonClick) {
          button = <Button className="button-stop" onClick={this.stopbutton} >Stop</Button>;
        } else {
          button = <Button variant="contained" color="secondary" onClick={this.handleClick} ><i className="material-icons play_arrow"></i>Random Rating</Button>;
        }

       
         
          function SuccessAlert(props) {
            if (!props.alert) {
              return null;
            }
            return (
              <FlashMessage duration={2500}>
              <div className="msg">
              <strong>Your rating has been saved !</strong>
              </div>
              </FlashMessage>
            );
          }
        
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
        
        <div>
           <SuccessAlert alert={this.state.alert} /> 
        </div>
        <div className="row">
        <div className="col m4 s4">
        <label>Sort By</label>
          <select onChange={this.filterChamp.bind(this)} value={this.state.filterChamp} className="browser-default">
              <option value="0">Select</option>
              <option value="desc">Rating Descending</option>
              <option value="asc">Rating Ascending</option>
          </select>
         </div>
         <div className="col s5 random-rating-button">
         {button}
         </div>
       
        </div> 
             <div className="row">    
            {getData.map((gh, i)=>(
            
            <div className="col s12 m6 l6 card horizontal box" key={i}>
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
