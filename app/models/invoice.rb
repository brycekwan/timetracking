class Invoice < ApplicationRecord
  belongs_to :vendor
  belongs_to :company

  has_many :invoice_items, dependent: :destroy
end
