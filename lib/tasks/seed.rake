

require 'faker'
namespace :seed do 
  task :populategenres => :environment do 

    genre_names = []
    genres = 15.times.map do
      name = Faker::Music.unique.genre
      genre_names << name
      Genre.create!(
        name: name,
        description: Faker::Lorem.sentence(word_count: 10)
      )
    end
  end


  task :populate => :environment do 

    artists = 10.times.map do
      Artist.create!(
        name: Faker::Music.unique.band,
        biography: Faker::Lorem.paragraph(sentence_count: 3),
        debut_year: rand(1970..2024),
        country: Faker::Address.unique.country
      )
    end

    albums = 20.times.map do
      artist = artists.sample
      debut_year = artist.debut_year
      release_year = rand(debut_year..Date.today.year) # release year can't be before artist's debut

      Album.create!(
        title: Faker::Music.unique.album,
        release_year: release_year,
        release_date: Faker::Date.between(from: Date.new(release_year), to: Date.new(release_year,12,31)),
        artist: artist,
        genre: genres.sample
      )
    end


    albums.each do |album|
      track_names = []
      rand(5..12).times do |i|
        track_name = Faker::Music.unique::RockBand.song
        track_name = Faker::Music::RockBand.song if track_names.include?(track_name)
        track_names << track_name

        AlbumTrack.create!(
          album: album,
          track_name: track_name,
          track_number: i + 1
        )
      end
      Faker::Music.unique.clear 
    end


    media_types = %w[CD Vinyl Digital Cassette]
    conditions = %w[New Like-New Good Fair Poor]

    album_copies = 40.times.map do
      AlbumCopy.create!(
        album: albums.sample,
        media_type: media_types.sample,
        condition: conditions.sample,
        price: rand(5.0..30.0).round(2)
      )
    end

    customers = 10.times.map do
      Customer.create!(
        name: Faker::Name.unique.name,
        email: Faker::Internet.unique.email,
        telephone: Faker::PhoneNumber.unique.cell_phone
      )
    end


    customers.each do |customer|
      rand(1..3).times do
        selected_album_copies = album_copies.sample(rand(1..3))
        total_price = selected_album_copies.sum(&:price)

        order = Order.create!(
          customer: customer,
          order_date: Faker::Date.backward(days: 365),
          total_price: total_price
        )

        selected_album_copies.each do |copy|
          OrderAlbum.create!(
            order: order,
            album_copy: copy
          )
        end
      end
    end
  end
end