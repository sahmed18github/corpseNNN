import React, { Component } from 'react';
import Web3 from 'web3'
import './App.css';
import Marketplace from '../abis/Marketplace.json'
import Navbar from './Navbar'
import Main from './Main'

class App extends Component {

  async componentWillMount() {
    await this.loadWeb3()
    await this.loadBlockchainData()
  }

  async loadWeb3() {
    if (window.ethereum) {
      window.web3 = new Web3(window.ethereum)
      await window.ethereum.enable()
    }
    else if (window.web3) {
      window.web3 = new Web3(window.ethereum)
    }
    else {
      window.alert('Non-Ethereum browser detected. You should consider trying MetaMask!')
    }
  }

  async loadBlockchainData() {
    const web3 = window.web3
    // Load account
    const accounts = await web3.eth.getAccounts()
    this.setState({ account: accounts[0] })
    const networkId = await web3.eth.net.getId()
    const networkData = Marketplace.networks[networkId]
    if(networkData) {
      const marketplace = web3.eth.Contract(Marketplace.abi, networkData.address)
      this.setState({ marketplace })
      const productCount = await marketplace.methods.productCount().call()
      this.setState({ productCount })
      const SentenceCount = await marketplace.methods.SentenceCount().call()
      this.setState({ SentenceCount })
      const vote_end = await marketplace.methods.getCurrentVote().call()
      this.setState({vote_end})
      // const products_historical = await marketplace.methods.products_historical().call()
      // this.setState({products_historical })
      
      const historyProdCount = await marketplace.methods.historyProdCount().call()
      this.setState({ historyProdCount })
      // const story = await marketplace.methods.story().call()
      // this.setState({story})
      
     
      // Load products
      for (var i = 1; i <= productCount; i++) {
        const product = await marketplace.methods.products(i).call()
        this.setState({
          products: [...this.state.products, product]
        })
      }
      //load stories
      for (var i = 0; i <= historyProdCount; i++) {
        const story = await marketplace.methods.products_historical(i).call()
        this.setState({
          products_historical: [...this.state.products_historical, story]
        })
        // for (var t = 1; t <= 2; t++) {
        //   const sentence = await marketplace.methods.story(t).call()
        //   this.setState({
        //     story: [...this.state.story, sentence]
        //   })
        // }
       console.log(story.fullS)
       console.log(story.authors)


      }
      //console.log("product count", productCount.toString())
      console.log("sentence count", SentenceCount.toString())
      console.log("hist_product count", historyProdCount.toString())
      this.setState({ loading: false})
    } else {
      window.alert('Marketplace contract not deployed to detected network.')
    }
  }

  constructor(props) {
    super(props)
    this.state = {
      account: '',
      productCount: 0,
      SentenceCount: 0,
      products: [],
      historyProdCount: 0,
      products_historical: [],
      Story: [],
      vote_end: 0,
      loading: true,

    }

    this.createProduct = this.createProduct.bind(this)
    this.purchaseProduct = this.purchaseProduct.bind(this)
    this.getArr = this.getArr.bind(this)
    this.createVoteEnd = this.createVoteEnd.bind(this)
    this.getCurrentVote = this.getCurrentVote.bind(this)
    this.purchaseStory = this.purchaseStory.bind(this)
  }

  createProduct(name, price, upvotes, contributors) {
    this.setState({ loading: true })
    this.state.marketplace.methods.createProduct(name, price, upvotes, contributors).send({ from: this.state.account })
    .once('confirmation', (confirmation) => {
      this.setState({ loading: false }, () => {
        // Refresh the page after loading is set to false
        window.location.reload();
      });
    });
  }

  purchaseProduct(_id, price) {
    this.setState({ loading: true })
    
    this.state.marketplace.methods.purchaseProduct(_id).send({ from: this.state.account, value: price, gasLimit: 5000000})
    .once('confirmation', (confirmation) => {
      this.setState({ loading: false }, () => {
        // Refresh the page after loading is set to false
        window.location.reload();
      });
    });
    
    
  }

  purchaseStory(id, price) {
    this.setState({ loading : true })
    this.state.marketplace.methods.purchaseStory(id).send({from: this.state.account, value: price})
    .once('receipt', (receipt) => {
      this.setState({loading: false})
    })
  }
  // createStory(storyname, price) {
  //   this.setState({ loading : true })
  //   this.state.marketplace.methods.createStory(storyname, price).send({from: this.state.account})
  //   .once('confirmation', (confirmation) => {
  //     this.setState({ loading: false }, () => {
  //       // Refresh the page after loading is set to false
  //       window.location.reload();
  //     });
  //   });
  // }

  createVoteEnd(price) {
    this.setState({ loading: true })
    this.state.marketplace.methods.createVoteEnd(price).send({ from: this.state.account })
    .once('confirmation', (confirmation) => {
      this.setState({ loading: false }, () => {
        // Refresh the page after loading is set to false
        window.location.reload();
      });
    });
    console.log(this.state.marketplace.methods.getCurrentVote())
    //document.getElementById('vote').innerHTML = ""+this.marketplace.vote_end() + ""
  }

  async getArr(id) {
    let myArr = await this.state.marketplace.methods.getArr(id).call();
    return myArr
  }

  increaseVotes(){
    this.vote_end = this.createVoteEnd(this.vote_end)
    this.setState({ loading: false })
  }

  getCurrentVote(){
    return this.state.marketplace.methods.getCurrentVote()
  }
  async myFunction() {
    var x = document.getElementById("mySelect").value;
    console.log(x);
  }
  


  render() {
    return (
      <div className='all_encomp'>
        <div id="particles-js">
            <main role="main" className="col-lg-12 d-flex">
              { this.state.loading
                ? <div id="loading-text" className="text-center">
                  <p className="text-center">Loading...</p></div>
                : <Main
                  products={this.state.products}
                  historicalProducts={this.state.products_historical}
                  Story={this.state.Story}
                  votez = {this.state.vote_end}
                  createProduct={this.createProduct}
                  purchaseProduct={this.purchaseProduct}
                  getArr={this.getArr} 
                  voteEnd={this.createVoteEnd}
                  increase={this.increaseVotes}
                  getVote={this.getCurrentVote}
                  purchaseStory ={this.purchaseStory}

                 // createStory={this.createStory}
                  />
              }
            </main>
            </div>
      </div>
    );
  }
}

export default App;



