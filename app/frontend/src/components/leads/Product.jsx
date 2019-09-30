import React, {Component} from 'react'

class ProductCategoryRow extends Component{
    render() {
        const category = this.props.category;
        return (
                 <tr>
                    <th colSpan="2"> {category}</th>
                </tr>
            )

    }
}
class ProductRow extends Component{
    render() {
        const product = this.props.product;
        const name = product.stocked ? product.name:
            <span style={{color:'red'}}>{ product.name}</span>;
        return (
                 <tr>
                    <td> {name}</td>
                    <td> {product.price}</td>
                </tr>
            )

    }
}
class ProductTable extends Component{
    render() {
        const filterText = this.props.filterText;
        const inStockOnly = this.props.inStockOnly;
        const rows = [];
        let lastCategory = null;
        this.props.products.forEach((product)=>{
            if (product.category !== lastCategory) {
                 console.log(inStockOnly, 'here1');
                 console.log(product.stocked, 'here2');
                if(inStockOnly && !product.stocked){
                    return "";
                }

                if(product.name.indexOf(filterText) === -1){
                    return "";
                }
                rows.push(
                    <ProductCategoryRow
                        category={product.category}
                        key={product.category}
                    />
                )
            }
            console.log(product);
            rows.push(
                <ProductRow
                 product={product}
                 key = {product.name}
                />
            );
            lastCategory = product.category;
            });
            return (
                 <table>
                     <thead>
                     <tr>
                         <th>Name</th>
                         <th>Price</th>
                     </tr>
                     </thead>
                     <tbody>{rows}</tbody>
                </table>
            );
        }}

class SearchBar extends React.Component {
    constructor(props) {
        super(props);
        this.handleFilterTextChange = this.handleFilterTextChange.bind(this);
        this.handleInStockChange = this.handleInStockChange.bind(this);

    }

    handleFilterTextChange(e){
        console.log(e.target.value);
        this.props.onFilterTextChange(e.target.value)
    }
    handleInStockChange(e){
        this.props.onInStockChange(e.target.checked)
    }

  render() {
      const filterText = this.props.filterText;
      const inStockOnly = this.props.inStockOnly;
    return (
      <form>
        <input type="text"
               placeholder="Search..."
               value={filterText}
               onChange={this.handleFilterTextChange}
        />
        <p>
            here
            <input type={'checkbox'}/>
          <input type={'checkbox'}
                 checked={this.props.inStockOnly}
                 onChange={this.handleInStockChange}
          />
          {' '}
          Only show products in stock
        </p>
      </form>
    );
  }
}

export class FilterableProductTable extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            filterText: '',
            inStockOnly :false
        };
        this.handleFilterTextChange = this.handleFilterTextChange.bind(this);
        this.handleStockChange = this.handleStockChange.bind(this);


    }
  handleFilterTextChange(filterText){
        this.setState(
            {
                filterText: filterText
            }
        )
  }
  handleStockChange(isStockOnly){
        this.setState(
            {
                isStockOnly: isStockOnly
            }
        )
  }

  render() {
    return (
      <div>
        <SearchBar
            filterText={this.state.filterText}
            inStockOnly={this.state.inStockOnly}
            onFilterTextChange={this.handleFilterTextChange}
            onInStockChange={this.handleStockChange}

        />
        <ProductTable
            products={this.props.products}
            filterText={this.state.filterText}
            inStockOnly={this.state.inStockOnly}
        />
      </div>
    );
  }
}
