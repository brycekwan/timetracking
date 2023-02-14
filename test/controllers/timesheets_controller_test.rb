require "test_helper"

class TimesheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timesheet = timesheets(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get timesheets_url
    assert_response :success
  end

  test "should get new" do
    get new_timesheet_url
    assert_response :success
  end

  test "should create timesheet" do
    assert_difference("Timesheet.count") do
      post timesheets_url, params: { timesheet: { friday: @timesheet.friday, monday: @timesheet.monday, work_order_id: @timesheet.work_order_id, saturday: @timesheet.saturday, start_at: @timesheet.start_at, sunday: @timesheet.sunday, thursday: @timesheet.thursday, tuesday: @timesheet.tuesday, user_id: @timesheet.user_id, wednesday: @timesheet.wednesday } }
    end

    assert_redirected_to timesheet_url(Timesheet.last)
  end

  test "should show timesheet" do
    get timesheet_url(@timesheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_timesheet_url(@timesheet)
    assert_response :success
  end

  test "should update timesheet" do
    patch timesheet_url(@timesheet), params: { timesheet: { friday: @timesheet.friday, monday: @timesheet.monday, work_order_id: @timesheet.work_order_id, saturday: @timesheet.saturday, start_at: @timesheet.start_at, sunday: @timesheet.sunday, thursday: @timesheet.thursday, tuesday: @timesheet.tuesday, user_id: @timesheet.user_id, wednesday: @timesheet.wednesday } }
    assert_redirected_to timesheet_url(@timesheet)
  end

  test "should destroy timesheet" do
    assert_difference("Timesheet.count", -1) do
      delete timesheet_url(@timesheet)
    end

    assert_redirected_to timesheets_url
  end
end
