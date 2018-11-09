pragma solidity ^0.4.25;

contract TicTacToe
{
 
 uint[][] public Board;
 uint n;
 uint starttime;
 uint gametime;
 uint count1=0;
 uint count2=0;
 address Owner;
 address address1;
 address address2;
 uint value1;
 uint value2;
 uint fee;
 //number of players
 uint num = 0;
 uint turn = 1;
 uint winner  = 0;
 uint paid = 0;
 
 constructor(uint _n,uint _gametime,uint _gamefee) public
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
     gametime = _gametime;
     fee = _gamefee;
 }
 
 function RegisterUser() public payable
 {
    require(address1!=msg.sender && address2!=msg.sender && num<2 ,"Invalid user");
    require(msg.value>=fee,"Less fee");
    if(num==0)
    {
        address1 = msg.sender;
        value1=(msg.value-fee);
    }
    else
    {
        address2 = msg.sender;
        value2=(msg.value-fee);
    }
    num++;
 }
 
 function StartGame() public returns(uint)
 {
    require(num==2 && msg.sender==Owner,"Invalid player");
    starttime  = now;
 }
 
 function take_input(uint x,uint y) public returns(uint[])
 {
   require((msg.sender==address1 && turn==1) || (msg.sender==address2 && turn==2));
   require(0<=x && x<n && 0<=y && y<n,"Invalid argument");
   require(Board[x][y]==0,"Invalid argument");
   require(starttime+(count1+count2)*gametime>=now && now<=starttime+(count1+count2+1)*gametime,"Invalid time");
   Board[x][y] = turn;
   if(turn ==1)
   {
    turn = 2;
    count1++;
   }
   else
   {
    turn = 1;
    count2++;
   }
 }
 
 function Pay() public
 {
     require(winner!=0,"Winner not yet decided");
     require(paid==0,"Already paid");
    if(winner==1)
    {
        address1.transfer(value1+2*fee);
        value1 = 0;
        address2.transfer(value2);
        value2 = 0;
    }
    else
    {
        address2.transfer(value2+2*fee);
        value2 = 0;
        address1.transfer(value1);
        value1 = 0;
    }
    paid = 1;
 }
 
 function CheckWinner() public
 {
    require(winner==0,"Winner already delcared");
    require(msg.sender==Owner,"You can't call");
    if(turn==1 && now>=starttime+(count1+count2+1)*gametime)
    {
        winner = 2;
        return;
    }
    if(turn==2 && now>=starttime+(count1+count2+1)*gametime)
    {
        winner = 1;
        return;
    }
     uint i;
     uint j;
     uint k;
     uint flag;
     for(k=1;k<=2;k++)
        { 
            
        for(i=0;i<n;i++)
            {
                flag=0;
                for(j=0;j<n;j++)
                {
                    if(Board[i][j]!=k)
                    {
                        flag=1;
                        break;
                    }
                }
                if(flag==0)
                {
                    winner = k;
                    return;
                }
            }
        for(j=0;j<n;j++)
        {
            flag=0;
            for(i=0;i<n;i++)
            {
                if(Board[i][j]!=k)
                {
                    flag=1;
                    break;
                }
            }
           if(flag==0)
                {
                    winner = k;
                    return;
                }
        }
        flag=0;
        for(i=0;i<n;i++)
        {
            if(Board[i][i]!=k)
            {
                flag=1;
                break;
            }
        }
        if(flag==0)
                {
                    winner = k;
                    return;
                }
        flag=0;
        for(i=0;i<n;i++)
        {
            if(Board[i][n-1-i]!=k)
            {
                flag=1;
                break;
            }
        }
      if(flag==0)
                {
                    winner = k;
                    return;
                }
        }
 }
}

