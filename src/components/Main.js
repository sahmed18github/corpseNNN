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
  window.alert(' You can start out as an author and suggest the first (or next) sentence of a story (for a nominal $0.01 equivalent cost, plus network gas fee). You can also weigh in on which sentence should go next by upvoting (again for $0.01 and gas fee)')
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
  <br>
  </br>
  <p>&nbsp;</p>
  <h2>How it Works</h2>
        <div style={{ textAlign: "center" }}>
        <p>
        For over a century, the Exquisite Corpse has been an approach creative 
        people have employed to solve problems and collaborate.  Web3 technology 
        has made it possible to drastically improve cooperation across time and 
        space, while also recording contributions to protect intellectual 
        property.  
        </p>

        <p>
        Please join this experiment in creative and collaborative story writing!  
        You can start out as an author and suggest the first (or next) sentence 
        of a story (for a nominal $0.01 equivalent cost, plus network gas fee).  
        You can also weigh in on which sentence should go next by upvoting 
        (again for $0.01 and gas fee).  Once a sentence has three upvotes, it 
        goes into the story and the author receives funds deposited into their 
        wallet representing a fraction of those upvote fees (not a lot of money).  
        </p>

        <p>
        But then, after four upvotes (again, for $0.01 and gas fees each), the 
        story is ended and goes for sale in the Story Marketplace.  Here, all 
        authors will receive their share of the proceeds from the sale, both 
        initially and on an ongoing basis through a royalties feature in the 
        contract.  That means that if the story is eventually sold to a 
        publisher or its movie rights are optioned (could happen), the original 
        sentence authors will continue to see funds deposited into their 
        wallets.  Don’t lose that wallet address!
        </p>

        <p>
        We hope you enjoy this experiment in crowd-sourced creative writing – 
        be sure to share with your friends, family, and colleagues. Let us know 
        if you have any feedback.
        </p> 
        </div>
        <br>
        </br>
        <h2>How to Use a Digital Wallet</h2>
        <div style={{ textAlign: "center" }}>
        <a href="https://docs.google.com/document/d/1fphIVNir-0WOTRuiAURv1HM1YOOpGDN7Ewf4wkR5LBs/edit" target="_blank" class="custom-link">Link for instructions on how to use a digital wallet</a>
        </div>
        <hr className="section-divider"></hr>
        <br>
        </br>
        <h2>Suggest the next sentence to a story</h2>
        <form
  onSubmit={(event) => {
    event.preventDefault();
    const name = this.productName.value;
    const price = window.web3.utils.toWei("0.005", 'Ether');
    var my_val  = ['', '', '', ''];
    this.props.createProduct(name, price, 0, my_val);
  }}
  style={{
    display: 'flex',  
    justifyContent: 'space-between', 
    maxWidth: '100%',
    margin: '0 auto',
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
      marginLeft: '1%',  
      //marginTop: '1%',
      padding: '0.3% 0.5%',
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
    Add Sentence
  </button>
</form>

        
        <br>
        </br>
        <h2>Vote for a sentence to be included in a story</h2>
        
        <table className="table">
          <thead>
            <tr>
              <th style={{ width: '30%' }} scope="col">Sentence</th>
              <th style={{ width: '12%' }} scope="col">Price</th>
              <th style={{ width: '8%' }} scope="col">Upvotes</th>
              <th style={{ width: '20%' }} scope="col">Sentence Author</th>
              <th style={{ width: '20%' }} scope="col">Voters</th>
              <th style={{ width: '15%' }} scope="col"></th>
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
{this.props.products
  .filter(product => product.upvotes >= 3 && product.purchased) // Filter products with upvotes >= 3 and purchased flag set to true
  .map((product, key) => (
    
    <React.Fragment key={key}>
      <span dangerouslySetInnerHTML={{ __html: product.name }} />
      &nbsp; {
      }
      
    </React.Fragment>
  ))}

    
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start' }}>
            <div>
  <span
    dangerouslySetInnerHTML={{ __html: this.props.votez }}
    style={{ fontWeight: 'bold', fontSize: '2vw'}}
  ></span>
  <span style={{ fontWeight: 'bold', fontSize: '2vw' }}>
    {this.props.votez == 1 ? ' Vote' : ' Votes'} to End
  </span>
</div>



<div>
  {[...Array(4)].map((_, index) => (
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
     
        
        window.alert('When the story is ended and goes for sale in the Story Marketplace')
        window.alert('Can vote to end only once')
  
      //console.log('Vote End:', this.marketplace.vote_end(price));
      const price = window.web3.utils.toWei("0.01", 'Ether');
      this.props.voteEnd(price);
    }}
    className="btn btn-primary"
    style={{
      marginLeft: '0%',
      //marginTop: '1%',
      padding: '0.3% 0.5%',
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
    Vote to End
  </button>
</div>


 <div className="content past_stories" style={{ width: "100%", marginLeft: "0%", fontFamily: "Arial" }}>
  {/* 
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
      
      <br>
        </br> */}
        
        <h3>Story Marketplace</h3>
        
        <table className="table">
          <thead>
            <tr>
            <th style={{ width: '30%', color: '#2a323d' }} scope="col">Story</th>
            <th style={{ width: '10%', color: '#2a323d' }} scope="col">Price</th>
            <th style={{ width: '24%', color: '#2a323d' }} scope="col">Owner</th>
            <th style={{ width: '10%', color: '#2a323d' }} scope="col"></th>
            </tr>
          </thead>
          
          <tbody id="productList" >
          {this.props.historicalProducts.map((historicalProduct, index) => (
        <tr key={index} style={{ color: 'darkblue' }}>
          <td style={{ color: '#2a323d' }}>{historicalProduct.fullS}</td>
          <td style={{ color: '#2a323d' }}>{window.web3.utils.fromWei(historicalProduct.price.toString(), 'Ether')} MATIC</td>
          <td style={{ color: '#2a323d' }}>{historicalProduct.authors}</td>
          
          <td>
              { !historicalProduct.purchased
                ? <button 
             id = {historicalProduct.id}
             value = {historicalProduct.price}
             onClick = {(event) => {
              this.props.purchaseStory(event.target.id, event.target.value)
             }}
              
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
                }}  >
            Buy </button>
            : null }
          </td>
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
        
        <br>
        </br>
        
        <br></br>
       
        <br>
        </br>
        <br>
        </br><br>
        </br>
      </div>

      <div style={{ marginTop: "3em", clear: "both", textAlign: "right", color: "#f0f0f4", fontWeight: "bold", marginRight: "1" }}>
        Beta V1.0, Urban Attitudes Lab, Tufts University &lt;sites.tufts.edu/ualab&gt;.
      </div>


      </div>
    );
    
  }
}

export default Main;