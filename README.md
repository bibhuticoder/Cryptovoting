# Cryptovoting
The team project was made during Yomari Code Camp 2018 under the category "Block Chain Technology". We won the 3rd prize for the project.

## About
The decentralized voting application built on Ethereum. Data storage, authentication and other backend stuffs are written as `Smart Contract`
on Ethereum. Web3 is used to connect the Ehererum test network with Vuejs Webapp. For authenticating voters QRcodes are used.

  ![Alt text](/screenshot.JPG)


## Technology used
- Ethereum
- Remix IDE : to compile Solidity code
- Web3 : to connect RemixIDE to Webapp
- VueJs : frontend framework

## To run it locally
- open `cryptovoting.sol` in Remix IDE (https://remix.ethereum.org)
- copy `address` and `ABI` in src/main.js
```
  var Contract = web3.eth.contract(ABI);
  Vue.prototype.$contract = Contract.at('address');
```
- inside src folder run `npm install && npm run dev`
- Generate and try QR codes of string '1212' & '3434' to cast vote.

## Team Members
- Roshan Chapagain
- Rohan Shrestha
- Bibhuti Poudyal


