// pragma solidity ^0.8.0;


// //TODO
// //Add another table with stories, authors, buy button
// //convert contributors to string array and get the size
// //get the buyer address
// //transfer the ownership
// //split the sale
// //display the buy button
// contract Marketplace {
// 	string public name;
// 	uint public productCount = 0;
// 	uint public vote_end = 0;
// 	uint public SentenceCount = 0;
// 	uint public num = 0;
// 	uint public historyProdCount = 0;
// 	mapping(uint => Product) public products;
// 	mapping(uint => CompleteStory) public products_historical;
// 	//link story in historical to the contributors
// 	//string public authors;
// 	mapping(uint => Sentence) public story;
// 	address[3] public voters_end;
// 	struct Product {
// 		uint id;
// 		string name;
// 		uint price;
// 		address payable owner;
// 		bool purchased;
// 		uint upvotes;
// 		string[3] contributors;
// 	}
// 	struct Sentence {
// 		string name;
// 		address payable [] authors;
// 	}
// 	struct CompleteStory {
// 		uint id;
// 		uint sentCount;
// 		string fullS;
// 		uint price;
// 		bool purchased;
// 		address payable [] owner;
// 		address  payable [] authors;
// 	}

// 	event StoryCreated(
// 		string name,
// 		address payable [] authors	
// 	);

// 	event StoryPurchased(
// 		uint id,
// 		string fullS,
// 		uint price,
// 		bool purchased,
// 		address payable owner,
// 		address payable [] authors
// 	);

// 	event ProductCreated(
// 		uint id,
// 		string name,
// 		uint price,
// 		address payable owner,
// 		bool purchased,
// 		uint upvotes,
// 		string[3] contributors	
// 	);

// 	event upVote(
// 		uint vote
// 	);

// 	event ProductPurchased(
// 		uint id,
// 		string name,
// 		uint price,
// 		address payable owner,
// 		bool purchased,
// 		uint upvotes,
// 		string[3] contributors
// 	);

// 	struct voteEnd{
// 		uint votes;
// 	}
	

// 	constructor() {
// 		name = "exquisite corpse";
// 		//products_historical ='';
// 		vote_end = 0;
// 	}

// 	function getArr(uint _id) public view returns (string[3] memory) {
// 		Product storage myProduct = products[_id];
//     	return myProduct.contributors;
// 	}

// 	function stringToArray(string memory str) public pure returns (string[] memory) {
//         // Count the number of spaces in the input string
//         uint spaceCount = 0;
//         for (uint i = 0; i < bytes(str).length; i++) {
//             if (bytes(str)[i] == 0x20) { // ASCII value of space is 0x20
//                 spaceCount++;
//             }
//         }

//         // Create a new dynamic string array with the number of spaces + 1 elements
//         string[] memory stringArr = new string[](spaceCount + 1);
//         uint startIndex = 0;
//         uint arrayIndex = 0;

//         // Iterate over the input string and split it by space
//         for (uint i = 0; i < bytes(str).length; i++) {
//             if (bytes(str)[i] == 0x20) {
//                 stringArr[arrayIndex] = substring(str, startIndex, i);
//                 startIndex = i + 1;
//                 arrayIndex++;
//             }
//         }

//         // Add the remaining part of the input string to the array
//         stringArr[arrayIndex] = substring(str, startIndex, bytes(str).length);

//         return stringArr;
//     }

// 	function substring(string memory str, uint startIndex, uint endIndex) internal pure returns (string memory) {
//         bytes memory strBytes = bytes(str);
//         require(endIndex <= strBytes.length, "Invalid endIndex");

//         bytes memory result = new bytes(endIndex - startIndex);
//         for (uint i = startIndex; i < endIndex; i++) {
//             result[i - startIndex] = strBytes[i];
//         }

//         return string(result);
//     }
	

