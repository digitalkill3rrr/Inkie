import _ from 'lodash'
import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class M_Image extends React.Component {
  constructor(props, context) {
    super(props, context)
    this.state = {
      click: false
    }
    _.bindAll(
      this,
      'handleClick',
    )
  }

  handleClick() {
    if (this.props.image.click) {
      this.setState({
        click: true
      })
    }
  }

  render() {
    const styles = {
      left: this.props.image.left,
      top: this.props.image.top,
      width: this.props.image.width,
      height: this.props.image.height,
      backgroundImage: "url(" + this.props.image.background_image + ")",
      backgroundSize: "cover",
      transform: ''
    }

    let image

    if (this.props.image.link) {
      image = <a href={this.props.image.link} className="M_Image" style={ styles }></a>
    } else {
      image = <div className="M_Image" style={ styles }></div>
    }

    if (this.props.image.speedX) {
      let translateX = -Math.abs(this.props.translateX-this.props.image.left) * this.props.image.speedX
      styles.transform += ' translateX(' + translateX + 'px)'
    }

    if (this.props.image.speedY) {
      let translateY = this.props.translateX * this.props.image.speedY
      styles.transform += ' translateY(' + translateY + 'px)'
    }

    if (this.props.image.scale) {
      let scale = -this.props.translateX * this.props.image.scale + 1
      styles.transform += ' scale(' + scale + ')'
    }

    if (this.props.image.opacity) {
      let opacity = this.props.translateX * this.props.image.opacity + 1
      styles.opacity = opacity
    }

    if (this.state.click) {
      styles.opacity = 0
    }

    return(
      <div
        onClick = { this.handleClick }
      >
        { image }
      </div>
    )
  }
}
