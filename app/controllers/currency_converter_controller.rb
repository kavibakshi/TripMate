class CurrencyConverterController < ApplicationController
  require 'net/http'
  require 'json'
  before_action :supported_currencies, only: [:convert]

  def convert
    @from_currency = params[:from_currency]
    @to_currency = params[:to_currency]
    amount = params[:amount].to_f

    if @from_currency.present? && @to_currency.present? && amount.present?
      url = "https://v6.exchangerate-api.com/v6/725d2d61ebbfb673bc0f4856/pair/#{@from_currency}/#{@to_currency}/#{amount}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      output = JSON.parse(response)

      # Check for successful result and calculate the conversion
      if output['result'] == 'success'
        @converted_amount = output['conversion_result']
        # Include the to_currency code in the converted amount
        @converted_amount_with_currency = "#{@converted_amount} #{@to_currency}"
      else
        @error = output['error-type']
      end
    else
      @error = "Please enter a valid amount and currency codes"
    end
  end
  def supported_currencies
  
    url = "https://v6.exchangerate-api.com/v6/725d2d61ebbfb673bc0f4856/codes"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    output = JSON.parse(response)
  
    if output['result'] == 'success'
      @currencies = output['supported_codes'].map { |code_pair| { code: code_pair[0], name: code_pair[1] } }
    else
      @error = output['error-type']
    end
  end
end
