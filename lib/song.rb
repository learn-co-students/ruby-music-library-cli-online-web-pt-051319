class Song
  attr_accessor :name
  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    @genre = genre
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
    # save
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
    song = self.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push self unless genre.songs.include? self
    # genre.add_song(self)
  end

  def self.find_by_name(name)
    all.find{|song| song.name == name }

  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)

  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    fixed = genre.gsub('.mp3', "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed)
    new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end



end
