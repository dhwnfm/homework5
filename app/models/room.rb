class Room < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :price, numericality: true
  validates :introduction, length: { in: 1..30 }
  validates :images, presence: true
  has_many :images, dependent: :destroy 
  accepts_nested_attributes_for :images 
  belongs_to :user, optional: true
  has_many :reservations, dependent: :destroy 

end
