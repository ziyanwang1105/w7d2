class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true


end
