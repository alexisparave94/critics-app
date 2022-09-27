puts "Begin Seeds"

puts "Destroy data"
Critic.destroy_all
InvolvedCompany.destroy_all
User.destroy_all
Company.destroy_all
Game.destroy_all
Platform.destroy_all
Genre.destroy_all

puts "Seeding games"
game1 = Game.create(name: "Last of us", summary: "Shadow of the Tomb Raider is a 2018 action-adventure video game developed by Eidos-Montréal and published by Square Enix. It continues the narrative from the 2015 game Rise of the Tomb Raider and is the twelfth mainline entry in the Tomb Raider series. The game was originally released worldwide for Microsoft Windows, PlayStation 4 and Xbox One. Versions for macOS and Linux, and Stadia, were released in November 2019. After release, the game was expanded upon with downloadable content in both a season pass and as standalone releases.", release_date: "14-09-2018", rating: 94, category: 0)

game1.cover.attach(io: File.open("db/images/image_last_of_us.png"), filename: "image_last_of_us.png")

game2 = Game.create(name: "Super Mario World", summary: " 2D platformer and first entry on the SNES in the Super Mario...", release_date: "14-09-1990", rating: 96.4, category: 0)

puts "Seeding companies"
comp1 = Company.create(name: "Nintendo", description: "Nintendo Co., Ltd. is a multinational corporation located in Kyoto, Japan. Founded on September 23, 1889 by Fusajiro Yamauchi, it produced handmade hanafuda cards.", start_date: "15-05-1916", country: "Japan")

comp1.cover.attach(io: File.open("db/images/image_nintendo.png"), filename: "image_nintendo.png")

puts "Seeding inolved companies"
inv = InvolvedCompany.create(game: game2, company: comp1, developer: true )

puts "Seeding users"
user1 = User.create(username: "Alexis", email: "alexis@mail.com")
user2 = User.create(username: "Lazaro", email: "lazaro@mail.com")

puts "Seeding critics"
cri1 = Critic.create(title: "Critic 1",body: "This is the critic 1", criticable: game1, user: user1 )
puts cri1
cri2 = Critic.create(title: "Critic 2",body: "This is the critic 2", criticable: game1, user: user2 )
cri3 = Critic.create(title: "Critic 3",body: "This is the critic 3", criticable: comp1, user: user1 )
cri4 = Critic.create(title: "Critic 4",body: "This is the critic 4", criticable: comp1, user: user2 )

puts "Seeding platforms"
plat1 = Platform.create(name: "PlayStation")
plat2 = Platform.create(name: "Xbox")
plat3 = Platform.create(name: "Wii")
plat4 = Platform.create(name: "SuperNintendo")

puts "Seeding genres"
genre1 = Genre.create(name: "Shotter")
genre2 = Genre.create(name: "Adventure")
genre3 = Genre.create(name: "Sport")
genre4 = Genre.create(name: "Indie")
genre5 = Genre.create(name: "Simulator")

puts "End seeds"