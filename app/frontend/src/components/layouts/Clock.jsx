import React, {Component} from 'react';
class Clock extends Component {
    constructor(props){
        super(props);
        this.state = {date: new Date(),isToggleOn:true};
        this.handleClick = this.handleClick.bind(this);
    }
    componentDidMount(){
        this.timerID = setInterval(
            ()=>this.tick(),1000
        )
    }
    componentWillUnmount(){
        clearInterval(this.timerID);
    }
    handleClick(){
        this.setState(state=>({
            isToggleOn:!state.isToggleOn
        }
        ))
    }
    tick(){
        this.setState({date: new Date()});
    }
    render(){
        return (
        <div>
            <button onClick={this.handleClick}>Hi {this.state.isToggleOn ? 'ON' : 'OFF'}</button>
            <h2> {this.state.date.toLocaleTimeString()}</h2>
        </div>
        )

    }
}

export default Clock