// // 	function strConcat(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e) internal pure returns (string memory){
// //     bytes memory _ba = bytes(_a);
// //     bytes memory _bb = bytes(_b);
// //     bytes memory _bc = bytes(_c);
// //     bytes memory _bd = bytes(_d);
// //     bytes memory _be = bytes(_e);
// //     string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
// //     bytes memory babcde = bytes(abcde);
// //     uint k = 0;
// // 	uint i = 0;
// //     for (i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
// //     for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
// //     for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
// //     for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
// //     for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
// //     return string(babcde);
// // 	}

// // 	function strConcat(string memory _a, string memory _b) internal pure returns (string memory) {
// //     return strConcat(_a, _b, "", "", "");
// // }

// 	// function removeDuplicateWords(string memory input) public pure returns (string memory) {
//     //     string[] memory words = split(input, " ");
//     //     string memory output;
        
//     //     for(uint i = 0; i < words.length; i++) {
//     //         bool isDuplicate = false;
            
//     //         for(uint j = i + 1; j < words.length; j++) {
//     //             if (keccak256(abi.encodePacked(words[i])) == keccak256(abi.encodePacked(words[j]))) {
//     //                 isDuplicate = true;
//     //                 break;
//     //             }
//     //         }
            
//     //         if (!isDuplicate) {
//     //             output = string(abi.encodePacked(output, words[i], " "));
//     //         }
//     //     }
        
//     //     return output;
//     // }
    
//     // function split(string memory input, string memory delimiter) private pure returns (string[] memory) {
//     //     bytes memory inputBytes = bytes(input);
//     //     bytes memory delimiterBytes = bytes(delimiter);
//     //     uint count = 1;
        
//     //     for(uint i = 0; i < inputBytes.length; i++) {
//     //         if (inputBytes[i] == delimiterBytes[0]) {
//     //             count++;
//     //         }
//     //     }
        
//     //     string[] memory parts = new string[](count);
//     //     uint startIndex = 0;
//     //     count = 0;
        
//     //     for(uint i = 0; i < inputBytes.length; i++) {
//     //         if (inputBytes[i] == delimiterBytes[0]) {
//     //             parts[count] = substring(input, startIndex, i);
//     //             startIndex = i + 1;
//     //             count++;
//     //         }
//     //     }
        
//     //     parts[count] = substring(input, startIndex, inputBytes.length);
        
//     //     return parts;
//     // }
    
//     // function substring(string memory input, uint startIndex, uint endIndex) private pure returns (string memory) {
//     //     bytes memory inputBytes = bytes(input);
//     //     bytes memory result = new bytes(endIndex - startIndex);
        
//     //     for(uint i = startIndex; i < endIndex; i++) {
//     //         result[i - startIndex] = inputBytes[i];
//     //     }
        
//     //     return string(result);
//     // }


// //    function convertStringToAddresses(string memory inputString) external pure returns (address payable[] memory) {
        
// //         // Calculate the number of addresses in the input string
// //         uint256 numOfAddresses = (bytes(inputString).length + 1) / 43;
        
// //         // Initialize the addresses array
// //         address payable[] memory addresses = new address payable[](numOfAddresses);
        
// //         // Split the string and convert each address separately
// //         bytes memory stringBytes = bytes(inputString);
// //         uint256 addressIndex = 0;
        
// //         for (uint256 i = 0; i < stringBytes.length; i += 43) {
// //             bytes20 addressBytes;
            
// //             // Extract the bytes of the address
// //             for (uint256 j = 0; j < 40; j++) {
// //                 addressBytes |= bytes20(uint8(stringBytes[i + j]) & 0xFF) >> (j * 8);
// //             }
            
// //             // Convert the address bytes to payable address and store it in the array
// //             addresses[addressIndex] = payable(address(uint160(uint256(addressBytes))));
            
// //             // Move to the next address in the array
// //             addressIndex++;
// //         }
        
// //         return addresses;
// //     }

