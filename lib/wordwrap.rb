class InvalidParameter < Exception
end

class Wordwrap
  def initialize(wrapcol)
    raise InvalidParameter, "parameter must be a Fixnum" unless wrapcol.class == Fixnum
    @wrapcol = wrapcol
  end

  def wrap(text)
    raise InvalidParameter, "parameter must be a String" unless text.class == String
    col = 0
    text.split.inject("") do |str,word|
      if col > 0
        if col + word.length + 1 > @wrapcol
          col = word.length
          str << "\n"
        else
          col += word.length + 1
          str << " "
        end
      else
        col += word.length
      end
      str << word
    end
  end
end
