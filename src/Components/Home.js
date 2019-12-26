import React, { Component } from 'react'
import axios from 'axios';
import ReadMoreReact from 'read-more-react';

const IMG_PATH = 'https://image.tmdb.org/t/p/w185_and_h278_bestv2/';

export default class Home extends Component {
    constructor(props){
        super(props)
        this.state = {
          movielists: []
        }
      }

      componentDidMount(){
         
        axios.get('./movie-response.json')
        .then(
          newData => this.setState({
            movielists: newData.data.results,
          })
       
          )
        .catch(error => alert(error))
      }

      

    render() {
        console.log(this.state.movielists)
        var  getData =  this.state.movielists;
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
                {gh.vote_average}
            
            </div>
            </div>
            </div>
            ))} 
    
            
            </div>
            </div>
            
        )
    }
}
