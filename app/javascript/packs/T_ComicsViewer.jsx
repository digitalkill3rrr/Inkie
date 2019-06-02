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

document.addEventListener('DOMContentLoaded', () => {
  let story_id = document.getElementById('T_ComicsViewer').dataset.story
  let url = '../../../../story' + story_id + '.json'
  console.log(url);

  let localdata = 'yo'
  var xhr = new XMLHttpRequest();
  xhr.open('GET', url, false);
  xhr.send();
  localdata = xhr.responseText
  // let frames = JSON.parse(document.getElementById('T_ComicsViewer').dataset.frames)
  // let objects = JSON.parse(document.getElementById('T_ComicsViewer').dataset.objects)
  let story = JSON.parse(localdata).story
  let frames = JSON.parse(localdata).frames
  let objects = JSON.parse(localdata).objects

  ReactDOM.render(
    <T_ComicsViewer frames={frames} objects={objects} story={story}/>,
    document.getElementById('T_ComicsViewer')
  )
})
