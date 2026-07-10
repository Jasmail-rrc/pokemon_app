class Pokemon < ApplicationRecord
  belongs_to :type

  validates :name, presence: true
  validates :height, presence: true
  validates :weight, presence: true
end