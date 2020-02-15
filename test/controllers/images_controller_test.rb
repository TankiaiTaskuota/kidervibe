# frozen_string_literal: true

require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
  end

  test 'should get index' do
    get images_url
    assert_response :success
  end

  test 'should get new' do
    get new_image_url
    assert_response :success
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post images_url, params: { image: { app_id: @image.app_id,
                                          childern_id: @image.childern_id,
                                          comment: @image.comment,
                                          ext: @image.ext,
                                          image_path: @image.image_path,
                                          image_url: @image.image_url } }
    end

    assert_redirected_to image_url(Image.last)
  end

  test 'should show image' do
    get image_url(@image)
    assert_response :success
  end

  test 'should get edit' do
    get edit_image_url(@image)
    assert_response :success
  end

  test 'should update image' do
    patch image_url(@image), params: { image: { app_id: @image.app_id,
                                                childern_id: @image.childern_id,
                                                comment: @image.comment,
                                                ext: @image.ext,
                                                image_path: @image.image_path,
                                                image_url: @image.image_url } }
    assert_redirected_to image_url(@image)
  end

  test 'should destroy image' do
    assert_difference('Image.count', -1) do
      delete image_url(@image)
    end

    assert_redirected_to images_url
  end
end
