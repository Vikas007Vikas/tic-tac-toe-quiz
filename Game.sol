pragma solidity ^0.4.25;

contract TicTacToe
{
 
 uint[][] public Board;
 uint n;
 
 address Owner;
 address address1;
 address address2;
 
 //number of players
 uint num = 0;
 
 constructor(uint _n) public
 {
     Owner = msg.sender;
     n = _n;
     uint i;
     uint j;
     uint[] temp;
     for(i=0;i<n;i++)
     {
         temp.push(0);
     }
     for(i=0;i<n;i++)
     {
         Board.push(temp);
     }
 }
 
 function RegisterUser() public
 {
    require(address1!=msg.sender && address2!=msg.sender && num<2,"Invalid user");
    if(num==0)
    {
        address1 = msg.sender;
    }
    else
    {
        address2 = msg.sender;
    }
    num++;
 }
 
 function StartGame() public returns uint
 {
    require(num==2 && msg.sender==Owner,"Invalid player");
    bool check;
    while(1)
    {
        take_input();
        check = CheckWinner();
        if(check)
        {
            return turn;
        }
        if(turn==1)
            turn = 2; 
        else
            turn = 1;
        
    }
 }
 
 function take_input(uint x,uint y) public returns uint[]
 {
   require((msg.sender==address1 && turn==1) || (msg.sender==address2 && turn==2));
   require(0<=x && x<n && 0<=y && y<n,"Invalid argument");
   require(Board[x][y]==0,"Invalid argument");
   Board[x][y] = turn;
 }
 
 function CheckWinner() public returns bool
 {
     uint i;
     uint j;
     for(i=0;i<n;i++)
     {
        if()
     }
 }
}

