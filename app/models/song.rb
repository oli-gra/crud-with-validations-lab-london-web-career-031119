class Song < ApplicationRecord
   validates :title, presence: true
   validates :release_year, presence: true, if released?

   def released?
      self.released == true
   end

end
