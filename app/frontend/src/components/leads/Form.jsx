import React, {Component} from 'react';
import {postLead} from "../../actions/leads";
import {connect} from "react-redux";


export class Form extends Component {
    constructor(prop){
        super(prop);
        this.handleSubmit = this.handleSubmit.bind(this);

    }
    handleSubmit = (e)=> {
        e.preventDefault();
        const data = new FormData(e.target);
        const [name,email,message] = data;
        console.log(name,email,message);
        this.props.postLead(data);
    };
    handleInputChange(event) {
        // const target = event.target;
        // const value = target.type === 'checkbox' ? target.checked : target.value;
        // const name = target.name;
        //
        // this.setState({
        //   [name]: value
        // });
  }
    handleInputChange = ()=>{
      //  this.props.postLead();

    };

    render() {
        return (
            <div>
                <h1>Add  Leads</h1>
                <form className="form-group-sm form-control" onSubmit={this.handleSubmit}>
                    <input name="name" value=""/>
                    <input name="email" value=""/>
                    <input name="message" value=""/>
                    <button> SUBMIT</button>
                </form>
            </div>
        );
    }
}

const mapStateToProps = state=>({
    leads:state.leads.leads
});

export default connect(mapStateToProps,{postLead})(Form);