# This is building a 4x4 board.
# With an array of 4 and a subset of 4 in each array.

buildBoard = ->

  board =[0..3].map -> ([0..3].map (->0))
  board
  console.log board

generateTile = ->
#  RandomGenerator

 # for iRow in board
 #   if iRow == 0
 #     then openplace


  console.log "generate tile"


# We are flattening the array
printArray = (array) ->
  for iRow in array
    console.log iRow







$ ->
  newBoard = buildBoard()
  printArray(newBoard)
  generateTile()
  generateTile()

