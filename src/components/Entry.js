import React, { Component } from 'react';
import './App.css'

class Entry extends Component {

	constructor(props) {
		super(props);
		this.state = {
		  myData: []
		};
	  }

	  async fetchData() {
		const data = await this.props.getArr(this.props.product.id.toNumber());
		console.log(data)
		this.setState({ myData: data });
	  }
	  componentDidMount() {
		this.fetchData();
	  }

	  

  render() {
	const { myData } = this.state;
	const concatenatedData = myData.join(" "); 

    return (
	((this.props.product.upvotes < 4) ?
		<tr key={this.props.key}>
	   { !this.props.product.purchased
		   ?
	   <td>{this.props.name}</td> : null}
	   { !this.props.product.purchased
		   ?
	   <td>{window.web3.utils.fromWei(this.props.product.price.toString(), 'Ether')} MATIC</td> : null}
	   { !this.props.product.purchased
		   ?
	   <td>{this.props.upvotes.toString()}</td>: null}
	   { !this.props.product.purchased
		   ?
	   <td>{this.props.product.owner}</td>: null}
		<td dangerouslySetInnerHTML={{ __html: concatenatedData}}></td>
	   <td>
		 { !this.props.product.purchased
		   ?<button
		   name={this.props.product.id}
		   value={this.props.product.price}
		   onClick={(event) => {
			if(this.props.product.upvotes <= 0) {
				window.alert('Cannot upvote your sentnece')
			}

			if(this.props.product.upvotes >= 1) {
				window.alert('Need 3 upvotes to go into the story')
				window.alert('You can upvote muliple times')
			}
			
			 this.props.purchaseProduct(event.target.name, event.target.value)
		   }}
		   className="btn btn-primary"
		   style={{
				marginLeft: '1%',
				//marginTop: '1%',
				padding: '3% 10%',
				background: '#f2f2f2',
				color: '#333',
				border: '4px solid #599ee9',
				borderRadius: '3px',
				fontSize: '1.1vw',
				cursor: 'pointer',
				textTransform: 'uppercase',
				fontWeight: 'bold',
				letterSpacing: '0.1vw', 
				height: '100%',
		  }}  
		 >
		   Upvote
		 </button>
		 
		   : null
		 }
		 </td>
		 
	 </tr>: null)
    );


	
  }
}

export default Entry;
