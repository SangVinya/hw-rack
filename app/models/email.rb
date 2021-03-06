module EmailCollector
  class Email
    attr_reader :email, :errors

    def initialize(email)
      @email = email
    end

    def save
      if @email =~ /^[\w_.+-]+@[\w_-]+\.[\w]{2,6}$/
        @errors = ""
        File.open(EmailCollector::DATABASE, "a") { |line| line.puts @email }
        true
      else
        @errors = "Wrong email format."
        false
      end
    end
  end
end
