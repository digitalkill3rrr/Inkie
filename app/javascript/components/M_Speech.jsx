import _ from 'lodash'
import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class M_Speech extends React.Component {
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
    if (this.props.speech.click) {
      this.setState({
        click: true
      })
    }
  }

  render() {
    const styles = {
      left: this.props.speech.left,
      top: this.props.speech.top,
      width: this.props.speech.width,
      // height: this.props.speech.height
    }

    let speech

    let side = ''
    if (this.props.speech.side == 'left') {
      side = 'M_SpeechLeft'
    } else {
      side = 'M_SpeechRight'
    }

    if (this.props.speech.speedX) {
      let translateX = this.props.translateX * this.props.speech.speedX
      styles.transform = 'translateX(' + translateX + 'px)'
    }

    if (this.props.speech.speedY) {
      let translateY = this.props.translateX * this.props.speech.speedY
      styles.transform += ' translateY(' + translateY + 'px)'
    }

    if (this.props.speech.link) {
      speech = <a href={this.props.speech.link} className="M_Speech" style={ styles }>{ this.props.speech.text }</a>
    } else {
      speech = <div className={ "M_Speech " + side } style={ styles }>{ this.props.speech.text }</div>
    }

    if (this.props.speech.opacity) {
      let opacity = this.props.translateX * this.props.speech.opacity + 1
      styles.opacity = opacity
    }

    if (this.state.click) {
      styles.opacity = 0
    }

    return(
      <div onClick = { this.handleClick }>{ speech }</div>
    )
  }
}
