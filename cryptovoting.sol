pragma solidity ^0.4.0;
contract CryptoVoting {
    
    struct Candidate{
        string party;
        uint voteCount;
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
        
        //add 9 candidates initially
        candidates[1] = Candidate("amalay", 0);
        candidates[2] = Candidate("congress", 0);
        candidates[3] = Candidate("maoist", 0);
        candidates[4] = Candidate("janata", 0);
        candidates[5] = Candidate("nayashakti", 0);
        candidates[6] = Candidate("prajatantra", 0);
        candidates[7] = Candidate("bibeksheel", 0);
        candidates[8] = Candidate("peasent", 0);
        candidates[9] = Candidate("nepali", 0);
        
        candidateIndex.push(1);
        candidateIndex.push(2);
        candidateIndex.push(3);
        candidateIndex.push(4);
        candidateIndex.push(5);
        candidateIndex.push(6);
        candidateIndex.push(7);
        candidateIndex.push(8);
        candidateIndex.push(9);
        
        //add 2 voters initially
        voters[1212] = Voter(false, true);
        voters[3434] = Voter(false, true);
        voterIndex.push(1212);
        voterIndex.push(3434);
        
        //set getEndTime
        electionEnd = (block.timestamp + 24*60*60)*1000;
    }
    
    // modifier onlyAdmin {
    //     require(msg.sender == admin);
    //     _;
    // }
    
    modifier isAuthenticatedVoter(uint voterId) {
        require(voters[voterId].hasVoted == false);
        _;
    }
    
    function addCandidate(uint256 id, string party) public {
        candidates[id] = Candidate(party, 0);
        candidateIndex.push(id);
    }
    
    function addVoter(uint256 id) public{
        voters[id] = Voter(false, true);
        voterIndex.push(id);
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
    function getCandidate(uint256 candidateId) public constant returns(string, uint){
        return (candidates[candidateId].party, candidates[candidateId].voteCount);
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
    
    
}
