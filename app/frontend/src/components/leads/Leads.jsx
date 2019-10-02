import React, {Component} from 'react';
import {connect} from "react-redux";
import {PropTypes} from "prop-types";
import {getLeads} from "../../actions/leads";

export class Leads extends Component {
    constructor(props){
        super(props);
        this.state = {
            color:"red"
        }
    }
    static propType = {
        leads:PropTypes.array.isRequired
    };
    componentDidMount(){
        this.props.getLeads();
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

const mapStateToProps = state=>({
    leads:state.leads.leads
});

export default connect(mapStateToProps,{getLeads})(Leads);