import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class M_Image extends React.Component {
  constructor(props, context) {
    super(props, context)
  }

  render() {
    const styles = {
      left: this.props.image.left,
      top: this.props.image.top,
      width: this.props.image.width,
      height: this.props.image.height,
      backgroundImage: "url(" + this.props.image.background_image + ")",
    }

    let image

    if (this.props.image.link) {
      image = <a href={this.props.image.link} className="M_Image" style={ styles }></a>
    } else {
      image = <div className="M_Image" style={ styles }></div>
    }

    return(
      <div>{ image }</div>
    )
  }
}
