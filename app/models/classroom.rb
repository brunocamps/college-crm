class Classroom < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates_uniqueness_of :name, case_sentitive: false

    def to_s
        name
    end
end
