#Making a random number for a tile on the board at random.

randomInt = (x) ->
  Math.floor(Math.random() * x)

randomCellIndices = ->
  [randomInt(4), randomInt(4)]


# This is building a 4x4 board.
# With an array of 4 and a subset of 4 in each array.
# We are flattening the array


buildBoard = ->
  [0..3].map -> ([0..3].map (->0))
  

generateTile = (board) ->
  value = 2
  console.log "randomInt: #{randomCellIndices()}"
  [row,column] = randomCellIndices()
  board[row][column] = value

  console.log "generate tile"


printArray = (array) ->
  for iRow in array
    console.log iRow



$ ->
  newBoard = buildBoard()
  generateTile(newBoard)
  generateTile(newBoard)
  printArray(newBoard)


