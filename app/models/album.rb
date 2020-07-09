class Album < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  
  validates :title, presence: true, uniqueness: { scope: :user,
  message: "already exists" }

  
  scope :prog_rock, -> { where(genre: "Progressive Metal") }
  def self.prog_rock
    where(genre: 'Progressive Metal')
  end
end
