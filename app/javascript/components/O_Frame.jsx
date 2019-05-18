import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import M_Image from '../components/M_Image'
import M_Text from '../components/M_Text'

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
