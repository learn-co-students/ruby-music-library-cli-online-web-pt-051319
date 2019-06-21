module Concerns

	# instance methods


	module Saveable

		def save
			self.class.all << self
		end

	end

	# class methods

	module Findable

		def find_by_name(name)
			self.all.detect{ |item| item.name == name}
		end

		def create(name)
			self.new(name).tap{ |genre| genre.save }
		end

		def find_or_create_by_name(name)
			self.find_by_name(name) || self.create(name)
		end

	end

	module Destroyable

		def destroy_all
			self.all.clear
		end

	end

end