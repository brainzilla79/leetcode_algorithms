# You are given a two-dimensional array (matrix) of potentially unequal height and width containing only 0s and 1s. Each 0 represents land, and each 1 represents part of a river. A river consists of any number of 1s that are either horizontally or vertically adjacent (but not diagonally adjacent). The number of adjacent 1s forming a river determines its size. Write a function that returns an array of the sizes of all rivers represented in the input matrix. Note that these sizes do not need to be in any particular order.

# Sample Input:

# [
#   [1,0,0,1,0],
#   [1,0,1,0,0],
#   [0,0,1,0,1],
#   [1,0,1,0,1],
#   [1,0,1,1,0]
# ]
# Sample Output:

# => [1,2,2,2,5]
def get_unvisited(i, j, visited, matrix)
  unvisited = []
  unvisited << [i - 1, j] if i > 0 && !visited[i - 1][j] 
  unvisited << [i + 1][j] if i < matrix.length - 1 && !visited[i + 1][j]
  unvisited << [i][j - 1] if j > 0 && !visited[i][j - 1]
  unvisited << [i][j + 1] if j < matrix[0].length - 1 && !visited[i][j + 1]
  unvisited
end

def traverse_node(i, j, visited, matrix)
  res = 0
  stack = [[i, j]]

  while stack.length > 0 
    pos = stack.pop
    i, j = pos
    next if visited[i][j]
    visited[i][j] = true
    next if matrix[i][j] == 0
    res += 1
    unvisited = get_unvisited(i, j, visited, matrix)
    unvisited.each do {|pos| stack << pos }
  end 
end 

def river_sizes(matrix)
  res = []
  visited = matrix.map {|row| row.map {|el| false }}
  matrix.each_with_index do |row, i|
    row.each_with_index do |el, j| 
      next if visited[i][j]
      river_size = traverse_node(i, j, visited, matrix)
      res << river_size if river_size > 0
    end 
  end 
end

matrix = [
  [1,0,0,1,0],
  [1,0,1,0,0],
  [0,0,1,0,1],
  [1,0,1,0,1],
  [1,0,1,1,0]
]

p river_sizes(matrix) == [1,2,2,2,5]
