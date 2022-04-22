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
    
  end
end