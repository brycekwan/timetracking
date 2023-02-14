require "test_helper"

class TimesheetTest < ActiveSupport::TestCase
  test "total_hours" do
    timesheet =
      Timesheet.new sunday: 0,
                    monday: 1,
                    tuesday: 2,
                    wednesday: 3,
                    thursday: 4,
                    friday: 5,
                    saturday: 6

    assert_equal 21, timesheet.total_hours
  end

  test "total_hours with null values" do
    timesheet = Timesheet.new wednesday: 3, thursday: 4, friday: 5

    assert_equal 12, timesheet.total_hours
  end

  test "hours entered must be between 0 and 24" do
    timesheet =
      Timesheet.new sunday: -1,
                    monday: -1,
                    tuesday: -1,
                    wednesday: 25,
                    thursday: 24.1,
                    friday: -2.0,
                    saturday: 88

    timesheet.validate

    assert_includes timesheet.errors.full_messages, "Sunday must be in 0..24"
    assert_includes timesheet.errors.full_messages, "Monday must be in 0..24"
    assert_includes timesheet.errors.full_messages, "Tuesday must be in 0..24"
    assert_includes timesheet.errors.full_messages, "Wednesday must be in 0..24"
    assert_includes timesheet.errors.full_messages, "Thursday must be in 0..24"
    assert_includes timesheet.errors.full_messages, "Friday must be in 0..24"
    assert_includes timesheet.errors.full_messages, "Saturday must be in 0..24"
  end

  test "timesheet is invoiced when id exists" do
    timesheet = Timesheet.new invoice: (Invoice.new id: 10)

    assert_equal timesheet.invoiced?, true
  end
end
