package main
import (
"fmt"
"math/rand"
)

func main() {
  life(20,50,10)
}

func count(board [][]int, i int,j int,rows int, cols int) int{
    var alive=0
    if (i-1>=0 && j-1>=0 && board[i-1][j-1]==1){
    alive+=1
    }
    if (i-1>=0 && board[i-1][j]==1){
        alive+=1
    }
    if (i-1>=0 && j+1<cols && board[i-1][j+1]==1){
        alive+=1
    }
    if (j-1>=0 && board[i][j-1]==1){
        alive+=1
    }
    if (j+1<cols && board[i][j+1]==1){
        alive+=1
    }
    if (i+1<rows && j-1>=0 && board[i+1][j-1]==1){
        alive+=1
    }
    if (i+1<rows && board[i+1][j]==1){
        alive+=1
    }
    if (i+1<rows && j+1<cols && board[i+1][j+1]==1){
        alive+=1
    }

    return alive
}

func life(rows int, cols int, gen int){
  var size=rows*cols

  var now=make([]int, size)

  for i:=0;i<size;i++{
    var r=rand.Float64()
    if (r>0.619){
      now[i]=1
    }else{
      now[i]=0
    }
  }

  for i:=0;i<size;i++{
  fmt.Print(now[i])
  }

  fmt.Print("\n\n")

  var next=now

  var curr=0

  for curr<gen{
    fmt.Println("Generation ",curr+1)
    next=live(next,rows,cols)
    fmt.Print("\n\n")
    curr+=1
  }

}

func live(a []int, rows int, cols int) []int{
  board:=make([][]int,rows)
  for i:=range board{
      board[i]=make([]int,cols)
  }

  var c=0

  for c<rows*cols{
    board[c/cols][c%cols]=a[c]
    c+=1
  }

  ans:=make([][]int,cols)
  for i:=range ans{
      ans[i]=make([]int,rows)
  }

  for i:=0;i<rows;i++{
    for j:=0;j<cols;j++{
      var alive=count(board,i,j,rows,cols)
      if board[i][j]==0{
        if alive==3{
          ans[i][j]=1
        }else{
          ans[i][j]=0
        }
      }else{
        if (alive==2 || alive==3){
          ans[i][j]=1
        }else{
          ans[i][j]=0
        }
      }
    }
  }

  print_board(ans,rows,cols)

  var next=make([]int, rows*cols)
  c=0
  for i:=0;i<rows;i++{
    for j:=0;j<cols;j++{
      next[c]+=ans[i][j]
      c+=1
    }
  }
  return next
}

func print_board(board [][]int, rows int, cols int){
  for i:=0;i<rows;i++{
    for j:=0;j<cols;j++{
      if (board[i][j]!=1){
        print("o")
      }else{
        print(" ")
      }
    }
    print("\n")
  }
}

