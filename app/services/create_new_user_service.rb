class CreateNewUserService

  def self.perform params
    @validation_result = UserValidationService.perform(params)

    if @validation_result.success?
      @user = User.create(params)
    else
      # status 422
      @validation_result.errors
    end
  end

end