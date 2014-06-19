class Question < ActiveRecord::Base
  has_many :answers

  validates :title,
    presence: true,
    length: { minimum: 40 }

  validates :description,
    presence: true,
    length: { minimum: 150 }
end
