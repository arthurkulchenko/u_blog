class UserValidationService
  WHITESPACE_PATTERN = /\A[[:space:]#{"\u200B\u200C\u200D\u2060\uFEFF"}]*\z/
  def self.perform params
    schema = Dry::Validation.Schema do
      configure do
        config.messages_file = 'dry-files/errors.yml'
        option :login

        def unique?(attr_name, value)
          User.where(attr_name => value).empty?
        end

        def non_blank?(input)
          !(WHITESPACE_PATTERN =~ input)
        end

      end
      required(:login).filled(:str?, unique?: :login)
      # required(:login).filled(:non_blank?)
    end
    result = schema.with(login: params[:login]).call(params) 
  end

end