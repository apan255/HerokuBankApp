require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post :create, transaction: {amount: @transaction.amount, end_date: @transaction.end_date, from_account_id: @transaction.from_account, start_date: @transaction.start_date, status: @transaction.status, to_account_id: @transaction.to_account, trans_from_id: @transaction.trans_from_id, trans_to_id: @transaction.trans_to_id, trans_type: @transaction.type }
    end

    assert_redirected_to transaction_path(assigns(:transaction))
  end

  test "should show transaction" do
    get :show, id: @transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaction
    assert_response :success
  end

  test "should update transaction" do
    patch :update, id: @transaction, transaction: {amount: @transaction.amount, end_date: @transaction.end_date, from_account_id: @transaction.from_account, start_date: @transaction.start_date, status: @transaction.status, to_account_id: @transaction.to_account, trans_from_id: @transaction.trans_from_id, trans_to_id: @transaction.trans_to_id, trans_type: @transaction.type }
    assert_redirected_to transaction_path(assigns(:transaction))
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete :destroy, id: @transaction
    end

    assert_redirected_to transactions_path
  end
end
