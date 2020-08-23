import 'dart:io';
import 'dart:math';
dynamic clearScreen()
{ 
  stdout.write('\x1B[2J\x1B[0;0H'); 
}

dynamic count(board,i,j,rows,cols)
{
  var alive = 0;
  if (i - 1 >= 0 && j - 1 >= 0 && board[i-1][j-1] == 1) 
  {
    alive++;
  }
        
  if (i - 1 >= 0 && board[i-1][j] == 1)
  {
    alive++;
  }     
  
  if (i - 1 >= 0 && j + 1 < cols && board[i-1][j+1] == 1)
  {
    alive++;
  }   
  
  if (j - 1 >= 0 && board[i][j-1] == 1)
  {
    alive++;
  }        
  
  if (j + 1 < cols && board[i][j+1] == 1)
  {
    alive++;
  }         
  
  if (i + 1 < rows && j - 1 >= 0 && board[i+1][j-1] == 1)
  {
    alive++;
  }        
  
  if (i + 1 < rows && board[i+1][j] == 1)
  {
    alive++;
  }        
  
  if (i + 1 < rows && j + 1 < cols && board[i+1][j+1] == 1)
  {
    alive++;
  }         
  return alive;
}

dynamic print_board(board,rows,cols)
{
  for(var i=0;i<rows;i++)
  {
    for(var j=0;j<cols;j++)
    {
      if(board[i][j] == 1)
      {
        stdout.write('o');
      }
      else
      {
         stdout.write(' ');
      }
                   
    }
    stdout.write('\n');
  }
}

dynamic life(rows, cols, some, generations) 
{ 
  var now = List(rows*cols); 
  for(var c=0;c<rows*cols; c++)
  { 
    var rand=Random().nextDouble();
    if(rand>some)
    {
      now[c]=1;
    }
    else
    {
      now[c]=0;
    }
  }
  for(var c=0;c<rows*cols; c++)
  {
    stdout.write(now[c]);
  }
  stdout.write('\n\n');
  var next = now;
  var curr = 1;       
  while(curr <= generations)
  {
    stdout.write('Generation  $curr');
    stdout.write('\n');
    next = live(next, rows, cols);
    stdout.write('\n\n');
    curr++;
  }
}

dynamic live(a, rows, cols) 
{
  var board = List.generate(rows, (i) => List(cols), growable: false);
  var c = 0;
  while(c < rows * cols)
  {
    board[(c / cols).floor()][c % cols] = a[c];
    c++;
  }
  var ans =List.generate(rows, (i) => List(cols), growable: false);    
  for(var i=0;i<rows;i++)
  {
    for(var j=0;j<cols;j++)
    {
      var alive = count(board, i, j, rows, cols);
      if (board[i][j] == 0)
      {
        if(alive == 3)
        {
          ans[i][j]= 1;
        }
        else
        {
          ans[i][j] = 0;
        }                    
      }
      else
      {
        if (alive == 2 || alive == 3)
        {
          ans[i][j] = 1;
        }
        else
        {
          ans[i][j] = 0;
        }
      }
    }
  }

  print_board(ans, rows, cols);
  var next = List(rows*cols); 
  c = 0;
  for(var i=0;i<rows;i++)
  {
    for(var j=0;j<cols;j++)
    {
      next[c] = ans[i][j];
      c++;
    }
  }
  return next; 
}

dynamic main()
{ 
  clearScreen();
  life(20,50,.619,10) ; 
}