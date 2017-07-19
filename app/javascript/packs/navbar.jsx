// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class NavBar extends React.Component {
  render(){
    let rightNav = null;
    if(true){
      rightNav = (
        <a href="#">
          <img className="profile-pic-thumbnail" src="https://driftmap.s3.amazonaws.com/uploads/user/profile_pic/1/profile.jpg" />
        </a>
      )
    }

    return (
      <nav className="navbar navbar-toggleable-md navbar-light navbar-inverse bg-inverse">
        <button className="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>
        <a className="navbar-brand" href="/">driftMap</a>

        <div className="collapse navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav mr-auto">
            <li className="nav-item" data-toggle="modal" data-target="#readme-modal">
              <a className="nav-link" href="#">read me <span className="sr-only">(current)</span></a>
            </li>
          </ul>
          {rightNav}
        </div>
      </nav>
    )
  }
}

NavBar.defaultProps = {}
NavBar.propTypes = {}


document.addEventListener('DOMContentLoaded', ReactDOM.render(<NavBar />, document.getElementById('navbar-container')))