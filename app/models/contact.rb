class Contact < ApplicationRecord
  include HasImage

  belongs_to :user

  has_many :events
end
