# Tic Tac Toe

> Creating a Ruby App for the Tic Tac Toe game

Creating a Tic Tac Toe for learning how Object Oriented Programming works on Ruby

## Getting Started
According to Wikipedia, Tic Tac Toe is a game for two players, who take turn by marking spaces in a 3 x 3 grid. The player that succeedss in marking consecutive cells either on the same column, row or diagonal will win. 

"Games played on three-in-a-row boards can be traced back to ancient Egypt,[5] where such game boards have been found on roofing tiles dating from around 1300 BCE.[6]

An early variation of tic-tac-toe was played in the Roman Empire, around the first century BC. It was called terni lapilli (three pebbles at a time) and instead of having any number of pieces, each player only had three, thus they had to move them around to empty spaces to keep playing.[7] The game's grid markings have been found chalked all over Rome. Another closely related ancient game is three men's morris which is also played on a simple grid and requires three pieces in a row to finish,[8] and Picaria, a game of the Puebloans." -> Wikipedia (https://en.wikipedia.org/wiki/Tic-tac-toe)


## Instructions
Follow the ste-by-step guide:
  1. Download the current project on your local machine
  2. Open your terminal
  3. Execute bin/main.rb on the project folder within your terminal
  4. Input your first player name (Can't be empty)
  5. Choos your first player symbol. Select the Symbol you want the first player to markup the grid spaces. 
  6. Repeat 4 and 5 for the second player. 
  7. Start your game.
  8. Each turn you'll see the board like this:
      1 | 2 | 3
      ..|...|..
      4 | 5 | 6
      ..|...|..
      7 | 8 | 9
     a. The player at turn will mark the position by typing a number between 1 to 9. 
     b. Afterwards, the grid will be updated:
    example: Player One marked "X" for the 1st space. 
      X | 2 | 3
      ..|...|..
      4 | 5 | 6
      ..|...|..
      7 | 8 | 9    
      c. Continue, until one player wins or until there is no more empty spaces on the grid. 

  9. If you want to start over. Input bin/main.rb and start over. 

## Who Wins?
  The following patterns are the winning patterns:
    1. Row Pattern
    2. Column Pattern
    3. Diagonal Pattern 

## When do we get a tie?
  When the grid does not have any empty spaces left and no player has achieved any winning pattern. 
      X | O | X
      ..|...|..
      X | O | O
      ..|...|..
      O | X | O  


## About the Project

## Built With

- Ruby

## Authors

👤 Jocyline Magero

- Github: [@Jmagero](https://github.com/Jmagero)

👤 Santiago Rodriguez

- Github: [@srba87](https://github.com/srba87)
- Twitter: [@srba87](https://twitter.com/srba87)
- Linkedin: [srba87](https://linkedin.com/srba87)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
