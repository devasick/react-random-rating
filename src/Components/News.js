import React, { Component } from 'react';
import axios from 'axios';
import {Link} from "react-router-dom";
const API_PATH = 'http://127.0.0.1:8000/api/';
const IMG_PATH = 'http://127.0.0.1:8000/storage/';


class News extends Component {

    constructor(props){
        super(props)
        this.state = {
          posts: []
        }
      }

      componentDidMount(){
        console.log(this.props)
        axios.post(API_PATH+'posts')
        .then(
          newData => this.setState({
            posts: newData.data,
          })
       
          )
        .catch(error => alert(error))
      }

    render() {
        var  getData =  this.state.posts;
        

      
        return (
            <div>
            {getData.map((gh, i)=>(
            <div key={i}>
           
            <Link to={`/news/${gh.slug}`}><h1>{gh.title}</h1></Link>
              
            <img src={IMG_PATH+gh.image} alt={gh.title}/>
            <p>{gh.excerpt}</p>

            </div>
            ))} 
            </div>
        );
    }
}



export default News;