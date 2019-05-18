// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import T_ComicsViewerContainer from '../containers/T_ComicsViewerContainer'

const T_ComicsViewer = props => (
  <div className="T_ComicsViewer">
    <T_ComicsViewerContainer {...props} />
  </div>
)

fetch('../../../../story1.json')
  .then((res) => res.json())
  .then((data) => {
    console.log('data:', data)
  })

document.addEventListener('DOMContentLoaded', () => {
  let frames = JSON.parse(document.getElementById('T_ComicsViewer').dataset.frames)
  let objects = JSON.parse(document.getElementById('T_ComicsViewer').dataset.objects)

  ReactDOM.render(
    <T_ComicsViewer frames={frames} objects={objects}/>,
    document.getElementById('T_ComicsViewer')
  )
})
