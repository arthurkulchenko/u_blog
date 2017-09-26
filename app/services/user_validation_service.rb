class UserValidationService
  WHITESPACE_PATTERN = /\A[[:space:]#{"\u200B\u200C\u200D\u2060\uFEFF"}]*\z/
  def self.perform params
    schema = Dry::Validation.Schema do
      configure do
        config.messages_file = 'dry-files/errors.yml'

        def unique?(attr_name, value)
          # User.where(attr_name => value).empty?
          User.find_by_sql("select login from users where login ilike '#{value}'").empty?
        end

        def non_blank?(value)
          !(WHITESPACE_PATTERN =~ value)
        end

      end
      required(:login).filled(:str?, unique?: :login)
      # required(:login).filled(:non_blank?)
    end
    result = schema.call(params) 
  end

end