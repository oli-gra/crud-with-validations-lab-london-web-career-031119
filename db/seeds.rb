
40.times do
   Song.create(
      title: Faker::Games::Zelda.character,
      released: [true,false].sample,
      release_year: Faker::Date.between(10.years.ago, Date.today),
      artist_name: Faker::Books::Dune.character,
      genre: Faker::Books::Dune.planet)
end