// 	function stringToAddress(string memory _input) internal pure returns (address) {
// 		bytes32 hash = keccak256(bytes(_input));
// 		address addr = address(uint160(uint256(hash)));
// 		return addr;
// 	}
// 	function concatAddresses(address payable [] memory addresses1, address payable [] memory addresses2) public pure returns(address payable [] memory) {
// 		uint totalLength = addresses1.length + addresses2.length;
// 		address payable [] memory concatenatedArray = new address payable [](totalLength);
		
// 		uint i;
// 		for (i = 0; i < addresses1.length; i++) {
// 			concatenatedArray[i] = addresses1[i];
// 		}
// 		for (uint j = 0; j < addresses2.length; j++) {
// 			concatenatedArray[i++] = addresses2[j];
// 		}
		
// 		return concatenatedArray;
// 	}
// 	function concatenate(string memory a, string memory b) public pure returns (string memory) {
//         bytes memory aa = bytes(a);
//         bytes memory bb = bytes(b);
//         bytes memory result = new bytes(aa.length + bb.length);
//         uint k = 0;
//         for (uint i = 0; i < aa.length; i++) {
//             result[k++] = aa[i];
//         }
//         for (uint i = 0; i < bb.length; i++) {
//             result[k++] = bb[i];
//         }
//         return string(result);
//     }
// 	function toString(uint _i) internal pure returns (string memory _uintAsString) {
//         if (_i == 0) {
//             return "0";
//         }
//         uint j = _i;
//         uint len;
//         while (j != 0) {
//             len++;
//             j /= 10;
//         }
//         bytes memory bstr = new bytes(len);
//         uint k = len;
//         while (_i != 0) {
//             k = k-1;
//             uint8 temp = (48 + uint8(_i - _i / 10 * 10));
//             bytes1 b1 = bytes1(temp);
//             bstr[k] = b1;
//             _i /= 10;
//         }
//         return string(bstr);
//     }
// 	function addressToString(address _addr) public pure returns (string memory) {
// 		bytes32 value = bytes32(uint256(uint160(_addr)));
// 		bytes memory alphabet = "0123456789abcdef";

// 		bytes memory str = new bytes(42);
// 		str[0] = '0';
// 		str[1] = 'x';
// 		for (uint i = 0; i < 20; i++) {
// 			str[2+i*2] = alphabet[uint8(value[i + 12] >> 4)];
// 			str[3+i*2] = alphabet[uint8(value[i + 12] & 0x0f)];
// 		}
// 		return string(str);
// 	}

// 	function createVoteEnd(uint price) public {
//     //string storage senderString = toString(msg.sender);
// 	//check not similar voters
//     for (uint i = 0; i < vote_end; i++) {
// 		address voterA = voters_end[i];
//         require( voterA != msg.sender);
//     }
// 		voters_end[vote_end] = msg.sender;
// 		vote_end++;
// 		Sentence memory _sentence;
// 		//transfer to past stories
// 		if(vote_end >= 1){
// 			Product memory _product;
// 			SentenceCount = 0;
// 			for(uint i = 1; i <= productCount; i++){
// 				_product = products[i];
// 				if(_product.upvotes >= 2){
// 					//move products as sentences in the story
// 					_sentence.name = _product.name;
// 					_sentence.authors[1] = _product.owner;
// 					SentenceCount++;
// 					story[SentenceCount] = _sentence;
					
// 					//make the first sentence have all the authors
// 					emit StoryCreated(_sentence.name, _sentence.authors);
// 				}
// 				else {
// 					delete _product;
					
// 				}

// 			}
// 			//store the authors in one address array
// 			address payable [] memory store_authors;
// 			if (SentenceCount == 1) {
// 				store_authors = story[1].authors;
// 			}
// 			if (SentenceCount == 2) {
// 				//store_authors = story[1].authors;
// 				//store_authors.push();
// 				store_authors = concatAddresses(story[1].authors, story[2].authors);
// 			}
// 			//string memory temp;
// 			// if (SentenceCount == 1) {
// 			// 		store_authors = concatAddresses(story[1].authors);
// 			// 		//break;
			
