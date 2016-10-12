#!/usr/bin/env ruby
# encoding: utf-8
require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require './bundle/bundler/setup'
require 'alfred'
require 'clipboard'
require 'json'
require 'net/http'

def raise_error(alfred, message)
  alfred.with_rescue_feedback = true
  raise Alfred::NoBundleIDError, message
end

Alfred.with_friendly_error do |alfred|
  fb = alfred.feedback

  sql_script = Clipboard.paste
  if sql_script.nil? || sql_script.empty?
    raise_error alfred, 'Copy to clipboard an SQL query first!'
  end

  url= URI("https://sqlformat.org/api/v1/format")
  params = {
      :sql => sql_script,
      :reindent => 1,
      :keyword_case => 'upper',
      :strip_comments => 0
  }

  response = Net::HTTP.post_form(url, params)

  case response.code
    when 400
      raise_error alfred, 'The SQL query you copied into clipboard is invalid or malformed!'
    when 429
      raise_error alfred, 'You exceeded the API limit of 500 requests per hour per IP!'
    when 500
      raise_error alfred, 'Something went incredibly wrong! :-('
    else
      formatted_sql_script = JSON.parse(response.body)['result']

      if formatted_sql_script.nil? || formatted_sql_script.empty?
        raise_error alfred, 'For some reason, the resulting query is empty. Try again? :-/'
      end

      fb.add_item({
                      :uid => '',
                      :title => 'Copy formatted SQL script to clipboard',
                      :subtitle => 'and insert it in the currently active window',
                      :arg => formatted_sql_script,
                      :valid => 'yes',
                  })
      puts fb.to_alfred
  end
end



