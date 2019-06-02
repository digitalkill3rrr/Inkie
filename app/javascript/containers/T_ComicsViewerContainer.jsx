import _ from 'lodash'
import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import O_Frame from '../components/O_Frame'

export default class T_ComicsViewerContainer extends React.Component {
  constructor(props, context) {
    super(props, context)
    this.state = {
      translateX: 0
    }
    _.bindAll(
      this,
      'handleWheel'
    )
  }

  handleWheel(e){
    // console.log(this.state.translateX);
    let localDeltaY = this.state.translateX - e.deltaY

    if (0 < localDeltaY) {
      this.setState({
        translateX: 0
      })
    } else if (Math.abs(localDeltaY) > document.getElementsByClassName('T_ComicsViewerContainer')[0].offsetWidth) {
      this.setState({
        translateX: - document.getElementsByClassName('T_ComicsViewerContainer')[0].offsetWidth
      })
    } else {
      this.setState({
        translateX: this.state.translateX - e.deltaY
      })
    }
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
          translateX={ this.state.translateX }
        />
      )
    })

    const translateX = {
      transform: 'translateX(' + this.state.translateX + 'px)'
    }

    const styles = {}

    if (this.props.story.background_color) {
      styles.backgroundColor = '#' + this.props.story.background_color
    }

    // console.log(styles);

    return(
      <div className="T_ComicsViewerContainer"
        onWheel = {(e) => this.handleWheel(e)}
        style={ styles }
        >
        <div
          className="T_ComicsViewerContainerContainer"
          style={ translateX }
          >
            { frames }
        </div>
      </div>
    )
  }
}