// 			if (SentenceCount > 2) {
// 				store_authors = story[1].authors;
// 				for(uint i = 2; i <= SentenceCount; i++) {
// 					store_authors = concatAddresses(store_authors , story[i].authors);
// 				}
// 			}
// 			// //concate all sentences in one string
// 			string memory full_story = "";
// 			string memory space = " ";
// 			//string memory full_story;
// 			for (uint j = 1; j <= SentenceCount; j++) {
// 				full_story = concatenate(full_story, concatenate(space, story[j].name));
// 			}
// 			//add the authors
// 			historyProdCount++; 
// 			//add the story string
// 			// address [] memory addr; //= address(0x59c5505100F8107E9b59AE0B7977c10D27A0476E); //= [0x59c5505100F8107E9b59AE0B7977c10D27A0476E];
// 			// addr.push(0x59c5505100F8107E9b59AE0B7977c10D27A0476E);
			
// 			//products_historical[historyProdCount].authors = removeDuplicateWords(store_authors);

// 			//products_historical[historyProdCount].owner = splitAddresses(products_historical[historyProdCount].authors);
// 			//address[] memory auThors = splitAddresses(products_historical[historyProdCount].authors);
// 			//products_historical[historyProdCount].owner = payable(auThors[2]);

// 			products_historical[historyProdCount] = CompleteStory(historyProdCount, SentenceCount, 
// 			full_story, price , false, store_authors, store_authors);
// 			//products_historical = strConcat(products_historical, "\n\n");
// 			resetProducts();
// 			vote_end = 0;
// 			productCount = 0;
		
// 		} 
		
// 		emit upVote(vote_end);
// 	}

// 	function getCurrentVote() public view returns (uint) {
// 		// portion where we plug in tufts account
// 		// address(_seller).transfer(msg.value);
// 		return vote_end;
// 	}
	
// 	// function checkVotesLoad() public{
// 	// 	Product memory _product;
// 	// 	for(uint i = 0; i < vote_end; i++){
// 	// 		_product = products[i];
// 	// 		if(_product.upvotes >= 2){
// 	// 				historyProdCount++;
// 	// 				_product = products[i];
//  	// 				products_historical[historyProdCount] = _product;
// 	// 		}
// 	// 	}
// 	// }

// 	function resetProducts() public view{
// 		Product memory _product;
// 		for(uint i = 0; i < vote_end; i++){
// 			_product = products[i];
// 			_product.name = "";
// 			_product.upvotes = 0;
// 		}
// 	}


// 	function createProduct(string memory _name, uint _price, uint upvotes, string[3] memory contributors) public {
// 		// require a name
// 		require(bytes(_name).length > 0);
// 		// require a valid price
// 		require(_price > 0);
// 		// make sure params good
// 		// inc products count
// 		productCount++;
// 		//add owner to contributors
// 		contributors[upvotes] = addressToString(msg.sender);
// 		//address payable [] memory owner;
// 		//owner[1] = payable(msg.sender);
// 		// create the product
// 		products[productCount] = Product(productCount, _name, _price, payable(msg.sender), false, upvotes, contributors);
// 		// trigger an event	
// 		emit ProductCreated(productCount, _name, _price, payable(msg.sender), false, upvotes, contributors);
// 	}

// 	function purchaseProduct(uint _id) public payable {
// 		// fetch product
// 		Product memory _product = products[_id];	
// 		// fetch the owner
// 		address payable _seller = _product.owner;
		
// 		// make sure the product has a valid id
// 		require(_product.id > 0 && _product.id <= productCount);
// 		// make sure they sent enough ether
// 		require(msg.value >= _product.price);
// 		// require product has not already been purchased
// 		require(!_product.purchased, "You cannot upvote your sentence");
// 		// require that the buyer is not the seller
// 		require(_seller != msg.sender, "Already upvoted");
// 		// require that the buyer is not a previous contributor (i.e already upvoted)
		

