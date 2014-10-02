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
      row = mergeCells(row, direction)
      row = collapseCells(row, direction)
      console.log row

# GETS THE ROW
getRow = (row, boardArry)->
  console.log "I got a row"
  [boardArry[row][0], boardArry[row][1], boardArry[row][2], boardArry[row][3]]

mergeCells = (row, direction) ->
  if direction is 'right'
    for firstTilenum in [3...0]
      for secondTilenum in [firstTilenum-1..0]
        console.log firstTilenum, secondTilenum

        if row[firstTilenum] is 0
          console.log "Cell is 0"
          break

        else if row[firstTilenum] == row[secondTilenum]
          console.log "Cells are the same"

          row[firstTilenum] *= 2
          row[secondTilenum] = 0
          break

        else if row[secondTilenum] isnt 0 then break

  row

# COLLAPSE CELLS: THIS REMOVES THE 0 AND
# PUSHES IT TO THE OTHER SIDE OF THE DIRECTION

collapseCells = (row, direction) ->

  #Remove the '0's
  row = row.filter (x) -> x isnt 0

  #Adding back the '0's
  #Making sure it's the right direction for the shift
  if direction is 'right'
    while row.length < 4
      row.unshift 0
  row


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

  $('body').keydown (e) =>

    #put keys in an array, using indexOf to check the array
    key = e.which
    arrowkeys = [37..40]

    if key in arrowkeys
      #Prevents any key from bieng pressed except the 4 arrow buttons.
      e.preventDefault()

      #continue the game
      console.log "key : #{key}"

      direction = switch key
        when 37 then 'left'
        when 38 then 'up'
        when 39 then 'right'
        when 40 then 'down'
      console.log "direction : #{direction}"

      #try moving
      move(@board, direction)
      #check the move validity

    else
      #do nothing
