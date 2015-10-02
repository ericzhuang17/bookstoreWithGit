class Book      

      attr_reader   :isbn 
      attr_accessor :price, :title, :author, :category, :quantity

      def initialize(isbn, title, author, price, category, quantity)
        @isbn  = isbn
        @author = author
        @title = title
        @price = Float(price)
        @category = category
        @quantity = quantity
      end  

      def to_s
          "#{@isbn} - #{@title} by #{@author}. #{@category}. Price #{@price} In-stock #{@quantity}"
      end
    end