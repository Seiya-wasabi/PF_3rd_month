class Prefecture < ApplicationRecord
    has_many :cities, dependent: :destroy
end

