class List < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  validates :name, presence: true
  validates :date, presence: true
  validates :total, presence: true
end
