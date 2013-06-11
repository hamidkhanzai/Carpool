require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post :create, report: { car_number_plate: @report.car_number_plate, driver_lastname: @report.driver_lastname, driver_name: @report.driver_name, report_body: @report.report_body, travel_date: @report.travel_date, travel_from: @report.travel_from, travel_time: @report.travel_time, travel_to: @report.travel_to }
    end

    assert_redirected_to report_path(assigns(:report))
  end

  test "should show report" do
    get :show, id: @report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    put :update, id: @report, report: { car_number_plate: @report.car_number_plate, driver_lastname: @report.driver_lastname, driver_name: @report.driver_name, report_body: @report.report_body, travel_date: @report.travel_date, travel_from: @report.travel_from, travel_time: @report.travel_time, travel_to: @report.travel_to }
    assert_redirected_to report_path(assigns(:report))
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end
end
