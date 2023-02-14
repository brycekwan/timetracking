class Timesheet < ApplicationRecord
  #after_create_commit -> { broadcast_prepend_to "timesheets"}
  #after_update_commit -> { broadcast_replace_to "timesheets" }
  #after_destroy_commit -> { broadcast_remove_to "timesheets" }
  belongs_to :user
  belongs_to :work_order
  belongs_to :invoice, optional: true
  validates :sunday, numericality: { in: 0..24 }, allow_nil: true
  validates :monday, numericality: { in: 0..24 }, allow_nil: true
  validates :tuesday, numericality: { in: 0..24 }, allow_nil: true
  validates :wednesday, numericality: { in: 0..24 }, allow_nil: true
  validates :thursday, numericality: { in: 0..24 }, allow_nil: true
  validates :friday, numericality: { in: 0..24 }, allow_nil: true
  validates :saturday, numericality: { in: 0..24 }, allow_nil: true

  broadcasts_to ->(timesheet) { [timesheet.user, "timesheets"] },
                inserts_by: :prepend

  def total_hours
    [sunday, monday, tuesday, wednesday, thursday, friday, saturday].compact.sum
  end

  def invoiced? 
    self.invoice_id.present?
  end 
end