// 		// // purchase it -> transfer ownership to buyer
// 		// if (_product.upvotes <= 0) {
// 		// 	_product.owner = payable(msg.sender);
// 		// }
		
// 		payable(_seller).transfer(msg.value);
// 		// mark as purchased
// 		// increment upvotes of product
// 		_product.upvotes += 1;
// 		//add purchaser to contributors
// 		_product.contributors[_product.upvotes] = addressToString(msg.sender);
// 		//update the product
// 		products[_id] = _product;
		
// 		// products[_id] = Product(productCount,
// 		// _product.name, _product.price, 
// 		// _product.owner, false, 
// 		// _product.upvotes, 
// 		// _product.contributors);

// 		if(_product.upvotes >= 2){
// 			_product.purchased = true;
// 			// products[_id] = Product(productCount,
// 			// _product.name, _product.price, 
// 			// _product.owner, true, 
// 			// _product.upvotes, 
// 			// _product.contributors);
// 			products[_id] = _product;
// 			emit ProductPurchased(productCount, _product.name, _product.price, _product.owner, true, _product.upvotes, _product.contributors);
// 		}
// 		else {
// 			_product.purchased = false;
// 			products[_id] = _product;
// 			emit ProductPurchased(productCount, _product.name, _product.price, _product.owner, false, _product.upvotes, _product.contributors);
// 			//emit ProductCreated(productCount, _product.name, _product.price, _product.owner, false, _product.upvotes, _product.contributors);
// 		}	
// 	}




// // function sellStory(string memory _name, uint _price,string memory authors) public {
// // 	require(bytes(_name).length > 0);
// // 		// require a valid price
// // 	require(_price > 0);

// // // // }
// // function createStory(string memory storyname, uint price) public {
// // 		// require a name
// // 		require(bytes(name).length > 0);
// // 		// require a valid price
// // 		require(price > 0);
// // 		storyCount++;
// // 		// //add owner to contributors
// // 		// contributors[upvotes] = addressToString(msg.sender);
// // 		// create the product
		
// // 		//products_historical[storyCount].price = msg.sender;
// // 		products_historical[storyCount].purchased = false;
// // 		// trigger an event	
// // 		emit StoryCreatedwPrice(products_historical[storyCount].fullS, price, false);
// // }


//     function purchaseStory(uint _id) public payable {
//     // Fetch the product
// 		CompleteStory memory H_story = products_historical[_id];
		
// 		// Fetch the owner
// 		//ddress payable _seller = payable(msg.sender); // Assign msg.sender to _seller
// 		address payable [] memory _seller = H_story.authors;
		
//         H_story.owner[1] = payable(msg.sender);
// 		// Require that there is enough Ether in the transaction
// 		require(H_story.id > 0 && H_story.id <= historyProdCount);
// 		require(msg.value >= H_story.price);
// 		// Require that the product has not been purchased already
// 		require(!H_story.purchased);
// 		// Require that the buyer is not the seller
// 		//require(_seller != msg.sender);
// 		// Mark as purchased
// 		H_story.purchased = true;
// 		// Pay the seller by sending them Ether
//         //string [] memory sellers = //stringToArray(H_story.authors);
// 		//addresses = addressConverter.convertStringToAddresses(addressesString);
    
// 		//string memory aauthorss = H_story.authors;
// 		//address [] memory sellerAddr = convertToAddresses(sellers);
// 		//address memory sellers = ;
// 		for (uint i = 1; i <= H_story.sentCount; i++) {
// 			//_seller = sellers[i];
// 			payable(_seller[i]).transfer(msg.value);
// 		}
// 		//_seller.transfer(msg.value);
// 		//H_story.owner = payable(msg.sender);
// 		// Update the product
// 		products_historical[_id] = CompleteStory(_id,H_story.sentCount,H_story.fullS, H_story.price, true,  H_story.owner, H_story.authors);
	
		
// 		// Trigger an event
// 		emit StoryPurchased(_id, H_story.fullS, H_story.price, true,  H_story.owner[1], H_story.authors);
// }

// }

