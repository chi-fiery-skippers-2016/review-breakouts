class Cat < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :breed, presence: true, length: {minimum: 2}
end
