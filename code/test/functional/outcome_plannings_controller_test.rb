require 'test_helper'

class OutcomePlanningsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outcome_plannings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outcome_planning" do
    assert_difference('OutcomePlanning.count') do
      post :create, :outcome_planning => { }
    end

    assert_redirected_to outcome_planning_path(assigns(:outcome_planning))
  end

  test "should show outcome_planning" do
    get :show, :id => outcome_plannings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => outcome_plannings(:one).to_param
    assert_response :success
  end

  test "should update outcome_planning" do
    put :update, :id => outcome_plannings(:one).to_param, :outcome_planning => { }
    assert_redirected_to outcome_planning_path(assigns(:outcome_planning))
  end

  test "should destroy outcome_planning" do
    assert_difference('OutcomePlanning.count', -1) do
      delete :destroy, :id => outcome_plannings(:one).to_param
    end

    assert_redirected_to outcome_plannings_path
  end
end
