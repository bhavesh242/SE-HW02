 object HelloWorld {
 	def count(board: Array[Array[Int]], i: Int, j: Int, rows: Int, cols: Int): Int ={
        var alive = 0
        if (i - 1 >= 0 && j - 1 >= 0 && board(i-1)(j-1) == 1)
            alive += 1
        
        if (i - 1 >= 0 && board(i-1)(j) == 1)
            alive += 1
        
        if (i - 1 >= 0 && j + 1 < cols && board(i-1)(j+1) == 1)
            alive += 1
        
        if (j - 1 >= 0 && board(i)(j-1) == 1)
            alive += 1
            
        if (j + 1 < cols && board(i)(j+1) == 1)
            alive += 1
            
        if (i + 1 < rows && j - 1 >= 0 && board(i+1)(j-1) == 1)
            alive += 1
            
        if (i + 1 < rows && board(i+1)(j) == 1)
            alive += 1
            
        if (i + 1 < rows && j + 1 < cols && board(i+1)(j+1) == 1)
            alive += 1
        
        return alive
    }
    
    def print_board(board: Array[Array[Int]], rows: Integer, cols: Integer){
        for(i <- 0 to rows - 1){
            for(j <- 0 to cols - 1){
                if(board(i)(j) == 1)
                    print ("o")
                else
                    print (" ")
            }
            print ("\n")
        }
    }
    
    def live(a: Array[Int], rows: Integer, cols: Integer): Array[Int] = {
        var board = Array.ofDim[Int](rows, cols)
        var c = 0
        
        while(c < rows * cols){
            board(c / cols)(c % cols) = a(c)
            c += 1
        }
        var ans = Array.ofDim[Int](rows, cols)
        
        for(i <- 0 to rows - 1){
            for(j <- 0 to cols - 1){
                var alive = count(board, i, j, rows, cols)
                if (board(i)(j) == 0){
                    if(alive == 3)
                        ans(i)(j) = 1
                    
                    else
                        ans(i)(j) = 0
                }
                else{
                    if (alive == 2 && alive == 3)
                        ans(i)(j) = 1
                    
                    else
                        ans(i)(j) = 0
                }
            }
        }
        print_board(ans, rows, cols)
        var next = new Array[Int](rows * cols)
        c = 0
        for(i <- 0 to rows - 1){
            for(j <- 0 to cols - 1){
                next(c) = ans(i)(j)
                c += 1
            }
        }
        return next
    }
    
    def life(rows: Integer, cols: Integer, gen: Integer){
        var size = rows * cols
        var now = new Array(Int)(size)
        
        val r = scala.util.Random
        for(i <- 0 to size - 1){
            var rnd =  r.nextFloat()
            if(rnd > 0.619)
                now[i] = 1
            
            else
                now(i) = 0
        }
        print ("\n\n")
        var next = now
        var curr = 0        
        
        while(curr < gen){
            println("Generation ", curr + 1)
            next = live(next, rows, cols)
            print ("\n\n")
            curr += 1
        }
    }
    def main(args: Array[String]) {
      life(20, 50, 2)
    }
  }