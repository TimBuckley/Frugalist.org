# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(username: "Tim", password: "123456", email: "tim@gmail.com")
User.create(username: "Musk", password: "123456", email: "musk@gmail.com")
User.create(username: "Trump", password: "123456", email: "trump@gmail.com")
User.create(username: "Bob", password: "123456", email: "bob@gmail.com")
User.create(username: "Alice", password: "123456", email: "alice@gmail.com")


Transaction.create(user_id: 4, description: "Best Buy",amount: 15.4,category: "Electronics",privacy: "shared",date: "2013-11-04")
Transaction.create(user_id: 4, description: "CSS-ifier",amount: 13.1,category: "Software",privacy: "shared",date: "2013-12-05")
Transaction.create(user_id: 4, description: "ConEdison",amount: 84.4,category: "Utilities",privacy: "shared",date: "2013-12-06")
Transaction.create(user_id: 4, description: "MTA",amount: 63.6,category: "Transport",privacy: "shared",date: "2013-12-01")
Transaction.create(user_id: 5, description: "Trader Joe's",amount: 31.8,category: "Food",privacy: "shared",date: "2013-12-02")
Transaction.create(user_id: 5, description: "Netflix",amount: 8,category: "Entertainment",privacy: "shared",date: "2013-12-07")


Transaction.create(user_id: 1, description: "Amazon",amount: 19,category: "Shopping",privacy: "shared",date: "2013-12-17")
Transaction.create(user_id: 1, description: "Audible.com",amount: 9,category: "Entertainment",privacy: "shared",date: "2013-12-17")
Transaction.create(user_id: 1, description: "Bullys Deli",amount: 10.34,category: "Food",privacy: "shared",date: "2013-12-16")
Transaction.create(user_id: 1, description: "Just Salad",amount: 8.3,category: "Food",privacy: "shared",date: "2013-12-16")
Transaction.create(user_id: 1, description: "Benny Burritos",amount: 12.2,category: "Food",privacy: "shared",date: "2013-12-11")
Transaction.create(user_id: 1, description: "DEPT EDUCATION",amount: 61.03,category: "Education",privacy: "shared",date: "2013-12-10")
Transaction.create(user_id: 1, description: "ATM Withdrawal",amount: 100,category: "Withdrawal",privacy: "shared",date: "2013-12-09")
Transaction.create(user_id: 1, description: "Netflix",amount: 8,category: "Entertainment",privacy: "shared",date: "2013-11-11")
Transaction.create(user_id: 1, description: "MTA",amount: 110,category: "Transport",privacy: "shared",date: "2013-12-07")





Transaction.create(user_id: 1, 
                    description: "Hashmap Labs",
                    amount: 300,
                    category: "Education",
                    privacy: "shared",
                    date: "2013-10-20"
                    )
                    
Transaction.create(user_id: 1, 
                    description: "Walgreens",
                    amount: 23,
                    category: "Groceries",
                    privacy: "shared",
                    date: "2013-12-04"
                    )
                    
Transaction.create(user_id: 2, 
                    description: "SpaceX",
                    amount: 50,
                    category: "Rockets",
                    privacy: "shared",
                    date: "2013-12-05"
                    )
                    
Transaction.create(user_id: 2, 
                    description: "Tesla Motors",
                    amount: 12.65,
                    category: "Batteries",
                    privacy: "shared",
                    date: "2013-12-05"
                    )
                    
Transaction.create(user_id: 2, 
                    description: "Mars Colony 1",
                    amount: 123,
                    category: "Alien Technology",
                    privacy: "private",
                    date: "2013-12-10"
                    )
                    
Transaction.create(user_id: 3, 
                    description: "Orange Hair Pieces, inc.",
                    amount: 57,
                    category: "Hair Products",
                    privacy: "private",
                    date: "2013-12-19"
                    )
                    
Transaction.create(user_id: 3, 
                    description: "Golden Trump Statuette",
                    amount: 383,
                    category: "Entertainment",
                    privacy: "shared",
                    date: "2013-11-05"
                    )
                    
Transaction.create(user_id: 2, description: "Fricken' Lazers",amount: 687,category: "Entertainment",privacy: "shared",date: "2013-11-05")
                    
Convo.create(pairing: "1a2")
Convo.create(pairing: "2a3")
                    

Message.create(convo_id: 1,
                author_id: 1,
                recipient_id: 2,
                body: "I have a great business idea for batter-powered rockets!"
                )

Message.create(convo_id: 1,
                author_id: 2,
                recipient_id: 1,
                body: "...I'm listening."
                )
                
Message.create(convo_id: 2,
                author_id: 3,
                recipient_id: 2,
                body: "No golden statues of yourself?"
                )

Message.create(convo_id: 1,
                author_id: 2,
                recipient_id: 3,
                body: "I'll build one on Mars.")
