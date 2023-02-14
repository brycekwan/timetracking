class WorkOrder < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :timesheets, dependent: :destroy
end
