class Timesheet < ApplicationRecord
  #after_create_commit -> { broadcast_prepend_to "timesheets"}
  #after_update_commit -> { broadcast_replace_to "timesheets" }
  #after_destroy_commit -> { broadcast_remove_to "timesheets" }
  belongs_to :user
  belongs_to :work_order

  broadcasts_to ->(timesheet) { [timesheet.user, "timesheets"] },
                inserts_by: :prepend

  def total_hours
    sunday + monday + tuesday + wednesday + thursday + friday + saturday
  end
end
