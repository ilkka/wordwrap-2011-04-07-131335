class InvalidParameter < Exception
end

class Wordwrap
  def initialize(wrapcol)
    raise InvalidParameter, "parameter must be a Fixnum" unless wrapcol.class == Fixnum  
  end
end
