class Service < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name, case_sentitive: false
    validates :duration, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 180}
    validates :client_price, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10000}

    

    def to_s
        name
    end
end
