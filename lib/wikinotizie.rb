require 'date'
class Wikinotizie
    def self.parse(content)
        if content.match?(/{{data\|(\d{1,2} \w+ \d{4})\|(lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)}}/i)
            match = content.match(/{{data\|(\d{1,2} \w+ \d{4})\|(lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)}}/i)
            data = match[1]
            giorno = match[2]  
            with_luogo = false
        elsif content.match?(/{{luogodata\|luogo=([a-zA-ZÀ-ÖØ-öø-ÿ]+)\|1=(lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)\|data=(\d{1,2} \w+ \d{4})}}/i)
            match = content.match(/{{luogodata\|luogo=([a-zA-ZÀ-ÖØ-öø-ÿ]+)\|1=(lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)\|data=(\d{1,2} \w+ \d{4})}}/i)
            luogo = match[1]
            giorno = match[2]
            data = match[3]
            with_luogo = true
        elsif content.match?(/{{luogodata\|(lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)\|luogo=([a-zA-ZÀ-ÖØ-öø-ÿ]+)\|data=(\d{1,2} \w+ \d{4})}}/i)
            match = content.match(/{{luogodata\|(lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)\|luogo=([a-zA-ZÀ-ÖØ-öø-ÿ]+)\|data=(\d{1,2} \w+ \d{4})}}/i)
            luogo = match[2]
            giorno = match[1]
            data = match[3]
            with_luogo = true
        elsif content.match?(/{{data\|1=(\d{1,2} \w+ \d{4})\|2=(lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)}}/i)
            match = content.match(/{{data\|1=(\d{1,2} \w+ \d{4})\|2=(lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)}}/i)
            data = match[1]
            giorno = match[2]
            with_luogo = false
        else
            return false
        end
        months = [["gennaio", "Jan"], ["febbraio", "Feb"], ["marzo", "Mar"], ["aprile", "Apr"], ["maggio", "May"], ["giugno", "Jun"], ["luglio", "Jul"], ["agosto", "Aug"], ["settembre", "Sep"], ["ottobre", "Oct"], ["novembre", "Nov"], ["dicembre", "Dec"]]
        months.each do |italian_month, english_month|
            if data.match? italian_month      
              @rubydate = DateTime.parse(data.gsub(/#{italian_month}/, english_month))
            end
        end      
        return [content, match, data, giorno, @rubydate, with_luogo] if with_luogo == false
        return [content, match, data, giorno, @rubydate, with_luogo, luogo] if with_luogo == true
    end
end
