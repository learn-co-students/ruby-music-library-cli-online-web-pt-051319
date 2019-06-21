class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    # @@all << self
    # save
    @songs = []

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre

    # new_genre
  end

  def songs
    @songs
  end

def artists
  songs.collect(&:artist).uniq
end

end
