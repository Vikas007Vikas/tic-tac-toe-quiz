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
}

