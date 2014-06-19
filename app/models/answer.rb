class Answer < ActiveRecord::Base
  belongs_to :question

  validates :description,
    presence: true,
    length: { minimum: 50 }
end
