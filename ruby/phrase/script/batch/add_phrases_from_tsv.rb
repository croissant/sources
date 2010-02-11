require 'optparse'
class AddPhrasesFromTsv
  def self.execute(file)
    f = open(file)
    f.each {|line|
      phrase, detail, type = line.split("\t").collect {|v| v.strip}
      p = Phrase.new
      p.phrase  = phrase
      p.detail  = detail
      p.type_id = type.to_i
      p.save
    }
  end
end

file = nil
OptionParser.new do |opt|
  opt.on('-f xxx') {|v|
    file = v
  }
  opt.parse!(ARGV)
end

if nil != file && File.exists?(file)
  AddPhrasesFromTsv.execute(file)
end
