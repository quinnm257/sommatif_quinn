require "test_helper"

class OrderAlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_album = order_albums(:one)
  end

  test "should get index" do
    get order_albums_url
    assert_response :success
  end

  test "should get new" do
    get new_order_album_url
    assert_response :success
  end

  test "should create order_album" do
    assert_difference("OrderAlbum.count") do
      post order_albums_url, params: { order_album: { album_copy_id: @order_album.album_copy_id, order_id: @order_album.order_id } }
    end

    assert_redirected_to order_album_url(OrderAlbum.last)
  end

  test "should show order_album" do
    get order_album_url(@order_album)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_album_url(@order_album)
    assert_response :success
  end

  test "should update order_album" do
    patch order_album_url(@order_album), params: { order_album: { album_copy_id: @order_album.album_copy_id, order_id: @order_album.order_id } }
    assert_redirected_to order_album_url(@order_album)
  end

  test "should destroy order_album" do
    assert_difference("OrderAlbum.count", -1) do
      delete order_album_url(@order_album)
    end

    assert_redirected_to order_albums_url
  end
end
