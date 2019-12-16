require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of :pages}
    it {should validate_presence_of :title}
    it {should validate_presence_of :publication_year}
    it {should have_many :book_authors}
    it {should have_many(:authors).through(:book_authors)}
  end
end
