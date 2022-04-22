require 'rails_helper'

RSpec.describe MenusController do
  describe MenusController do
    describe 'GET #index' do
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      it "assigns the requested menu to @menu" do
        category = create(:category)
        menu = create(:menu, category_ids: [1])
        get :show, params: { id: menu }
        expect(assigns(:menu)).to eq menu
      end

      it "renders the :show template" do
        category = create(:category)
        menu = create(:menu, category_ids: [1])
        get :show, params: { id: menu }
        expect(response).to render_template :show
      end
    end

    describe 'GET #new' do
      it "assigns a new Menu to @menu" do
        get :new
        expect(assigns(:menu)).to be_a_new(Menu)
      end
  
      it "renders the :new template" do
        get :new
        expect(:response).to render_template :new
      end
    end

    describe 'GET #edit' do
      it "assigns the requested menu to @menu" do
        category = create(:category)
        menu = create(:menu, category_ids: [1])
        get :edit, params: { id: menu }
        expect(assigns(:menu)).to eq menu
      end
  
      it "renders the :edit template" do
        category = create(:category)
        menu = create(:menu, category_ids: [1])
        get :edit, params: { id: menu }
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create' do
      context "with valid attributes" do
        it "saves the new menu in the database" do
          expect{
            category = create(:category)
            post :create, params: { menu: attributes_for(:menu ,category_ids: [1]) }
          }.to change(Menu, :count).by(1)
        end
  
        it "redirects to menus#show" do
          category = create(:category)
          post :create, params: { menu: attributes_for(:menu, category_ids: [1]) }
          expect(response).to redirect_to(menu_path(assigns[:menu]))
        end
      end

      context "with invalid attributes" do
        it "does not save the new menu in the database" do
          expect{
            post :create, params: { menu: attributes_for(:invalid_menu) }
          }.not_to change(Menu, :count)
        end
  
        it "re-renders the :new template" do
          post :create, params: { menu: attributes_for(:invalid_menu) }
          expect(response).to render_template :new
        end
      end
    end
    
  end
end