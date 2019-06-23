class MusicImporter
  attr_accessor :path
  
  def initialize(filepath)  #accepts a file path
    @path = filepath
  end
  
  def files
    files = Dir.entries(@path).select {|song| song.end_with?(".mp3")}
  end
  

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end
  
    
end