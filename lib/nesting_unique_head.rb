# Nested unique header generation
require 'middleman-core/renderers/redcarpet'

class NestingUniqueHeadCounter < Middleman::Renderers::MiddlemanRedcarpetHTML
  def initialize
    super
    @@headers_history = {} if !defined?(@@headers_history)
    @@headers_seen = {} if !defined?(@@headers_seen)
  end

  def header(text, header_level)
    friendly_text = text.gsub(/<[^>]*>/,"").parameterize

    # We have one hardcoded special case for the "Properties" header, which is used in every endpoint group.
    has_seen = @@headers_seen.key?(friendly_text) || friendly_text == 'properties'

    @@headers_history[header_level] = text.parameterize

    # Prepending just the top-level header key should be more than enough for us.
    if has_seen && header_level > 1
      friendly_text.prepend("#{@@headers_history[1]}-") if @@headers_history.key?(1)
    end

    @@headers_seen[friendly_text] = true

    return "<h#{header_level} id='#{friendly_text}'>#{text}</h#{header_level}>"
  end
end