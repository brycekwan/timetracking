class Vendor < ApplicationRecord
    broadcasts_to ->(vendor) { ["vendors"] },
    inserts_by: :prepend

    belongs_to :company
    has_many :invoice, dependent: :destroy
end
