# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke


# Create users
@users = [
  {
    email: 'admin@admin.com',
    role:  'admin',
    nickname: 'Admin Rules'
  },{
    email: 'user1@user.com',
    role:  'logged user',
    nickname: 'Regular Mfk'
  },{
    email: 'user2@user.com',
    role:  'logged user',
    nickname: 'Us3r Userovich'
  }
]

def create_users(user)
  password = 'testtest'

  User.create(
    email:                 user[:email],
    role:                  user[:role],
    nickname:              user[:nickname],
    password:              password,
    password_confirmation: password
  )
end

@users.each do |user|
  u = create_users(user)
  puts "User with #{u.email} created"
end


# Create genres
@genres = [
  {
    title: "horror"
  },{
    title: "sci-fi"
  },{
    title: "adventure"
  },{
    title: "Marvel"
  },{
    title: "DC"
  },{
    title: "other"
  }
]

@genres.each do |genre|
  g = Genre.new(
    title: genre[:title]
  )

  if g.save
    puts "Genre #{g.title} created"
  else
    puts "Genre #{g.title} not created"
  end
end


# Fake covers
def upload_fake_cover
  uploader = CoverUploader.new(Comic.new, :cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/covers', '*')).sample))
  uploader
end

# Create descriptions
@descriptions = []

# Create comics
@comics = [
  {
    title:    "Horrific",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_cover,
    user_id:  User.all.sample.id
  },{
    title:    "DSII: Into the Light",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_cover,
    user_id:  User.all.sample.id
  },{
    title:    "Invincible Iron Man",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_cover,
    user_id:  User.all.sample.id
  },{
    title:    "Heavy Metal",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_cover,
    user_id:  User.all.sample.id
  },{
    title:    "Children of the Moon",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_cover,
    user_id:  User.all.sample.id
  },{
    title:    "Saga",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_cover,
    user_id:  User.all.sample.id
  }
]

def create_comic(comic)
  Comic.create(
    title:    comic[:title],
    genre_id: comic[:genre_id],
    cover:    comic[:cover],
    user_id:  comic[:user_id]
  )
end

@comics.each do |comic|
  comic = create_comic(comic)
  puts "Comic #{comic.title} created"
  # puts "Comic genre = #{comic.genre}"
end
