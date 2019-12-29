// Author: Asick Ahamed
import React, { Component } from 'react';
import axios from 'axios';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  NavLink
} from "react-router-dom";
import RatingList from "./RatingList";
import logo from '../Common/images/logo.png' 



class Header extends Component {
  

  
  render() {
   // const { items } = this.state;
    
 
    return (
     
      <Router>
      <header>
      <div className="navbar-fixed">
      <nav>
      <div className="nav-wrapper container">
        <a href="#" className="brand-logo"><img src={logo} alt={"logo"}/> </a>
        <ul id="nav-mobile" className="right hide-on-med-and-down container">
        <li>
        <Link to="/">Rating System</Link>
        </li>
        </ul>
      </div>
    </nav>
    </div>
        </header> 
        {/* A <Switch> looks through its children <Route>s and
            renders the first one that matches the current URL. */}
        <Switch>
        <Router basename={'/movie-rating'}>
        <Route exact path="/">
            <RatingList />
          </Route>
        </Router>
        </Switch>
      
    </Router>
    
    );
  }
}

export default Header;

