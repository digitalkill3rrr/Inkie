import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class M_Speech extends React.Component {
  constructor(props, context) {
    super(props, context)
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

    if (this.props.speech.speed) {
      let translateX = this.props.translateX * this.props.speech.speed
      styles.transform = 'translateX(' + translateX + 'px)'
    }

    if (this.props.speech.link) {
      speech = <a href={this.props.speech.link} className="M_Speech" style={ styles }>{ this.props.speech.text }</a>
    } else {
      speech = <div className={ "M_Speech " + side } style={ styles }>{ this.props.speech.text }</div>
    }



    return(
      <div>{ speech }</div>
    )
  }
}
