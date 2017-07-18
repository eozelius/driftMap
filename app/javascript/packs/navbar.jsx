// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const NavBar = props => (
  <div>hello {props.name} you fuckgg</div>
)

NavBar.defaultProps = {
  name: 'David'
}

NavBar.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <NavBar name="ethan" />,
    document.body.appendChild(document.createElement('div')),
  )
})
