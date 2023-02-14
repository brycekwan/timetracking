class InvoiceGenerator
  def initialize(vendor_id:, project_id:, start_at:, end_at:)
    @vendor_id = vendor_id
    @project_id = project_id
    @start_at = start_at
    @end_at = end_at
  end

  def create
    vendor = Vendor.find(@vendor_id)
    project = Project.find(@project_id)

    work_orders =
      project.work_orders.where(
        [
          "start_at <= :start_at AND end_at >= :end_at",
          { start_at: Date.current, end_at: Date.current },
        ],
      )

    work_orders.map do |work_order|
      timesheets =
        work_order.timesheets.where(
          [
            "start_at >= :start_at AND start_at <= :end_at",
            { start_at: @start_at, end_at: @end_at },
          ],
        )

      timesheets
        .group_by { |timesheet| timesheet.user }
        .map do |user, timesheets|
          total_hours = timesheets.map { |timesheet| timesheet.total_hours }.sum
          InvoiceItem.new description:
                            "#{user.name} - #{@start_at} to #{@end_at} (inclusive)",
                          hours: total_hours,
                          rate: work_order.rate,
                          amount: total_hours * work_order.rate
        end
        .flatten
    end
    .flatten
  end
end
