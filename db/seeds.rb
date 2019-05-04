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

Genre.create([
  {
    genre: "horror"
  },{
    genre: "sci-fi"
  },{
    genre: "adventure"
  },{
    genre: "Marvel"
  },{
    genre: "DC"
  },{
    genre: "other"
  }
])

def random_genre_id
  Genre.offset(rand(Genre.count)).first.id
end


Comic.create([
  {
    title: "Horrific",
    genre: random_genre_id,
    # creator: "Šimon Kováč",
    cover: upload_fake_cover
  },{
    title: "DSII: Into the Light",
    genre: random_genre_id,
    # creator: "Brian K. Vaughan",
    cover: upload_fake_cover
  },{
    title: "Invincible Iron Man",
    genre: random_genre_id,
    # creator: "Thitiwat Shimma",
    cover: upload_fake_cover
  },{
    title: "Heavy Metal",
    genre: random_genre_id,
    # creator: "Jel Chibuzo",
    cover: upload_fake_cover
  },{
    title: "Children of the Moon",
    genre: random_genre_id,
    # creator: "Carlota Monteiro",
    cover: upload_fake_cover
  },{
    title: "Saga",
    genre: random_genre_id,
    # creator: "Rebecca Holder",
    cover: upload_fake_cover
  }
])
