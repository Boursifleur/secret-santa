class Event < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :gifts
  validates :name, presence: true
  validates :price, presence: true

  def has_enough_participants?
    self.participants.length > 2
  end

  def has_no_participant?
    self.participants.length == 0
  end
end
