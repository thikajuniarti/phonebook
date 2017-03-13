require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  before {
    allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
  }

  before(:each) do
    @user = FactoryGirl.create(:user, role: 'admin')
    sign_in @user
    request.headers["accept"] = 'application/javascript'
  end

  let (:data) { FactoryGirl.create(:book) }

  describe 'POST create' do
    context 'with valid attributes' do
      it 'creates data phone book' do
        post :create, params: { book: FactoryGirl.attributes_for(:book) }, xhr: true
        expect(Book.count).to eq(1)
      end

      it 'redirect to action index after create data' do
        post :create, params: { book: FactoryGirl.attributes_for(:book) }
        expect(response).to redirect_to books_path
      end
    end

    context 'with invalid attributes' do
      it 'creates data phone book when name is nil' do
        post :create, params: { book: FactoryGirl.attributes_for(:book, name: nil) }, xhr: true
        expect(Book.count).to eq(0)
      end

      it 'creates data phone book when number is nil' do
        post :create, params: { book: FactoryGirl.attributes_for(:book, number: nil) }, xhr: true
        expect(Book.count).to eq(0)
      end

      it 'render file new after create data when attribut is false' do
        post :create, params: { book: FactoryGirl.attributes_for(:book, name:nil, number: nil) }, xhr: true
        expect(response).to render_template :new
      end
    end
  end

  describe 'POST update' do
    context 'with valid attributes' do
      it 'update data phone book' do
        put :update, params: { id: data, book: FactoryGirl.attributes_for(:book, name: "nyoman") }, xhr: true
        data.reload
        expect(data.name).to eq("nyoman")
      end

      it 'redirect to action index after update data' do
        put :update, params: { id: data, book: FactoryGirl.attributes_for(:book, name: "nyoman") }
        data.reload
        expect(response).to redirect_to books_path
      end
    end

    context 'with invalid attributes' do
      it 'update data phone book when name not consist letters' do
        put :update, params: { id: data, book: FactoryGirl.attributes_for(:book, name: "12345678") }, xhr: true
        data.reload
        assigns(:book).should eq(data)
      end

      it 'render file new after update data when attribut is false' do
        put :update, params: { id: data, book: FactoryGirl.attributes_for(:book, name: "12345678") }, xhr: true
        data.reload
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @data = FactoryGirl.create(:book)
    end

    it 'delete data' do
      expect {
        delete :destroy, params: { id: @data }
      }.to change(Book,:count).by(-1)
    end

    it 'redirect to index' do
      delete :destroy, params: { id: @data }
      response.should redirect_to books_path
    end
  end

end
