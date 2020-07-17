class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end
 
   def genre_name
      self.genre ? self.genre.name : ""
   end

   def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end
 
   def artist_name
      self.artist ? self.artist.name : ""
   end

   def note_contents=(notes)
   		notes.each do |note|
   		
   		if note.strip != ''	
   		self.notes.build(content: note)
   		end
   	 end

   end

   def note_contents
   	self.notes.map {|note| note.content }
   end
 


end
