require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcategory" do
    assert_difference('Subcategory.count') do
      post :create, :subcategory => { }
    end

    assert_redirected_to subcategory_path(assigns(:subcategory))
  end

  test "should show subcategory" do
    get :show, :id => subcategories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => subcategories(:one).to_param
    assert_response :success
  end

  test "should update subcategory" do
    put :update, :id => subcategories(:one).to_param, :subcategory => { }
    assert_redirected_to subcategory_path(assigns(:subcategory))
  end

  test "should destroy subcategory" do
    assert_difference('Subcategory.count', -1) do
      delete :destroy, :id => subcategories(:one).to_param
    end

    assert_redirected_to subcategories_path
  end
end
