class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validate :fiction_or_nonfiction, on: %i[create update]

  def fiction_or_nonfiction
    return if category == 'Fiction' || category == 'Non-Fiction'

    errors.add(:category, 'must be Fiction or Non-Fiction')
  end
end
