class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.save
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
    self.save
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.save
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
