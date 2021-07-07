class MusicImporter
   attr_accessor :path
  
  def initialize(path) #accepts a file path
    @path = path
  end
  
  def files
 Dir.entries(path).select {|entry| entry.include?(".mp3")} #loads mp3 files in the path directory
 end
  
  def import
  files.each {|filename| Song.create_from_filename(filename)}
 end

end