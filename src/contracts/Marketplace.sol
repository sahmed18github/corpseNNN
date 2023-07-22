pragma solidity ^0.8.0;


//TODO
//Add another table with stories, authors, buy button
//convert contributors to string array and get the size
//get the buyer address
//transfer the ownership
//split the sale
//display the buy button
contract Marketplace {
	string public name;
	uint public productCount = 0;
	uint public vote_end = 0;
	uint public SentenceCount = 0;
	uint public num = 0;
	uint public historyProdCount = 0;
	address payable [] public authors;
	mapping(uint => Product) public products;
	mapping(uint => CompleteStory) public products_historical;
	//link story in historical to the contributors
	//string public authors;
	mapping(uint => string) public story;
	address[11] public voters_end;
	struct Product {
		uint id;
		string name;
		uint price;
		address payable owner;
		bool purchased;
		uint upvotes;
		string[5] contributors;
	}
	// struct Sentence {
	// 	string name;
	// 	//address payable [] authors;
	// }
	struct CompleteStory {
		uint id;
		uint sentCount;
		string fullS;
		string authors;
		uint price;
		bool purchased;
		address payable [] owner;
		//address  payable [] authors;
	}

	event StoryCreated(
		string name,
		address payable [] authors	
	);

	event StoryPurchased(
		uint id,
		string fullS,
		string authors,
		uint price,
		bool purchased,
		address payable [] owner
	);

	event ProductCreated(
		uint id,
		string name,
		uint price,
		address payable owner,
		bool purchased,
		uint upvotes,
		string[5] contributors	
	);

	event upVote(
		uint vote
	);

	event ProductPurchased(
		uint id,
		string name,
		uint price,
		address payable owner,
		bool purchased,
		uint upvotes,
		string[5] contributors
	);

	struct voteEnd{
		uint votes;
	}
	
	
	constructor() {
		name = "exquisite corpse";
		//products_historical ='';
		vote_end = 0;
	}

	function getArr(uint _id) public view returns (string[5] memory) {
		Product storage myProduct = products[_id];
    	return myProduct.contributors;
	}

	function stringToArray(string memory str) public pure returns (string[] memory) {
        // Count the number of spaces in the input string
        uint spaceCount = 0;
        for (uint i = 0; i < bytes(str).length; i++) {
            if (bytes(str)[i] == 0x20) { // ASCII value of space is 0x20
                spaceCount++;
            }
        }

        // Create a new dynamic string array with the number of spaces + 1 elements
        string[] memory stringArr = new string[](spaceCount + 1);
        uint startIndex = 0;
        uint arrayIndex = 0;

        // Iterate over the input string and split it by space
        for (uint i = 0; i < bytes(str).length; i++) {
            if (bytes(str)[i] == 0x20) {
                stringArr[arrayIndex] = substring(str, startIndex, i);
                startIndex = i + 1;
                arrayIndex++;
            }
        }

        // Add the remaining part of the input string to the array
        stringArr[arrayIndex] = substring(str, startIndex, bytes(str).length);

        return stringArr;
    }

	function substring(string memory str, uint startIndex, uint endIndex) internal pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        require(endIndex <= strBytes.length, "Invalid endIndex");

        bytes memory result = new bytes(endIndex - startIndex);
        for (uint i = startIndex; i < endIndex; i++) {
            result[i - startIndex] = strBytes[i];
        }

        return string(result);
    }
	


	function stringToAddress(string memory _input) internal pure returns (address) {
		bytes32 hash = keccak256(bytes(_input));
		address addr = address(uint160(uint256(hash)));
		return addr;
	}
	function concatAddresses(address payable [] memory addresses1, address payable [] memory addresses2) public pure returns(address payable [] memory) {
		uint totalLength = addresses1.length + addresses2.length;
		address payable [] memory concatenatedArray = new address payable [](totalLength);
		
		uint i;
		for (i = 0; i < addresses1.length; i++) {
			concatenatedArray[i] = addresses1[i];
		}
		for (uint j = 0; j < addresses2.length; j++) {
			concatenatedArray[i++] = addresses2[j];
		}
		
		return concatenatedArray;
	}
	function concatenate(string memory a, string memory b) public pure returns (string memory) {
        bytes memory aa = bytes(a);
        bytes memory bb = bytes(b);
        bytes memory result = new bytes(aa.length + bb.length);
        uint k = 0;
        for (uint i = 0; i < aa.length; i++) {
            result[k++] = aa[i];
        }
        for (uint i = 0; i < bb.length; i++) {
            result[k++] = bb[i];
        }
        return string(result);
    }
	function toString(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
	function addressToString(address _addr) public pure returns (string memory) {
		bytes32 value = bytes32(uint256(uint160(_addr)));
		bytes memory alphabet = "0123456789abcdef";

		bytes memory str = new bytes(42);
		str[0] = '0';
		str[1] = 'x';
		for (uint i = 0; i < 20; i++) {
			str[2+i*2] = alphabet[uint8(value[i + 12] >> 4)];
			str[3+i*2] = alphabet[uint8(value[i + 12] & 0x0f)];
		}
		return string(str);
	}

	
	function createVoteEnd(uint price) public {
    //string storage senderString = toString(msg.sender);
	//check not similar voters
    for (uint i = 0; i < vote_end; i++) {
		address voterA = voters_end[i];
        require( voterA != msg.sender);
    }
		voters_end[vote_end] = msg.sender;
		vote_end++;

		//transfer to past stories
		if(vote_end >=10){
			Product memory _product;
			SentenceCount = 0;
			//address payable tempaddr;
			for(uint i = 1; i <= productCount; i++){
				_product = products[i];
				if(_product.upvotes >= 4){
					authors.push(_product.owner);
					//_sentence.name = _product.name;
					SentenceCount++;
					story[SentenceCount]= _product.name;
					
					//make the first sentence have all the authors
					emit StoryCreated(story[SentenceCount], authors);
				}
				else {
					delete _product;
					
				}

			}
			// //concate all sentences in one string
			string memory full_story = "";
			string memory space = " ";
			//string memory full_story;
			for (uint j = 1; j <= SentenceCount; j++) {
				full_story = concatenate(full_story, concatenate(space, story[j]));
			}
			//add the authors strings
			string memory authstring = "";
			for (uint j = 0; j < authors.length; j++) {
				authstring =  concatenate(authstring, concatenate(space, addressToString(authors[j])));
			}
			historyProdCount++; 
			products_historical[historyProdCount] = CompleteStory(historyProdCount, SentenceCount, 
			full_story, authstring, price , false, authors);
			resetProducts();
			vote_end = 0;
			productCount = 0;
			delete authors;
		
		} 
		
		emit upVote(vote_end);
	}

	function getCurrentVote() public view returns (uint) {
		// portion where we plug in tufts account
		// address(_seller).transfer(msg.value);
		return vote_end;
	}
	
	function resetProducts() public view{
		Product memory _product;
		for(uint i = 0; i < vote_end; i++){
			_product = products[i];
			_product.name = "";
			_product.upvotes = 0;
		}
	}


	function createProduct(string memory _name, uint _price, uint upvotes, string[5] memory contributors) public {
		// require a name
		require(bytes(_name).length > 0);
		// require a valid price
		require(_price > 0);
		// make sure params good
		// inc products count
		productCount++;
		//add owner to contributors
		contributors[upvotes] = addressToString(msg.sender);
		delete contributors[0];
		// create the product
		products[productCount] = Product(productCount, _name, _price, payable(msg.sender), false, upvotes, contributors);
		// trigger an event	
		emit ProductCreated(productCount, _name, _price, payable(msg.sender), false, upvotes, contributors);
	}

	function purchaseProduct(uint _id) public payable{
		// fetch product
		Product memory _product = products[_id];	
		// fetch the owner
		address payable _seller = _product.owner;
		
		// make sure the product has a valid id
		require(_product.id > 0 && _product.id <= productCount);
		// make sure they sent enough ether
		require(msg.value >= _product.price);
		// require product has not already been purchased
		require(!_product.purchased, "You cannot upvote your sentence");
		// require that the buyer is not the seller
		require(_seller != msg.sender, "Already upvoted");
		// require that the buyer is not a previous contributor (i.e already upvoted)
		
		
		payable(_seller).transfer(msg.value);
		// mark as purchased
		// increment upvotes of product
		_product.upvotes += 1;
		//add purchaser to contributors
		_product.contributors[_product.upvotes] = addressToString(msg.sender);
		//update the product
		products[_id] = _product;
		
		if(_product.upvotes >= 4){
			_product.purchased = true;
			products[_id] = _product;
			emit ProductPurchased(productCount, _product.name, _product.price, _product.owner, true, _product.upvotes, _product.contributors);
		}
		else {
			_product.purchased = false;
			products[_id] = _product;
			emit ProductPurchased(productCount, _product.name, _product.price, _product.owner, false, _product.upvotes, _product.contributors);
		}	
	}


   function purchaseStory(uint _id) public payable {
		// Fetch the product
		require(_id > 0 && _id <= historyProdCount, "Invalid product ID");

		require(msg.value >= products_historical[_id].price, "Insufficient funds");

		require(!products_historical[_id].purchased, "Story already purchased");

		products_historical[_id].purchased = true;

		// Transfer funds to sellers
		uint fullprice = msg.value;
		uint paidPrice = fullprice/products_historical[_id].sentCount;
		authors = products_historical[_id].owner;
		for (uint i = 0; i < products_historical[_id].sentCount; i++) {
			address payable seller = authors[i];
			seller.transfer(paidPrice);
		}

		// Update product ownership
		delete authors;
		delete products_historical[_id].owner;
		products_historical[_id].owner.push(payable(msg.sender)); 
		products_historical[_id].authors = addressToString(msg.sender);
		// Trigger an event
		emit StoryPurchased(products_historical[_id].id,products_historical[_id].fullS, addressToString(msg.sender), products_historical[_id].price, true,  products_historical[_id].owner);
	}


}
