class InvalidParameter < Exception
end

class Wordwrap
  def initialize(wrapcol)
    raise InvalidParameter, "parameter must be a Fixnum" unless wrapcol.class == Fixnum  
  end

  def wrap(text)
    raise InvalidParameter, "parameter must be a String" unless text.class == String
    ""
  end
end
