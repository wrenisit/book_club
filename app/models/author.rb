class Author < ApplicationRecord
  validates_presence_of :name
  has_many :book_authors
  has_many :books, through: :book_authors

  def page_count(author_id)
    author = Author.find(author_id)
    pages = 0
    author.books.each do |book|
      pages += book.pages
    end
    total = (pages / author.books.count).round(2)
  end
end
