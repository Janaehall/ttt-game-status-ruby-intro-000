# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)

  WIN_COMBINATIONS.any? do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 and position_1 == position_3 and position_1 != " "
      return win_combination
    else
      false
    end
  end
end

def full?(board)
  board.none?{|pos| pos == " "}
end

def draw?(board)
  if full?(board) and won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) or won?(board)
    true
  else
    false
  end
end

def winner (board)
  if won?(board)
    board[won?(board)[0]]
  end
end
