class Company < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :vendors, dependent: :destroy

  broadcasts_to ->(company) { ["companies"] }, inserts_by: :prepend
end
