Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke


# Create users

# Fake userpic uploader
def upload_fake_userpic
  uploader = UserpicUploader.new(User.new, :userpic)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/user/userpics', '*')).sample))
  uploader
end

@users = [
  {
    email:    'admin@admin.com',
    role:     'admin',
    nickname: 'Admin Rules',
    userpic:  upload_fake_userpic
  },{
    email:    'user1@user.com',
    role:     'logged user',
    nickname: 'Regular Mfk',
    userpic:  upload_fake_userpic
  },{
    email:    'user2@user.com',
    role:     'logged user',
    nickname: 'Us3r Userovich',
    userpic:  upload_fake_userpic
  }
]

def create_users(user)
  password = 'testtest'

  User.create(
    email:                 user[:email],
    role:                  user[:role],
    nickname:              user[:nickname],
    userpic:               user[:userpic],
    password:              password,
    password_confirmation: password
  )
end

@users.each do |user|
  u = create_users(user)
  puts "User with #{u.email} created"
end


# Fake genre covers
def upload_fake_genre_cover
  uploader = GenreCoverUploader.new(Genre.new, :cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/genre/covers', '*')).sample))
  uploader
end

# Create genres
@genres = [
  {
    title: "horror",
    cover: upload_fake_genre_cover
  },{
    title: "sci-fi",
    cover: upload_fake_genre_cover
  },{
    title: "adventure",
    cover: upload_fake_genre_cover
  },{
    title: "Marvel",
    cover: upload_fake_genre_cover
  },{
    title: "DC",
    cover: upload_fake_genre_cover
  },{
    title: "other",
    cover: upload_fake_genre_cover
  }
]

@genres.each do |genre|
  g = Genre.new(
    title: genre[:title],
    cover: genre[:cover]
  )

  if g.save
    puts "Genre #{g.title} created"
  else
    puts "Genre #{g.title} not created"
  end
end


# Fake comic covers
def upload_fake_comic_cover
  uploader = CoverUploader.new(Comic.new, :cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/comic/covers', '*')).sample))
  uploader
end


# Create descriptions
@descriptions = [
  "New Episodes every Friday. From the deepest, darkest, corners of the world, Darkbox brings you Silent Horror Z.",
  "Max is your average high school student trying to get through life as himself. He may not be your average boy, being assigned female at birth, but he is set on being the man he is. Though, Trying to come out to his parents is one thing, his mom coming out as a Magical Girl is another. Now it is Max responsibility to take on the family tradition of becoming the next Magical Girl and save humanity.",
  "Once every ten years, a random girl awakens as a witch with immeasurable power that is destined to destroy the world. To prevent this calamity from happening, four sacred tournaments are held one year prior to her birth to train and select a party of heroes strong enough to slay her.",
  "Milo always dreamt of owning a big dog. They’re protective, cuddly, playful. Som the Samoyed, on the other paw, is anything but. She barks all night, sheds hair bombs, steals the Wi-Fi password, and might just be a supervillain?! Som the EXTREME Samoyed is un-leashed!",
  "Those who die mysterious deaths go on to become legends. All according to plan. Morality and mortality become intermixed in this action packed thriller that demands the reader to answer the ultimate question: what exactly is worth dying for?",
  "Is this a comic or a game? When the players are not around, the NPCs start to worry. Join a band of silly NPCs (non-playable characters) as they attempt to free their cursed village and find their creator!"
]


# Create comics
@comics = [
  {
    title:    "Horrific",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_comic_cover,
    user_id:  User.all.sample.id,
    description: @descriptions.sample
  },{
    title:    "DSII: Into the Light",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_comic_cover,
    user_id:  User.all.sample.id,
    description: @descriptions.sample
  },{
    title:    "Invincible Iron Man",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_comic_cover,
    user_id:  User.all.sample.id,
    description: @descriptions.sample
  },{
    title:    "Heavy Metal",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_comic_cover,
    user_id:  User.all.sample.id,
    description: @descriptions.sample
  },{
    title:    "Children of the Moon",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_comic_cover,
    user_id:  User.all.sample.id,
    description: @descriptions.sample
  },{
    title:    "Saga",
    genre_id: Genre.all.sample.id,
    cover:    upload_fake_comic_cover,
    user_id:  User.all.sample.id,
    description: @descriptions.sample
  }
]

def create_comic(comic)
  Comic.create(
    title:       comic[:title],
    genre_id:    comic[:genre_id],
    cover:       comic[:cover],
    user_id:     comic[:user_id],
    description: comic[:description]
  )
end

@comics.each do |comic|
  comic = create_comic(comic)
  if comic.save
    puts "Comic #{comic.title} created"
  else
    puts "Comic #{comic.title} not created"
  end
  # puts "Comic #{comic.title} created"
  # puts "Comic genre = #{comic.genre}"
end
