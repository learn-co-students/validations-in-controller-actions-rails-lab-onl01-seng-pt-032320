class Post < ActiveRecord::Base
    CATEGORY_TYPES = ["Fiction","Non-Fiction"]
    validates :title, presence: true
    validates :category, inclusion: {in: CATEGORY_TYPES}
    validates :content, length:{minimum: 100}
end
