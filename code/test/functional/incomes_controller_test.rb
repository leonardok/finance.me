require 'test_helper'

class IncomesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income" do
    assert_difference('Income.count') do
      post :create, :income => { }
    end

    assert_redirected_to income_path(assigns(:income))
  end

  test "should show income" do
    get :show, :id => incomes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => incomes(:one).to_param
    assert_response :success
  end

  test "should update income" do
    put :update, :id => incomes(:one).to_param, :income => { }
    assert_redirected_to income_path(assigns(:income))
  end

  test "should destroy income" do
    assert_difference('Income.count', -1) do
      delete :destroy, :id => incomes(:one).to_param
    end

    assert_redirected_to incomes_path
  end
end
