require "application_system_test_case"

class TimesheetsTest < ApplicationSystemTestCase
  setup do
    @timesheet = timesheets(:one)
  end

  test "visiting the index" do
    visit timesheets_url
    assert_selector "h1", text: "Timesheets"
  end

  test "should create timesheet" do
    visit timesheets_url
    click_on "New timesheet"

    fill_in "Friday", with: @timesheet.friday
    fill_in "Monday", with: @timesheet.monday
    fill_in "Project", with: @timesheet.project_id
    fill_in "Saturday", with: @timesheet.saturday
    fill_in "Start at", with: @timesheet.start_at
    fill_in "Sunday", with: @timesheet.sunday
    fill_in "Thursday", with: @timesheet.thursday
    fill_in "Tuesday", with: @timesheet.tuesday
    fill_in "User", with: @timesheet.user_id
    fill_in "Wednesday", with: @timesheet.wednesday
    click_on "Create Timesheet"

    assert_text "Timesheet was successfully created"
    click_on "Back"
  end

  test "should update Timesheet" do
    visit timesheet_url(@timesheet)
    click_on "Edit this timesheet", match: :first

    fill_in "Friday", with: @timesheet.friday
    fill_in "Monday", with: @timesheet.monday
    fill_in "Project", with: @timesheet.project_id
    fill_in "Saturday", with: @timesheet.saturday
    fill_in "Start at", with: @timesheet.start_at
    fill_in "Sunday", with: @timesheet.sunday
    fill_in "Thursday", with: @timesheet.thursday
    fill_in "Tuesday", with: @timesheet.tuesday
    fill_in "User", with: @timesheet.user_id
    fill_in "Wednesday", with: @timesheet.wednesday
    click_on "Update Timesheet"

    assert_text "Timesheet was successfully updated"
    click_on "Back"
  end

  test "should destroy Timesheet" do
    visit timesheet_url(@timesheet)
    click_on "Destroy this timesheet", match: :first

    assert_text "Timesheet was successfully destroyed"
  end
end
