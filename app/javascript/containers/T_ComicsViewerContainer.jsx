import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import O_Frame from '../components/O_Frame'

export default class T_ComicsViewerContainer extends React.Component {
  constructor(props, context) {
    super(props, context)
  }

  render() {
    let frames = []
    this.props.frames.map((frame, i) => {
      frames.push(
        <O_Frame
          frame={ frame }
          key={ i }
          index={ i }
          objects={ this.props.objects[i] }
        />
      )
    })

    return(
      <div className="T_ComicsViewerContainer">
        { frames }
      </div>
    )
  }
}
