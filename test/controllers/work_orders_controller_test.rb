require "test_helper"

class WorkOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_order = work_orders(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get work_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_work_order_url
    assert_response :success
  end

  test "should create work_order" do
    assert_difference("WorkOrder.count") do
      post work_orders_url, params: { work_order: { end_at: @work_order.end_at, project_id: @work_order.project_id, start_at: @work_order.start_at, user_id: @work_order.user_id } }
    end

    assert_redirected_to work_order_url(WorkOrder.last)
  end

  test "should show work_order" do
    get work_order_url(@work_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_order_url(@work_order)
    assert_response :success
  end

  test "should update work_order" do
    patch work_order_url(@work_order), params: { work_order: { end_at: @work_order.end_at, project_id: @work_order.project_id, start_at: @work_order.start_at, user_id: @work_order.user_id } }
    assert_redirected_to work_order_url(@work_order)
  end

  test "should destroy work_order" do
    assert_difference("WorkOrder.count", -1) do
      delete work_order_url(@work_order)
    end

    assert_redirected_to work_orders_url
  end
end
