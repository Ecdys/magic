require 'test_helper'

class ImplantationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Implantation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Implantation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Implantation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to implantation_url(assigns(:implantation))
  end

  def test_edit
    get :edit, :id => Implantation.first
    assert_template 'edit'
  end

  def test_update_invalid
    Implantation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Implantation.first
    assert_template 'edit'
  end

  def test_update_valid
    Implantation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Implantation.first
    assert_redirected_to implantation_url(assigns(:implantation))
  end

  def test_destroy
    implantation = Implantation.first
    delete :destroy, :id => implantation
    assert_redirected_to implantations_url
    assert !Implantation.exists?(implantation.id)
  end
end
