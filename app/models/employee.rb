class Employee < ApplicationRecord
    belongs_to :dog

    validates :last_name, :alias, :title, uniqueness: true
    #how do we validate first and last name together?
    def name
        self.first_name + " " + self.last_name
    end
end
