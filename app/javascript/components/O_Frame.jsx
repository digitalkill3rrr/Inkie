import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import M_Image from '../components/M_Image'
import M_Text from '../components/M_Text'
import M_Speech from '../components/M_Speech'

export default class O_Frame extends React.Component {
  constructor(props, context) {
    super(props, context)
  }

  render() {
    let objects = []

    if (this.props.objects) {
      this.props.objects.map((object, i) => {
        if (object.type == "image") {
          objects.push(
            <M_Image
              image={ object }
              key={ i }
              index={ i }
              objects={ this.props.objects[i] }
              translateX={ this.props.translateX }
            />
          )
        }
        if (object.type == "text") {
          objects.push(
            <M_Text
              text={ object }
              key={ i }
              index={ i }
              objects={ this.props.objects[i] }
              translateX={ this.props.translateX }
            />
          )
        }
        if (object.type == "speech") {
          objects.push(
            <M_Speech
              speech={ object }
              key={ i }
              index={ i }
              objects={ this.props.objects[i] }
              translateX={ this.props.translateX }
            />
          )
        }
      })
    }

    const styles = {
      left: this.props.frame.left,
      top: this.props.frame.top,
      width: this.props.frame.width,
      height: this.props.frame.height
      }

    if (this.props.frame.background_image) {
      styles.backgroundImage = "url(" + this.props.frame.background_image + ")"
    }

    if (this.props.frame.background_color) {
      styles.backgroundColor = '#' + this.props.frame.background_color
    }

    if (this.props.frame.z_index) {
      styles.z_index = this.props.frame.z_index
    }

    return(
      <div
        className="O_Frame"
        style={ styles }
      >
        { objects }
      </div>
    )
  }
}
