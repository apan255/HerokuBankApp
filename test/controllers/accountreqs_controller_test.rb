require 'test_helper'

class AccountreqsControllerTest < ActionController::TestCase
  setup do
    @accountreq = accountreqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accountreqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accountreq" do
    assert_difference('Accountreq.count') do
      post :create, accountreq: {  }
    end

    assert_redirected_to accountreq_path(assigns(:accountreq))
  end

  test "should show accountreq" do
    get :show, id: @accountreq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accountreq
    assert_response :success
  end

  test "should update accountreq" do
    patch :update, id: @accountreq, accountreq: {  }
    assert_redirected_to accountreq_path(assigns(:accountreq))
  end

  test "should destroy accountreq" do
    assert_difference('Accountreq.count', -1) do
      delete :destroy, id: @accountreq
    end

    assert_redirected_to accountreqs_path
  end
end
