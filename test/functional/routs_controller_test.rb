require 'test_helper'

class RoutsControllerTest < ActionController::TestCase
  setup do
    @rout = routs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rout" do
    assert_difference('Rout.count') do
      post :create, rout: {  }
    end

    assert_redirected_to rout_path(assigns(:rout))
  end

  test "should show rout" do
    get :show, id: @rout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rout
    assert_response :success
  end

  test "should update rout" do
    put :update, id: @rout, rout: {  }
    assert_redirected_to rout_path(assigns(:rout))
  end

  test "should destroy rout" do
    assert_difference('Rout.count', -1) do
      delete :destroy, id: @rout
    end

    assert_redirected_to routs_path
  end
end
