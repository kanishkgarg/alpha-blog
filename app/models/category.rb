class Category < ActiveRecord::Base
    validates :name, presence: true, length: {maximum: 15, minimum: 3}
    validates_uniqueness_of :name
end