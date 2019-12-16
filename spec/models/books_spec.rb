require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of :pages}
    it {should validate_presence_of :title}
    it {should validate_presence_of :publication_year}
    it {should have_many :book_authors}
    it {should have_many(:authors).through(:book_authors)}
  end

  it "has page count method" do
    author_1 = Author.create(name: "Charles Dickens")
    book_1 = Book.create(title:"Oliver Twist", pages: "350", publication_year: "1850")
    book_2 = Book.create(title: "A Christmas Carol", pages: "150", publication_year: "1880")
    BookAuthor.create(author_id: author_1.id, book_id: book_1.id)
    BookAuthor.create(author_id: author_1.id, book_id: book_2.id)

    expect(author_1.page_count(author_1.id)).to eq(250)
  end
end
