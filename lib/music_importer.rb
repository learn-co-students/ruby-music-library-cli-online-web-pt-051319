class MusicImporter

	def initialize(path)
		@path = path
	end

	def path
		@path
	end

	def path=(path)
		@path = path
	end

	def library
		@library
	end

	def library=(library)
		@library = library
	end

	def files
		self.library = Dir["#{@path}/*"].map{ |file| file.split("/").last }
	end

	def import
		self.files.each{ |filename| Song.create_from_filename(filename) }
	end

end