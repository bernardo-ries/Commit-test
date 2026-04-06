math.randomseed(os.time())

local debugEnemyBoats = false

matrixShipA = {
  {".", ".", ".", ".", "."},
  {".", ".", ".", ".", "."},
  {".", ".", ".", ".", "."},
  {".", ".", ".", ".", "."},
  {".", ".", ".", ".", "."}

}
matrixShipB = {
  {".", ".", ".", ".", "."},
  {".", ".", ".", ".", "."},
  {".", ".", ".", ".", "."},
  {".", ".", ".", ".", "."},
  {".", ".", ".", ".", "."}
}

function translatePlayerInput(input)
  if not input or #input < 2 then
    return nil, nil
  end

  local letter = string.sub(input, 1, 1):upper()
  local number = tonumber(string.sub(input, 2))

  if not number then
    return nil, nil
  end

  local column = string.byte(letter) - string.byte("A") + 1
  local row = number

  if row < 1 or row > 5 or column < 1 or column > 5 then
    return nil, nil
  end

  return row, column
end


function SetShipAPosition(matrixShipA)
  local i = 1
  while i <= 5 do
    print("Type the position of the ship " .. i .. " (row and column): ")
    local position = io.read()

    local row, column = translatePlayerInput(position)

    if not row or not column then
      print("Invalid position. Use format like A1 to E5.")
    elseif matrixShipA[row][column] == "." then
      matrixShipA[row][column] = "S"
      i = i + 1
    else
      print("Position already occupied, try again.")
    end
  end
end

function SetShipBPosition(matrixShipB)
  local i = 1
  while i <= 5 do
    local row = math.random(1, 5)
    local column = math.random(1, 5)

    if matrixShipB[row][column] == "." then
      matrixShipB[row][column] = "S"
      i = i + 1
    end
  end
end

function printMatrixB(matrix)
  io.write("  ")
  for j=1, 5 do
    io.write(string.char(string.byte("A") + j -1) .. " ")
  end
  print()

  for i= 1, 5 do
    io.write(i .. " ")
    for j=1, 5 do
      if matrix[i][j] == "S" then
        io.write(". ")
      else
        io.write(matrix[i][j] .. " ")
      end
    end
    print( )
  end
end

function printMatrix(matrix)
  io.write("  ")
  for j=1, 5 do
    io.write(string.char(string.byte("A") + j -1) .. " ")
  end
  print()

  for i= 1, 5 do
    io.write(i .. " ")
    for j=1, 5 do
      io.write(matrix[i][j] .. " ")
    end
    print( )
  end
end

function checkHit(matrixShip, row, column)
  if matrixShip[row][column] == "S" then
    matrixShip[row][column] = "X"
    return true
  else
    matrixShip[row][column] = "O"
    return false
  end
end


function checkWin(matrixShip)
  for i=1, 5 do
    for j=1, 5 do
      if matrixShip[i][j] == "S" then
        return false
      end
    end
  end
  return true
end

function playerTurnA(player, matrixShip)
  while true do
    print("Player " .. player .. ", it's your turn. Type the position to attack (row and column): ")
    local position = io.read()

    local row, column = translatePlayerInput(position)

    if not row or not column then
      print("Invalid position. Use format like A1 to E5.")
    elseif matrixShip[row][column] == "O" or matrixShip[row][column] == "X" then
      print("You already attacked this position.")
    else
      if checkHit(matrixShip, row, column) then
        print("Hit!")
      else
        print("Miss!")
      end
      break
    end
  end
end

function playerTurnB(player, matrixShip)
  while true do
    local row = math.random(1, 5)
    local column = math.random(1, 5)

    if matrixShip[row][column] ~= "O" and matrixShip[row][column] ~= "X" then
      print("Player " .. player .. " attacks position: " .. string.char(string.byte("A") + column - 1) .. row)

      if checkHit(matrixShip, row, column) then
        print("Hit!")
      else
        print("Miss!")
      end

      break
    end
  end
end

function gameLoop()
  while true do
    playerTurnA("A", matrixShipB)
    if checkWin(matrixShipB) then
      printMatrix(matrixShipA)

      if debugEnemyBoats then
        printMatrix(matrixShipB)
      else
        printMatrixB(matrixShipB)
      end

      print("\nPlayer A wins!")
      break
    end

    playerTurnB("B", matrixShipA)
    if checkWin(matrixShipA) then
      printMatrix(matrixShipA)

      if debugEnemyBoats then
        printMatrix(matrixShipB)
      else
        printMatrixB(matrixShipB)
      end

      print("\nPlayer B wins!")
      break
    end

    printMatrix(matrixShipA)

    if debugEnemyBoats then
      printMatrix(matrixShipB)
    else
      printMatrixB(matrixShipB)
    end
  end
end


print("Welcome to Battleship Game!")
print("Player A, set your ships.")
SetShipAPosition(matrixShipA)
print("Player B, set your ships.")
SetShipBPosition(matrixShipB)
print("Player A's ships:")
printMatrix(matrixShipA)
print("Player B's ships:")
if debugEnemyBoats then
  printMatrix(matrixShipB)
else
  printMatrixB(matrixShipB)
end

gameLoop()