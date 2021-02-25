# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  description :text             not null
#  name        :string           not null
#  sex         :string(1)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#



class Cat < ApplicationRecord
    require 'action_view' 
    include ActionView::Helpers::DateHelper

    COLORS = ["White", "Blue", "Black","Orange"]
    
    validates :birth_date, :color, :description, :name, :sex, presence: true
    validates :color, inclusion: { in: COLORS, message: "%{value} is not a valid color" }
    validates :sex, inclusion: { in: ["M","F"], message: "%{value} is not a valid sex"}

    has_many :cat_rental_requests, dependent: :destroy 

    def age()
        return time_ago_in_words(birth_date)+ " old"
    end



end
