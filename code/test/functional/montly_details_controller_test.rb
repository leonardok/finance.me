require 'test_helper'

class MontlyDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:montly_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create montly_detail" do
    assert_difference('MontlyDetail.count') do
      post :create, :montly_detail => { }
    end

    assert_redirected_to montly_detail_path(assigns(:montly_detail))
  end

  test "should show montly_detail" do
    get :show, :id => montly_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => montly_details(:one).to_param
    assert_response :success
  end

  test "should update montly_detail" do
    put :update, :id => montly_details(:one).to_param, :montly_detail => { }
    assert_redirected_to montly_detail_path(assigns(:montly_detail))
  end

  test "should destroy montly_detail" do
    assert_difference('MontlyDetail.count', -1) do
      delete :destroy, :id => montly_details(:one).to_param
    end

    assert_redirected_to montly_details_path
  end
end
