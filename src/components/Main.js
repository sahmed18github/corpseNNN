import React, { Component } from 'react';
import './App.css';
import Entry from './Entry'
import './typewriter.css'
import './Skull.css'

class Main extends Component {

  constructor(props) {
    super(props)
    this.state = {
      myArrContent: []
    }
  }


  render() {
    return (
<div id="content" className="content">
  <h1>
  Exquisite Corpse
  </h1>
<br>
  </br>
  <br>
  </br>
<div className="container">
<div className="skull">
		<div className="head">
			<div className="crack"></div>
		</div>
		<div className="mouth">
			<div className="teeth"></div>
		</div>
	</div>
  </div>
  <br>
  </br>
  <br>
  </br>
  <p>&nbsp;</p>
  <h2>How it Works</h2>
        <div style={{ textAlign: "center" }}>
        
        Every sentence is given a base price. Once a sentence, reaches 2 
        upvotes the word can no longer be purchased. The people who bought
         the sentence are listed as contributors to the story. Once 10 people 
         vote to end the story it is minted as its own contract available for 
         purchase. The contributors are then sent an equal proportion of the 
         sale of the story. You can see for each sentence a historical log of 
         every person who interacted with the sentence through upvoting. The 
         first contributor is always the person who made the original sentence.
        </div>
        <br>
        </br>
        <hr className="section-divider"></hr>
        <br>
        </br>
        <h2>Add a Sentence</h2>
        <form
  onSubmit={(event) => {
    event.preventDefault();
    const name = this.productName.value;
    const price = window.web3.utils.toWei("0.000005", 'Ether');
    var my_val = ['', '', ''];
    this.props.createProduct(name, price, 0, my_val);
  }}
  style={{
    display: 'flex',  // Add flex display to the form container
    justifyContent: 'space-between',  // Add space between form and button
    //maxWidth: '800px',  // Set the maximum width of the form
    margin: '0 auto',  // Center the form horizontally
  }}
>
  <div className="form-group mr-sm-2" style={{ flex: '1' }}>
    <input
      id="productName"
      type="text"
      ref={(input) => { this.productName = input; }}
      className="form-control"
      placeholder="Sentence"
      required
    />
  </div>
  <button
    type="submit"
    className="btn btn-primary"
    style={{
      marginLeft: '10px',  // Add margin to create space between form and button
      //marginTop: '10px',
      padding: '6px 12px',
      background: '#f2f2f2',
      color: '#333',
      border: '4px solid #599ee9',
      borderRadius: '4px',
      fontSize: '14px',
      cursor: 'pointer',
      textTransform: 'uppercase',
      fontWeight: 'bold',
      letterSpacing: '1px',
      height: '100%',
    }}
  >
    Add Sentence
  </button>
</form>

        
        <br>
        </br>
        <h2>Buy Sentence</h2>
        <table className="table">
          <thead>
            <tr>
              <th scope="col">Sentence</th>
              <th scope="col">Price</th>
              <th scope="col">Upvotes</th>
              <th scope="col">Owner</th>
              <th scope="col">Contributors</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody id="productList">
          { this.props.products.map((product, key) => {  
            	this.props.getArr(product.id.toNumber());         
              if (!product.purchased) {
                return <Entry key={key} product={product} name={product.name} upvotes={product.upvotes} purchaseProduct ={this.props.purchaseProduct} getArr ={this.props.getArr} data={this.state.myArrContent}/>;
                
              } else {
                return null;
              }

          })}
          </tbody>
        </table>
        <br>
        </br>
        <hr className="section-divider"></hr>
        <br>
        </br>
        <h2>
          The Story
        </h2>
        { 
        this.props.products.map((product, key) => {
              return(
                (product.upvotes >= 2) ?
                <div key={key}>
                    { product.purchased
                      ? <div  ref="setter" className="sentence" dangerouslySetInnerHTML={{ __html: product.name}}></div>
                      : null
                    }
                </div>
                : null
              )
            })}
            <br>
            </br>
    
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start' }}>
            <div>
  <span
    dangerouslySetInnerHTML={{ __html: this.props.votez }}
    style={{ fontWeight: 'bold', fontSize: '25px'}}
  ></span>
  <span style={{ fontWeight: 'bold', fontSize: '25px' }}>
    {this.props.votez == 1 ? ' Vote' : ' Votes'} to End
  </span>
</div>



<div>
  {[...Array(10)].map((_, index) => (
    <div
      key={index}
      style={{
        display: 'inline-block',
        width: '20px',
        height: '20px',
        backgroundColor: index < this.props.votez ? '#599ee9' : 'gray',
        margin: '5px',
      }}
    ></div>
  ))}
</div>

  <button
    onClick={(event) => {
      const price = window.web3.utils.toWei("0.000007", 'Ether');
      this.props.voteEnd();
    }}
    className="btn btn-primary"
    style={{
      marginTop: '10px',
      padding: '6px 12px',
      background: '#f2f2f2',
      color: '#333',
      border: '4px solid #599ee9',
      borderRadius: '4px',
      fontSize: '14px',
      cursor: 'pointer',
      textTransform: 'uppercase',
      fontWeight: 'bold',
      letterSpacing: '1px',
    }}
  >
    Vote to End
  </button>
</div>


<div className="content past_stories" style={{ width: "100%", marginLeft: "0px", fontFamily: "Arial" }}>
       <h3>
          Past Stories
        </h3>
        
        <div ref="setter" className="sentence_past" style={{ whiteSpace: "pre-line", color: "#2a323d" }}>
          {this.props.historicalProducts.map((historicalProducts, index) => (

          <div key={index}>{historicalProducts.fullS}
          
          </div>
          ))}  
           
        </div>
        
          <h3>
          Authors
          </h3>
          <div>
            
          {this.props.historicalProducts.map((historicalProducts, index) => (

          <div key={index}>{historicalProducts.authors}</div>
          ))}

          </div>
        <div style={{ marginTop: "3em", clear: "both", textAlign: "right", color: "#2a323d", fontWeight: "bold", marginRight: "5px"}}>
          Beta V1.0, UEP Lab Tufts University  
        </div>

      </div>
      <br>
        </br>
        <h2>Story Marketplace</h2>
        <table className="table">
          <thead>
            <tr>
              <th scope="col">Story</th>
              <th scope="col">Price</th>
              <th scope="col">Owner</th>
              <th scope="col">Authors</th>
              <th scope="col"></th>

            </tr>
          </thead>
          <tbody id="productList">
         {this.props.historicalProducts.map((historicalProduct, index) => (
        <tr key={index}>
          
          <td>{historicalProduct.fullS}</td>
          <td>"0.0000008"</td>
          <td> "nn"</td>
          <td>{historicalProduct.authors}</td>
          <td></td>
        </tr>
      ))}
          </tbody>
          {/* <tbody id="productList">
          { this.props.products.map((product, key) => {  
            	this.props.getArr(product.id.toNumber());         
              if (!product.purchased) {
                return <Entry key={key} product={product} name={product.name} upvotes={product.upvotes} purchaseProduct ={this.props.purchaseProduct} getArr ={this.props.getArr} data={this.state.myArrContent}/>;
                
              } else {
                return null;
              }

          })}
          </tbody> */}
        </table>
        <br>
        </br>
        <hr className="section-divider"></hr>
        <br>
        </br>
        <hr className="section-divider"></hr>
        <br></br>
        <hr className="section-divider"></hr>
        <br>
        </br>
        <br>
        </br><br>
        </br>
      </div>

      
    );
  }
}

export default Main;