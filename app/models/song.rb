class Song < ApplicationRecord
   validates :title, presence: true
   validates_presence_of :release_year, if: Proc.new{self.released == true}
   validates :release_year, exclusion: Proc.new{self.release_year > Time.now}
end
