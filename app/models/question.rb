class Question < ActiveRecord::Base
  belongs_to :author,
    class_name: 'User',
    foreign_key: 'user_id'

  has_many :answers,
    dependent: :destroy

  validates :title,
    presence: true,
    length: { minimum: 40 }

  validates :description,
    presence: true,
    length: { minimum: 150 }
end
