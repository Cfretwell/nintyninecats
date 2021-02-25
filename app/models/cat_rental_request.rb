# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  start_date :date
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cat_id     :integer
#
# Indexes
#
#  index_cat_rental_requests_on_cat_id  (cat_id)
#
class CatRentalRequest < ApplicationRecord
    require 'action_view'
    include ActionView::Helpers::DateHelper

    STATUS = ["PENDING","APPROVED","DENIED"]

   


    validates :status, inclusion: {in: STATUS, message: "%{value} is not a valid status" }
    validates :status, :cat_id, :start_date, :end_date, presence: true 
    validate :does_not_overlap_approved_request

    belongs_to :cat  



    def overlapping_requests
        CatRentalRequest.where("cat_id = ? and start_date <= ? and end_date >= ?", self.cat_id, self.end_date, self.start_date) 
    end

    def overlapping_approved_requests
        self.overlapping_requests.where(status: "APPROVED")
    end

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists?
            errors.add(:overlapping, "Cant be overlapping with aproved rental requests")
            return false 
        end
    end
    

end

