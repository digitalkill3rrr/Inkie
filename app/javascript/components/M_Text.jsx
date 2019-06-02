import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class M_Text extends React.Component {
  constructor(props, context) {
    super(props, context)
  }

  render() {
    const styles = {
      left: this.props.text.left,
      top: this.props.text.top,
      width: this.props.text.width,
      height: this.props.text.height
    }

    let text

    if (this.props.text.speed) {
      let translateX = this.props.translateX * this.props.image.speed
      styles.transform = 'translateX(' + translateX + 'px)'
    }

    if (this.props.text.color) {
      styles.color = '#' + this.props.text.color
    }

    if (this.props.text.link) {
      text = <a href={this.props.text.link} className="M_Text" style={ styles }>{ this.props.text.text }</a>
    } else {
      text = <div className="M_Text" style={ styles }>{ this.props.text.text }</div>
    }

    return(
      <div>{ text }</div>
    )
  }
}
