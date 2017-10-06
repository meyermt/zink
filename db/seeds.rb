# Reset the 'users' table
User.delete_all
cookie_monster = User.create name: 'Cookie Monster', username: 'cookiedude', email: 'cookies@example.com', password: 'cookies'
margaret = User.create name: 'Margaret Hamilton', username: 'hammy', email: 'margaret@example.com', password: 'apollo'
alan = User.create name: 'Alan Turing', username: 'compy', email: 'alan@example.com', password: 'enigma'
grace = User.create name: 'Grace Hopper', username: 'hoppy', email: 'grace@example.com', password: 'counterclockwise'
