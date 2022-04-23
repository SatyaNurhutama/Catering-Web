require 'rails_helper'

RSpec.describe ReportController do
  describe ReportController do
    describe 'GET #index' do
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
    describe 'GET #date' do
      it "renders the :date template" do
        get :date
        expect(response).to render_template :date
      end
    end
    describe 'GET #email' do
      it "renders the :date template" do
        get :email
        expect(response).to render_template :email
      end
    end
    describe 'GET #total' do
      it "renders the :date template" do
        get :total
        expect(response).to render_template :total
      end
    end
  end
end