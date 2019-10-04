import React, {Component} from 'react';
import {connect} from "react-redux";
import {PropTypes} from "prop-types";
import {getLeads, deleteLead} from "../../actions/leads";

export class Leads extends Component {
    constructor(props){
        super(props);
        this.state = {
            color:"red"
        };
        this.deleteLead =  this.deleteLead.bind(this)
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
    deleteLead = (id) =>{
        this.props.deleteLead(id);
    };
    render() {
        return (
            <>
                <div>
                    <table className="table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>EMAIL</th>
                            <th>MESSAGE</th>
                            <th/>
                        </tr>
                        </thead>
                        <tbody>
                        {this.props.leads.map(
                            lead=>(
                                <tr key={lead.id}>
                                    <td>{lead.id}</td>
                                    <td>{lead.name}</td>
                                    <td>{lead.email}</td>
                                    <td>{lead.message}</td>
                                    <td><button className="btn-danger btn-sm"
                                                onClick={this.deleteLead.bind(this,lead.id)}>DELETE</button></td>
                                </tr>

                            )


                        )}
                        <tr>
                            <td>

                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <h1>{this.state.color}</h1>
                    <h1>{this.props.name}</h1>
                    <button type="button" onClick={this.ChangeColor} >
                         Color
                    </button>
                </div>
            </>
        );
    }
}

const mapStateToProps = state=>({
    leads:state.leads.leads
});

export default connect(mapStateToProps,{getLeads, deleteLead})(Leads);