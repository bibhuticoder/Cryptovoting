pragma solidity ^0.4.0;
contract CryptoVoting {
    
    struct Candidate{
        string name;
        string party;
        uint voteCount;
        bool doesExist;
    }
    
    struct Voter{
        bool hasVoted;
        bool doesExist;
    }
    
    address public admin;
    mapping(uint256 => Voter) public voters;
    mapping(uint256 => Candidate) public candidates;
    uint256[] candidateIndex;
    uint256[] voterIndex;
    uint public electionEnd; 
    uint public totalVotes;
    
    function CryptoVoting() public{
        admin = msg.sender;
        totalVotes = 0;
    }
    
    modifier onlyAdmin {
        require(msg.sender == admin);
        _;
    }
    
    modifier isAuthenticatedVoter(uint voterId) {
        require(voters[voterId].hasVoted == false);
        _;
    }
    
    function addCandidate(uint256 id, string name, string party) public {
        candidates[id] = Candidate(name, party, 0, true);
        candidateIndex.push(id);
    }
    
    function addVoter(uint _id) public onlyAdmin constant returns(uint){
        voters[_id] = Voter(false, true);
        voterIndex.push(_id);
        return 1;
    }
    
    function authenticateVoter(uint voterId)public constant returns(uint){
        if(voters[voterId].hasVoted) return 1; //already voted
        else if(!voters[voterId].doesExist) return 2; //user not found in database
        else return 0; // valid user
    }
    
    function vote(uint voterId, uint candidateId) public{
        candidates[candidateId].voteCount++;
        voters[voterId].hasVoted = true;
        totalVotes++;
        Voted(totalVotes);
    }
    
    function getAllCandidates() public constant returns(uint256[]){
        return candidateIndex;
    }

    //get particular candidate
    function getCandidate(uint256 candidateId) public constant returns(Candidate){
        return candidates[candidateId];
    }
    
    //get total votes casted(of all Candidates)
    function totalVotes() public constant returns (uint){
        return totalVotes;
    }
    
    //total no of voters
    function totalVoters() public constant returns (uint){
        return voterIndex.length;
    }
    
    function getEndTime()public constant returns(uint){
        return electionEnd;
    }
    
    event Voted(uint256 total);
    
    // event MsgEvent(string message);
    // string public message;
    
    // // // function CryptoVoting(){
    // // //     message = "initial message";
    // // // }
    
    // function setMessage(string msg)public{
    //     message = msg;
    //     MsgEvent(msg);
    // }
    
    
}