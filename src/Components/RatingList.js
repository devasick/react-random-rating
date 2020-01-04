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
 
/**
 * @public
 * @class
 * RatingList to store the movies data like us movie title, movie rating, movie poster and overview.
 */
export default class RatingList extends Component {
   
/**
 * @public
 * @function
 * It can be used to bind event handlers to the component and/or initializing the local state of the component
 * movies [] - initializing movie values in array
 * filer - sorting
 * alert - message for after the add review 
 * isActive - variable for random button & stop button
 */
    
    constructor(props){
        super(props)
        this.handleClick = this.handleClick.bind(this);
        this.stopbutton = this.stopbutton.bind(this);
        this.state = {
          movies: [],
          filter:"",
          alert:false,
          isActive:false,
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
      /**
       * @function
       * this function for sorting to set state Descending & Acending
       * filter  -   set state value desc & asc
       */
      filterChamp(e){
        this.setState({filter: e.target.value})
      }

      /**
       * @function
       * this function will trigger when we click the star icon
       * rating_star  -  number of rating star ( 1 to 5 )
       * movie_id -  get id from star icon and remove the string to int
       * alert -  message for success to setState to true
       */
      handleNameInput = e => {
        const rating_star =  e.target.value;
        const movie_id = e.target.name.split("-").pop()
        axios
          .put(URL_PATH+"send", {
            id:movie_id,rating:rating_star
          })
          .then(response => {
              this._refreshMovies();
              this.setState({ alert: true}, () => {
                setTimeout(() => { this.setState({ alert: false }) }, 2000);
              })
              
          });
       
      };
       /**
       * @function
       * this function will trigger when we click the random button
       * rating_star  -  number of rating star ( 1 to 5 )
       * movie_id -  get id from star icon and remove the string to int
       * alert -  message for success to setState to true
       */

      async getMovies(){

        axios.get(URL_PATH+"rand").then(response => {
             
             this.setState({
               movies: response.data
             });
           
           });    
       }
       /**
       * @function
       * this function will trigger when we click the stop button
       * isActive  -  random button will false
       * clearInterval -  remove the random data 
       */
       stopbutton() {
          
        this.setState({isActive: false}, () => {
          clearInterval(this.randomData);
          
       });
      }
       /**
       * @function
       * this function will trigger when we click the Random Rating button
       * isActive  -  random button will True
       * setInterval -  random data will run automatically when we click the Random Rating button
       */
      handleClick(){
     
        this.setState({isActive: true}, () => {
           
           this.randomData  = setInterval(()=> this.getMovies(), 1000)
        });
                      
      }
    

    render() {
        /** isButtonClick : True & Flase
         * Button Random Rating & Stop Button will shown
         * isActive  -   random button will True or False
         * handleClick - function trigger to random data
         * stopbutton  - function for stop the randdom data 
         */
        const isButtonClick = this.state.isActive;
        let button;
        if (isButtonClick) {
          button = <Button className="button-stop" onClick={this.stopbutton} >Stop</Button>;
        } else {
          button = <Button variant="contained" color="secondary" onClick={this.handleClick} ><i className="material-icons play_arrow"></i>Random Rating</Button>;
        }

       
      
        function SuccessAlert(props) {
          if (!props.alert) {
              return (null);
          }  
          return (
            <FlashMessage duration={2500}>
            <div className="msg">
            <strong>Your rating has been saved !</strong>
            </div>
            </FlashMessage>
          );
        }
        
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
                {this.state.alert ? <SuccessAlert alert={this.state.alert} /> : null}
                 
              </div>
              <div className="row">
                  <div className="col m4 s4 center-align">
                      <label>Sort By</label>
                      <select onChange={this.filterChamp.bind(this)} value={this.state.filterChamp} className="browser-default">
                          <option value="">Select</option>
                          <option value="desc">Rating Descending</option>
                          <option value="asc">Rating Ascending</option>
                      </select>
                  </div>
                  <div className="col s5 random-rating-button">
                  {button}
                  </div>
              </div> 
              <div className="row">    
                {getData.map((row, i)=>(
                    <div className="col s12 m6 l6 card horizontal box" key={i}>
                          <div className="card-image">  
                              <img src={IMG_PATH+row.poster_path} alt={row.title}/>
                          </div> 
                          <div className="card-stacked">  
                              <h5>{row.title}</h5>
                              <ReadMoreReact text={row.overview}
                                  min={minimumLength}
                                  ideal={idealLength}
                                  max={maxLength}
                                  readMoreText="Read more..."/>
                              <div className="card-action">           
                              <Rating
                                  name= { "movie-id-" + row.id }  
                                  value={row.rating}
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
