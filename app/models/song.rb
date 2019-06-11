class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # gets the genre name from the new song form, takes the name and finds/creates the Genre from the db then associates the result with the song instance
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  # if genre exists get the name
  def genre_name
    self.try(:genre).try(:name)
  end

  # gets the artist name from the new song form, takes the name and finds/creates the Artist from the db and associates the result with the song instance
  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  # if artist exists get the name
  def artist_name
    self.try(:artist).try(:name)
  end

  # gets the notes array from the new song form, takes the content from each and checks for empty values then builds and associates each of the contents to a note object of the song
  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end
  
  # using the map shortcut, generates an array of the contents attributes from all the notes associated with this song will get returned with the #note_contents method
  def note_contents
    self.notes.map(&:content)
  end
end
