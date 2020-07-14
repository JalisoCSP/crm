class Contact < ApplicationRecord
  include HasImage

  belongs_to :user
end
