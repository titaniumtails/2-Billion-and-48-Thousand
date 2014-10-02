# Making a random number for a tile on the board at random.
# Floor puts it to the lowest number, we are looking for 0 - 3,
# so therefore we times by 4
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

move = (board, direction) ->
  for i in [0..3]
    if direction is 'right'
      row = getRow(i, board)
      mergeCells(row, direction)
      collapseCells()

getRow = (row, boardIndx)->
  [boardIndx[row][0], boardIndx[row][1], boardIndx[row][2], boardIndx[row][3]]
  console.log "I got a row"

mergeCells = ->
  console.log "I got a merged cells"
  if direction is 'right'
    for firstTilenum in [3..0]
      for secondTilenum in [firstTilenum-1..0]
        console.log "My tile nums #{firstTilenum} and #{secondTilenum}"
        #row[firstTilenum] == row[secondTilenum]

collapseCells = ->
  console.log "I'm collapsing cells"


showBoard = (board) ->
#A double for loop because it is the same.
  for rowArray in [0..3]
    for colArray in [0..3]
      $(".r#{rowArray}.c#{colArray} > div").html(board[rowArray][colArray])

  console.log "Show Board"

printArray = (array) ->
  console.log "---Start---"

  for iRow in array
    console.log iRow

  console.log "---End---"


$ ->
  @board = buildBoard()
  generateTile(@board)
  generateTile(@board)
  showBoard(@board)
  printArray(@board)


  $('body').keydown (e) =>
  
    #Prevents any key from bieng pressed except the 4 arrow buttons.
    e.preventDefault()

    #put keys in an array, using indexOf to check the array
    key = e.which
    arrowkeys = [37..40]

    if key in arrowkeys > -1
      #continue the game

      direction = switch key
        when 37 then 'left'
        when 38 then 'up'
        when 39 then 'right'
        when 40 then 'down'
      console.log "direction : #{direction}"
    else
      #do nothing