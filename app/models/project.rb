class Project < ApplicationRecord
    belongs_to :company
    has_many :work_orders, dependent: :destroy

    broadcasts_to ->(project) { ["project"] }, inserts_by: :prepend
end
