require 'nokogiri'

f = File.open("ips80.txt")
%x[echo > result.txt]
f.each_with_index { |line, index|
  final_string = ""
  old_tech = ""
  html_result = %x[curl -Lsm 1 #{line}]
  title = Nokogiri::HTML.parse(html_result).title
  if html_result.include?("WordPress")
    old_tech += "WordPress "
  end
  if html_result.include?("HTML 4.01")
    old_tech += "HTML4 "
  end
  if html_result.include?("XHTML")
    old_tech += "XHTML "
  end
  unless html_result.include?("!DOCTYPE html") || html_result.include?("!doctype html")
    old_tech += "Missing doctype "
  end
  old_tech = old_tech.chomp
  unless title.nil?
    begin
      unless title.empty?
        final_string = "#{title.strip} - #{line.strip} - #{old_tech}".strip
      end
    rescue ArgumentError => e
      final_string = "#{title} - #{line.strip} - #{old_tech}"
    ensure
    end
  end
  %x[echo "#{final_string.chomp}" >> result.txt] unless final_string.empty?
}
puts "Hotovo"
