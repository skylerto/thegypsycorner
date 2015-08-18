require 'test_helper'

class Artists::PiecesControllerTest < ActionController::TestCase
  setup do
    @artists_piece = artists_pieces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists_pieces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artists_piece" do
    assert_difference('Artists::Piece.count') do
      post :create, artists_piece: { content: @artists_piece.content, image: @artists_piece.image, title: @artists_piece.title, user_id: @artists_piece.user_id }
    end

    assert_redirected_to artists_piece_path(assigns(:artists_piece))
  end

  test "should show artists_piece" do
    get :show, id: @artists_piece
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artists_piece
    assert_response :success
  end

  test "should update artists_piece" do
    patch :update, id: @artists_piece, artists_piece: { content: @artists_piece.content, image: @artists_piece.image, title: @artists_piece.title, user_id: @artists_piece.user_id }
    assert_redirected_to artists_piece_path(assigns(:artists_piece))
  end

  test "should destroy artists_piece" do
    assert_difference('Artists::Piece.count', -1) do
      delete :destroy, id: @artists_piece
    end

    assert_redirected_to artists_pieces_path
  end
end
