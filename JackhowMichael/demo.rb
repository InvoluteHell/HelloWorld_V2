#!/usr/bin/ruby

#
# Betterave -- Programmation fonctionnelle obscure
#

class Source
	attr_reader :index, :stuff

	def initialize(stuff)
		@stuff = stuff
		@index = -1
		@vars = Hash.new(0)
		@strings = []
		@tacks = []
	end

	def oops(mess)
		print mess
		exit 1
	end

	def parse()
		@index += 1

		if @index >= @stuff.length then
			exit
		end

		case @stuff[@index,1]

		# Commentaires
		when "~"
			temp = @stuff.index("~",@index + 1)
			if temp == nil then
				oops "Unmatched comment!\n"
			end
			@index = temp

		# Opérations mathématiques de base
		when /\d/
			return @stuff[@index,1].to_i
		when "+"
			return parse() + parse()
		when "-"
			return parse() - parse()
		when "*"
			return parse() * parse()
		when "/"
			return parse() / parse()
		when "%"
			return parse() % parse()
		when "="
			return parse() == parse() ? 1 : 0
		when "<"
			return parse() < parse() ? 1 : 0
		when ">"
			return parse() > parse() ? 1 : 0

		# Manipulation de strings (léopard)
		when "\""
			temp = @stuff.index("\"", @index + 1)
			if temp == nil then
				oops "Unmatched string!\n"
			end
			@strings << @stuff[ (@index + 1) ... temp ]
			@index = temp
			return @strings.length
		when "#"
			temp = parse()
			if temp < 0 or temp >= @strings.length then
				return -1
			else
				@strings[temp] << parse().to_s
			end
		when "&"
			temp = parse()
			if temp < 0 or temp >= @strings.length then
				return -1
			else
				char = parse()
				unless char < 0 or char > 255 then
					@strings[temp] << char.chr
				end
				return char
			end
		when "\\"
			temp = parse()
			if temp < 0 or temp >= @strings.length then
				return -1
			else
				if @strings[temp].empty? then
					return -1
				else
					char = @strings[temp][0]
					@strings[temp] = @strings[temp][1..-1]
					return char
				end
			end
		when "_"
			temp = parse()
			if temp < 0 or temp >= @strings.length then
				return -1
			else
				@strings.delete_at(temp)
				return temp
			end

		# Structure
		when "["
			@tacks << @index
		when "|"
			temp = parse()
			if temp != 0 then
				if @tacks.length == 0 then
					@index = -1
				else
					@index = @tacks.last
				end
			else
				endtack = @stuff.index("]", @index)
				if endtack == nil then
					oops "Unmatched tack!\n"
				end
				@tacks.pop
				@index = endtack
			end
		when "?"
			if parse() == 0 then
				ifelse = @stuff.index("!", @index)
				if ifelse == nil then
					oops "Unmatched if!\n"
				end
				@index = ifelse
			end
		when "@"
			exit

		# Input
		when ":"
			return gets.to_i
		when ";"
			temp = @strings.length
			@strings << gets
			return temp

		# Output
		when "."
			temp = parse()
			print temp
			return temp
		when ","
			temp = parse()
			if temp < 0 or temp > 255 then
				return 0
			end
			print temp.chr
			return temp
		when "$"
			temp = parse()
			if temp < 0 or temp >= @strings.length then
				return -1
			else
				string = @strings[temp]
				unless string == nil then
					print string
				end
				return temp
			end

		# Manipulation de variables
		when /[A-Z]/
			@vars[@stuff[@index,1]] = parse()
		when /[a-z]/
			return @vars[@stuff[@index,1].upcase]

		else
			return parse()
		end
	end
end

source = Source.new(File.readlines(ARGV[0]).join)

while source.index < (source.stuff.length - 1)
	source.parse()
end