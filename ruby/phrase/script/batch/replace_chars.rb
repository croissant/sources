require 'cgi'
class ReplaceChars
  def self.execute
    data = Phrase.find(:all)
    data.each do |row|
      row['phrase'] = replace_char(row['phrase'])
      row.save
    end
  end

  def self.replace_char(str)
    str.sub!(/O[Ee]/, '&#x0152;') 
    str.sub!('oe', '&#x0153;')
    CGI.unescapeHTML(str)
  end
end

ReplaceChars.execute
