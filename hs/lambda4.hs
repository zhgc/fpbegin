data Nat = ZERO 
         | SUCC Nat 
         | ADD Nat Nat
         | MUL Nat Nat

eval :: Nat -> Nat 
eval ZERO             = ZERO
eval (SUCC n)         = SUCC (eval n)
eval (ADD ZERO n)     = eval n
eval (ADD n ZERO)     = eval n
eval (ADD (SUCC n) m) = SUCC $ eval (ADD n m)
eval (ADD n (SUCC m)) = SUCC $ eval (ADD n m)




