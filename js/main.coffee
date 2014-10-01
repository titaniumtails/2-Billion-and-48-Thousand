#Making a random number for a tile on the board at random.
#Floor puts it to the lowest number, we are looking for 0 - 3, so therefore we times by 4.

randomInt = (x) ->
  Math.floor(Math.random() * x)

randomCellIndices = ->
  [randomInt(4), randomInt(4)]

randomValue = ->
  values = [2, 2, 2, 2]
  values[randomInt(4)]


# This is building a 4x4 board.
# With an array of 4 and a subset of 4 in each array.
# We are flattening the array

buildBoard = ->
  [0..3].map -> ([0..3].map (->0))
  

generateTile = (board) ->
  value = 2

# Places the tile at a random place
  [row, column] = randomCellIndices()

# We create a condition in case the 2 numbers land on the same place.
  if board[row][column] is 0
    #Gives it the value 2
    board[row][column] = value

  else
    generateTile(board)

  console.log "row: #{row} / column: #{column}"
  console.log "generate tile"

showBoard = (board) ->
#A double for loop because it is the same.
  for rowArray in [0...3]
    for colArray in [0..3]
      $(".r#{rowArray}.c#{colArray} > div").html(2)

  console.log "Show Board"

printArray = (array) ->
  console.log "---Start---"

  for iRow in array
    console.log iRow

  console.log "---End---"


$ ->
  newBoard = buildBoard()
  generateTile(newBoard)
  generateTile(newBoard)
  showBoard(newBoard)
  printArray(newBoard)


