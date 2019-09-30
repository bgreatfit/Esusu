import React, {Component, Fragment } from 'react';
import ReactDOM from 'react-dom';
import Header from './layouts/Header.jsx';
import Clock from './layouts/Clock.jsx';
import Dashboard from "./leads/Dashboard.jsx";
import {FilterableProductTable} from "./leads/Product.jsx";

class App extends Component {
  render(){
      return(
          <Fragment>
               <Header/>
               <Clock/>
                <div className="container">
                     <Dashboard/>
                </div>
              <FilterableProductTable products={this.props.products}/>

          </Fragment>


      )
  }
}
const PRODUCTS = [
  {category: 'Sporting Goods', price: '$49.99', stocked: true, name: 'Football'},
  {category: 'Sporting Goods', price: '$9.99', stocked: true, name: 'Baseball'},
  {category: 'Sporting Goods', price: '$29.99', stocked: false, name: 'Basketball'},
  {category: 'Electronics', price: '$99.99', stocked: true, name: 'iPod Touch'},
  {category: 'Electronics', price: '$399.99', stocked: false, name: 'iPhone 5'},
  {category: 'Electronics', price: '$199.99', stocked: true, name: 'Nexus 7'}
];

ReactDOM.render(<App products={PRODUCTS}/>, document.getElementById('app'));
