# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(username: "tim", password: "123456", email: "tim@gmail.com")
User.create(username: "musk", password: "123456", email: "musk@gmail.com")
User.create(username: "trump", password: "123456", email: "trump@gmail.com")
User.create(username: "tommy", password: "123456", email: "tommy@gmail.com")
User.create(username: "sid", password: "123456", email: "sid@gmail.com")


Transaction.create(user_id: 1, 
                    description: "Hashmap Labs",
                    amount: 3000,
                    category: "Education",
                    privacy: "shared",
                    date: "2013-10-20"
                    )
                    
Transaction.create(user_id: 1, 
                    description: "Walgreens",
                    amount: 50,
                    category: "Groceries",
                    privacy: "shared",
                    date: "2013-12-04"
                    )
                    
Transaction.create(user_id: 2, 
                    description: "SpaceX",
                    amount: 500,
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
                    amount: 125,
                    category: "Alien Technology",
                    privacy: "private",
                    date: "2013-12-10"
                    )
                    
Transaction.create(user_id: 3, 
                    description: "Orange Hair Pieces, inc.",
                    amount: 237,
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
                    
Transaction.create(user_id: 2, 
                    description: "Fricken' Lazers",
                    amount: 687,
                    category: "Entertainment",
                    privacy: "shared",
                    date: "2013-11-05"
                    )
                    
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
                body: "I'll build one on Mars."
                )
