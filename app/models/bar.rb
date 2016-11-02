class Bar < ApplicationRecord
  belongs_to :neighborhood

  validates :name,:specialty_drink, presence: true
end
