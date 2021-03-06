class Artist < ApplicationRecord
    validates :name, presence: true
    
    has_many :albums, dependent: :delete_all
    has_many :users, through: :albums
    accepts_nested_attributes_for :albums
    
end
