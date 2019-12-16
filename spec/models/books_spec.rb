require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of :title, :publication_year, :pages}
    it {should have_many :book_authors}
    it {should have_many(:authors).through(:book_authors)}
  end
end
