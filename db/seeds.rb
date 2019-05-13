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


def upload_fake_cover
  uploader = CoverUploader.new(Comic.new, :cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/covers', '*')).sample))
  uploader
end

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


def random_genre_id
  Genre.all.sample.id
  # p Genre.all.sample.id
end


@comics = [
  {
    title: "Horrific",
    genre_id: random_genre_id,
    # creator: "Šimon Kováč",
    cover: upload_fake_cover
  },{
    title: "DSII: Into the Light",
    genre_id: random_genre_id,
    # creator: "Brian K. Vaughan",
    cover: upload_fake_cover
  },{
    title: "Invincible Iron Man",
    genre_id: random_genre_id,
    # creator: "Thitiwat Shimma",
    cover: upload_fake_cover
  },{
    title: "Heavy Metal",
    genre_id: random_genre_id,
    # creator: "Jel Chibuzo",
    cover: upload_fake_cover
  },{
    title: "Children of the Moon",
    genre_id: random_genre_id,
    # creator: "Carlota Monteiro",
    cover: upload_fake_cover
  },{
    title: "Saga",
    genre_id: random_genre_id,
    # creator: "Rebecca Holder",
    cover: upload_fake_cover
  }
]

def create_comic(comic)
  Comic.create(
    # genre: genre[:genre]\
    title: comic[:title],
    genre_id: comic[:genre_id],
    # creator: "Rebecca Holder",
    cover: comic[:cover]
  )
end

@comics.each do |comic|
  comic = create_comic(comic)
  puts "Comic #{comic.title} created"
  # puts "Comic genre = #{comic.genre}"
end
