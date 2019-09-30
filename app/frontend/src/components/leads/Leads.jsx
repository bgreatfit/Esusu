import React, {Component} from 'react';

export class Leads extends Component {
    constructor(props){
        super(props);
        this.state = {
            color:"red"
        }
    }
    ChangeColor = ()=>{
        this.setState({color:"blue"});
    };
    render() {
        return (
            <div>
                <h1>{this.state.color}</h1>
                <h1>{this.props.name}</h1>
                <button type="button" onClick={this.ChangeColor} >
                     Color
                </button>
            </div>
        );
    }
}

export default Leads;