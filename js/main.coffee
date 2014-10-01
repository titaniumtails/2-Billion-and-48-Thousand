buildBoard = ->

  board = []
  for iRow in [0..3]
    board[iRow] = []

    for iCell in [0..3]
      board[iRow][iCell] = 0
      
  board

generateTile = ->
#  RandomGenerator

 # for iRow in board
 #   if iRow == 0
 #     then openplace


  console.log "generate tile"


printArray = (array) ->

  for iRow in array
    console.log iRow


$ ->
  newBoard = buildBoard()
  printArray(newBoard)
  generateTile()
  generateTile()

