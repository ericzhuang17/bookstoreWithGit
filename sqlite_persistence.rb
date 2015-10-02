require 'sequel'
require 'sqlite3'
require 'logger'
require_relative 'book'

  class SQLitePersistence 

  def initialize (data_base)
      @data_base_file = data_base
      @DB = nil
   end

  def loadData 
       @DB = Sequel.sqlite(@data_base_file ) 
     @DB.loggers << Logger.new($stdout)
  end

  def storeData
  end

  def isbnSearch isbn
     dataset = @DB[:books].where(:isbn => isbn)
     objects = object_relational_mapper dataset
     objects[0]
  end

  def authorSearch(author)
        dataset = @DB[:books].where(:author => author)
      object_relational_mapper dataset
  end

   def updateBook book
     books = @DB[:books].where(:isbn => book.isbn)
     books.update(:author => book.author, 
                 :title => book.title, 
                 :price => book.price, 
                 :quantity => book.quantity )
  end

private
  def object_relational_mapper dataset
    books = []
    dataset.each do |d|
        books << Book.new(d[:isbn], d[:title],
                               d[:author],d[:price],
                               d[:category],d[:quantity])
    end
    books
  end



end 