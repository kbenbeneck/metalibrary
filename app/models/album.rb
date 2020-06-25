class Album < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  
  validates :title, presence: true, uniqueness: true
  
  scope :prog_rock, -> { where(genre: "Progressive Metal") }
  def self.prog_rock
    where(genre: 'Progressive Metal')
  end
end
