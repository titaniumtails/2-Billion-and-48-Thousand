#Making a random number for a tile on the board at random.

randomInt = (x) ->
  Math.floor(Math.random() * x)

randomCellIndices = ->
  [randomInt(4), randomInt(4)]


# This is building a 4x4 board.
# With an array of 4 and a subset of 4 in each array.
# We are flattening the array


buildBoard = ->

  board =[0..3].map -> ([0..3].map (->0))
  board
  console.log board

generateTile = ->
  value = 2
  console.log "randomInt: #{randomCellIndices()}"
  [row,column] = randomCellIndices()

  console.log "generate tile"


printArray = (array) ->
  for iRow in array



$ ->
  newBoard = buildBoard()
  printArray(newBoard)
  generateTile()
  generateTile()

