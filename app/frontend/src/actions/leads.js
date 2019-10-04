import axios from 'axios';
import {GET_LEADS,DELETE_LEAD, POST_LEAD} from '../actions/types.js';

//GET LEADS
export const getLeads = ()=>dispatch=>{
    axios
        .get('/api/leads/')
        .then(res=>{
            dispatch({
                type:GET_LEADS,
                 payload:res.data
            })
        })
        .catch(err=>console.log(err))
};
export const deleteLead = (id)=>dispatch=>{
    axios
        .delete(`/api/leads/${id}`)
        .then(res=>{
            console.log(id,'me');
            dispatch({
                type:DELETE_LEAD,
                 payload:id
            })
        })
        .catch(err=>console.log(err,'Here'));
};

export const postLead = (name, email, message)=>dispatch=>{
    console.log(name, email, message);
    axios
        .post(`/api/leads/`,
            {
                name: name,
                email: email,
                message: message,
            })
        .then(res=>{
            console.log(id,'me');
            dispatch({
                type:POST_LEAD,
                 payload:{name,email,message}
            })
        })
        .catch(err=>console.log(err,'Here'));
};
