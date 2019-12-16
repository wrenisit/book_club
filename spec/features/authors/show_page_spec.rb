require 'rails_helper'

RSpec.describe "author_showpage" do
  it "shows author's page" do
    author_1 = Author.create(name: "Charles Dickens")
    book_1 = Book.create(title:"Oliver Twist", pages: "350", publication_year: "1850")
    book_2 = Book.create(title: "A Christmas Carol", pages: "150", publication_year: "1880")
    BookAuthor.create(author_id: author_1.id, book_id: book_1.id)
    BookAuthor.create(author_id: author_1.id, book_id: book_2.id)

    visit "/authors/#{author_1.id}"

    within "#book-#{book_1.id}" do
      expect(page).to have_content(book_1.title)
    end
    within "#book-#{book_2.id}" do
      expect(page).to have_content(book_2.title)
    end
    expect(page).to have_content("Average Page Count: 250 Pages")
  end
end
