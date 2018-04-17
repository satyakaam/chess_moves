### Accept two parameters:
Type of chess piece (Queen, Rook, Knight)

### Return:
A list of all the potential board positions the given piece could advance to, with one move, from the given position, with the assumption there are
no other pieces on the board.

### Rules:
* You do not have to implement the solution for every piece type, but the solution must implement at least the following: Queen, Rook and
Knight.
* You may not use any external/non-core libraries: use only primitives and built-ins for the chosen language.

### Example:
If the code is passed: “knight, d2”
```sh
$ chessercise.rb -piece KNIGHT -position d2
```
The output should be: “b1, f1, b3, f3,c4, e4"

### Implement a “Target” mode with --target parameter.
* Randomly place 8 (opposing) pieces onto the board tiles.
* Determine the physically most distant tile from Current position. 
* Calculate and output the minimum set of moves which the given piece Type could take to the most distant tile given that:
  * Opposing pieces do not move.
  * Opposing pieces may be “captured” along the way by moving to the occupied tile.
  * Capturing an opposing piece marks the end of a “move”.
