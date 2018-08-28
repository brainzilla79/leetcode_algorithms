# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

# Now consider if some obstacles are added to the grids. How many unique paths would there be?

# https://leetcode.com/static/images/problemset/robot_maze.png

# An obstacle and empty space is marked as 1 and 0 respectively in the grid.

# Note: m and n will be at most 100.

# Example 1:

# Input:
# [
#   [0,0,0],
#   [0,1,0],
#   [0,0,0]
# ]
# Output: 2
# Explanation:
# There is one obstacle in the middle of the 3x3 grid above.
# There are two ways to reach the bottom-right corner:
# 1. Right -> Right -> Down -> Down
# 2. Down -> Down -> Right -> Right

def unique_paths_with_obstacles(obstacle_grid)
    m, n = obstacle_grid.length, obstacle_grid[0].length
    m.times do |i|
        n.times do |j|
            if obstacle_grid[i][j] == 1
                obstacle_grid[i][j] = 0
            elsif i == 0 && j == 0
                obstacle_grid[i][j] = 1
            elsif i == 0
                obstacle_grid[i][j] = obstacle_grid[i][j-1] * 1
            elsif j == 0
                obstacle_grid[i][j] = obstacle_grid[i-1][j] * 1
            else 
                obstacle_grid[i][j] = obstacle_grid[i-1][j] + obstacle_grid[i][j - 1]
            end 
        end 
    end 

    obstacle_grid[m-1][n-1]
end