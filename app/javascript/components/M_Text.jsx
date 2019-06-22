import _ from 'lodash'
import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class M_Text extends React.Component {
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
    if (this.props.text.click) {
      this.setState({
        click: true
      })
    }
  }

  render() {
    const styles = {
      left: this.props.text.left,
      top: this.props.text.top,
      width: this.props.text.width,
      height: this.props.text.height,
      fontSize: this.props.text.size,
      transform: ''
    }

    let text

    if (this.props.text.speedX) {
      let translateX = this.props.translateX * this.props.image.speedX
      styles.transform += 'translateX(' + translateX + 'px)'
    }

    if (this.props.text.speedY) {
      let translateY = this.props.translateX * this.props.text.speedY
      styles.transform += ' translateY(' + translateY + 'px)'
    }

    if (this.props.text.color) {
      styles.color = '#' + this.props.text.color
    }

    if (this.props.text.link) {
      text = <a href={this.props.text.link} className="M_Text" style={ styles }>{ this.props.text.text }</a>
    } else {
      text = <div className="M_Text" style={ styles }>{ this.props.text.text }</div>
    }

    if (this.state.click) {
      styles.opacity = 0
    }

    return(
      <div onClick = { this.handleClick }>{ text }</div>
    )
  }
}
